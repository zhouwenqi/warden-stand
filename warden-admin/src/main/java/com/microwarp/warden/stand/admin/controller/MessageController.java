package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysMessageMapstruct;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageSearchDTO;
import com.microwarp.warden.stand.facade.sysmessage.service.SysMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * controller - 系统消息
 * @author zhouwenqi
 */
@RestController
public class MessageController extends BaseController {
    @Autowired
    private SysMessageService sysMessageService;

    /**
     * 查询系统消息
     * @param id 消息ID
     * @return
     */
    @GetMapping("/message/{id}")
    public ResultModel getMessage(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("消息ID不能为空");
        }
        JwtUser jwtUser = getJwtUser();
        SysMessageDTO sysMessageDTO = sysMessageService.findById(id,jwtUser);
        if(null == sysMessageDTO){
            throw new WardenParamterErrorException("系统消息不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("message",SysMessageMapstruct.Instance.sysMessageDtoToSysMessageVO(sysMessageDTO));
        return resultModel;
    }

    /**
     * 阅读消息
     * @param id 消息ID
     * @return
     */
    @PatchMapping("/message/reading/{id}")
    public ResultModel reading(@PathVariable Long[] id){
        if(null != id && id.length>0) {
            JwtUser jwtUser = getJwtUser();
            sysMessageService.read(id,jwtUser);
        }
        return ResultModel.success();
    }

    /**
     * 阅读所有消息
     * @return
     */
    @PatchMapping("/messages/reading")
    public ResultModel readingAll(){
        JwtUser jwtUser = getJwtUser();
        sysMessageService.readAll(jwtUser);
        return ResultModel.success();
    }

    /**
     * 获取消息未读数
     * @return
     */
    @GetMapping("/messages/unread")
    public ResultModel unread(){
        ResultModel resultModel = ResultModel.success();
        JwtUser jwtUser = getJwtUser();
        resultModel.addData("total",sysMessageService.totalUnread(jwtUser));
        return resultModel;
    }

    /**
     * 删除系统消息
     * @param id 消息ID
     * @return
     */
    @DeleteMapping("/message/{id}")
    public ResultModel deleteMessage(@PathVariable Long[] id){
        JwtUser jwtUser = getJwtUser();
        if(null != id && id.length>0){
            sysMessageService.delete(id,jwtUser);
            writeLog("删除系统消息:["+ Arrays.toString(id)+"]", ActionTypeEnum.DELETE, ModuleTypeEnum.SYS_MESSAGE,id);

        }
        return ResultModel.success();
    }

    /**
     * 分页查询系统消息
     * @param searchPageable 分页信息
     * @return
     */
    @PostMapping("/messages/search")
    public ResultModel search(@RequestBody SearchPageable<SysMessageSearchDTO> searchPageable){
        JwtUser jwtUser = getJwtUser();
        if(null == searchPageable.getFilters()){
            searchPageable.setFilters(new SysMessageSearchDTO());
        }
        searchPageable.getFilters().setToId(Long.parseLong(jwtUser.getUserId()));
        searchPageable.getFilters().setToPlatform(JwtUtil.convertToPlatform(jwtUser.getType()));
        ResultPage<SysMessageDTO> resultPage = sysMessageService.findPage(searchPageable);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("list", SysMessageMapstruct.Instance.sysMessageDTOsToSysMessageVOs(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }

}
