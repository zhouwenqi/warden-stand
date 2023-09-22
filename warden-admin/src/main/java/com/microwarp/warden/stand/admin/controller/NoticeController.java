package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysMessageMapstruct;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysNoticeMapstruct;
import com.microwarp.warden.stand.admin.domain.pojo.SseMessage;
import com.microwarp.warden.stand.admin.domain.vo.SysMessageVO;
import com.microwarp.warden.stand.admin.domain.vo.SysNoticeCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysNoticeUpdateRequest;
import com.microwarp.warden.stand.admin.service.SseService;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.enums.*;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import com.microwarp.warden.stand.facade.sysmessage.service.SysMessageService;
import com.microwarp.warden.stand.facade.sysnotice.dto.SysNoticeDTO;
import com.microwarp.warden.stand.facade.sysnotice.service.SysNoticeService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * controller - 系统公告
 * @author zhouwenqi
 */
@RestController
public class NoticeController extends BaseController {
    @Autowired
    private SysNoticeService sysNoticeService;
    @Autowired
    private SseService sseService;
    @Autowired
    private SysMessageService sysMessageService;
    @Resource(name = "taskExecutor")
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    /**
     * 查询公告信息
     * @param id 公告ID
     * @return
     */
    @GetMapping("/notice/{id}")
    public ResultModel getNotice(@PathVariable("id") Long id) {
        if(null == id){
            throw new WardenRequireParamterException("公告ID不能为空");
        }
        SysNoticeDTO sysNoticeDTO = sysNoticeService.findById(id);
        if(null == sysNoticeDTO){
            throw new WardenParamterErrorException("公告信息不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("notice", SysNoticeMapstruct.Instance.sysNoticeDtoToSysNoticeVO(sysNoticeDTO));
        return resultModel;
    }

    /**
     * 创建公告信息
     * @param createRequest 公告信息
     * @return
     */
    @PostMapping("/notice")
    @PreAuthorize("hasAuthority('notice:create')")
    public ResultModel postNotice(@Validated @RequestBody SysNoticeCreateRequest createRequest){
        SysNoticeDTO sysNoticeDTO = SysNoticeMapstruct.Instance.sysNoticeCreateRequestToSysNoticeDTO(createRequest);
        SysNoticeDTO newNotice = sysNoticeService.create(sysNoticeDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("notice", SysNoticeMapstruct.Instance.sysNoticeDtoToSysNoticeVO(newNotice));
        // 写入日志
        writeLog("创建系统公告:"+newNotice.getTitle(), ActionTypeEnum.CREATE, ModuleTypeEnum.SYS_NOTICE,newNotice.getId());
        return resultModel;
    }

    /**
     * 更新公告信息
     * @param updateRequest 公告信息
     * @return
     */
    @PatchMapping("/notice")
    @PreAuthorize("hasAuthority('notice:modify')")
    public ResultModel postNotice(@Validated @RequestBody SysNoticeUpdateRequest updateRequest){
        SysNoticeDTO sysNoticeDTO = SysNoticeMapstruct.Instance.sysNoticeUpdateRequestToSysNoticeDTO(updateRequest);
        sysNoticeService.update(sysNoticeDTO);
        // 写入日志
        writeLog("修改系统公告:"+sysNoticeDTO.getTitle(), ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_NOTICE,sysNoticeDTO.getId());
        return ResultModel.success();
    }

    /**
     * 推送公告信息(推送给所有系统用户)
     * @param id 公告ID
     * @return
     */
    @GetMapping("/notices/push/{id}")
    public ResultModel pushNotice(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("公告ID不能为空");
        }
        SysNoticeDTO sysNoticeDTO = sysNoticeService.findById(id);
        if(null == sysNoticeDTO){
            throw new WardenParamterErrorException("公告信息不存在");
        }

        if(sysNoticeDTO.getDisabled()){
            throw new WardenParamterErrorException("禁用消息不可推送");
        }
        SysUserDetailsDTO sysUserDetailsDTO = SecurityUtil.getCurrentSysUser();
        /** 系统消息和推送消息是两个不同业的内容 */


        threadPoolTaskExecutor.execute(()->{
            long msgId = System.currentTimeMillis();
            // 系统消息
            SysMessageDTO sysMessageDTO = new SysMessageDTO();
            sysMessageDTO.setMsgType(MessageTypeEnum.NOTICE);
            sysMessageDTO.setFromId(sysUserDetailsDTO.getId());
            sysMessageDTO.setFromPlatform(PlatformTypeEnum.BACKSTAGE);
            sysMessageDTO.setToPlatform(PlatformTypeEnum.BACKSTAGE);
            sysMessageDTO.setTitle(sysNoticeDTO.getTitle());
            sysMessageDTO.setContent(sysNoticeDTO.getContent());
            sysMessageDTO.setMetaId(id);
            sysMessageService.writeByAllSysUser(sysMessageDTO);

            // 推送消息
            SseMessage<SysMessageVO> sseMessage = new SseMessage<>();
            sseMessage.setMsgId(msgId);
            sseMessage.setTopic(TopicEnum.MSG_PUSH);
            sseMessage.setBody(SysMessageMapstruct.Instance.sysMessageDtoToSysMessageVO(sysMessageDTO));
            sseService.sendMessageByAll(sseMessage);
        });
        SysNoticeDTO updateDTO = new SysNoticeDTO();
        updateDTO.setId(id);
        updateDTO.setServed(true);
        sysNoticeService.update(sysNoticeDTO);
        // 写入日志
        writeLog("推送公告消息:"+sysNoticeDTO.getTitle(), ActionTypeEnum.PUSH, ModuleTypeEnum.SYS_NOTICE,sysNoticeDTO.getId());
        return ResultModel.success();
    }

    /**
     * 删除公告信息
     * @param id 公告ID
     * @return
     */
    @DeleteMapping("/notice/{id}")
    @PreAuthorize("hasAuthority('notice:delete')")
    public ResultModel deleteNotice(@PathVariable Long[] id){
        if(null != id && id.length>0){
            sysNoticeService.delete(id);
            writeLog("删除公告信息:["+ Arrays.toString(id)+"]", ActionTypeEnum.DELETE, ModuleTypeEnum.SYS_NOTICE,id);

        }
        return ResultModel.success();
    }

    /**
     * 分页查询公告信息
     * @param searchPageable 分页参数
     * @return
     */
    @PostMapping("/notices/search")
    public ResultModel postNotice(@RequestBody SearchPageable<BasicSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysNoticeDTO> resultPage = sysNoticeService.findPage(searchPageable);
        resultModel.addData("list",SysNoticeMapstruct.Instance.sysNoticeDTOsToSysNoticeVOs(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }
}
