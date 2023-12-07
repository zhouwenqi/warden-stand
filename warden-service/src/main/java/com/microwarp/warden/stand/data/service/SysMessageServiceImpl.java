package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.data.basic.BaseServiceImpl;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysMessageConvert;
import com.microwarp.warden.stand.data.dao.SysMessageDao;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysMessage;
import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageSearchDTO;
import com.microwarp.warden.stand.facade.sysmessage.service.SysMessageService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * service - 系统消息 - impl
 * @author zhouwenqi
 */
@Service
public class SysMessageServiceImpl extends BaseServiceImpl<SysMessage,SysMessageDao> implements SysMessageService {
    @Resource
    private SysUserDao sysUserDao;

    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @return 消息内容
     */
    @Override
    public SysMessageDTO findById(Long id){
        SysMessage sysMessage = this.dao.getById(id);
        return null == sysMessage ? null : SysMessageConvert.Instance.sysMessageToSysMessageDTO(sysMessage);
    }

    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @param jwtUser 接收用户
     * @return 消息内容
     */
    public SysMessageDTO findById(Long id,JwtUser jwtUser){
        // 防止贯穿访问
        if(null == id || null == jwtUser || null == jwtUser.getUserId() || null == jwtUser.getType()){
            return null;
        }
        return this.dao.findById(id,jwtUser);
    }
    /**
     * 创建一条系统消息
     * @param sysMessageDTO 消息内容
     * @return 消息内容
     */
    @Override
    public SysMessageDTO create(SysMessageDTO sysMessageDTO){
        SysMessage sysMessage = SysMessageConvert.Instance.sysMessageDtoToSysMessage(sysMessageDTO);
        this.dao.save(sysMessage);
        return findById(sysMessage.getId());
    }

    /**
     * 设计消息已读
     * @param id 消息ID
     * @param jwtUser 接收人
     */
    @Override
    public void read(Long[] id, JwtUser jwtUser){
        // 暂时不让这个方法阅读所有，强制用readAll方法；
        if(null == id || id.length < 1 ){
            return;
        }
        this.dao.setReadStatus(id,jwtUser,true);
    }

    /**
     * 批量写入消息(所有用户写一条)
     * @param sysMessageDTO 消息内容
     */
    @Transactional
    public void writeByAllSysUser(SysMessageDTO sysMessageDTO){
        List<SysUser> list = sysUserDao.findAll();
        for(SysUser sysUser:list) {
            sysMessageDTO.setToId(sysUser.getId());
            SysMessage sysMessage = SysMessageConvert.Instance.sysMessageDtoToSysMessage(sysMessageDTO);
            this.dao.save(sysMessage);
        }
    }

    /**
     * 设置所有消息已读
     * @param jwtUser 接收人
     */
    @Override
    public void readAll(JwtUser jwtUser){
        this.dao.setReadStatus(null, jwtUser, true);
    }

    /**
     * 删除系统消息
     * @param jwtUser 接收人
     */
    @Override
    public void delete(Long[]id, JwtUser jwtUser){
        this.dao.delete(id,jwtUser);
    }

    /**
     * 获取未读消息数量
     * @param jwtUser 接收人
     * @return 未读数量
     */
    @Override
    public long totalUnread(JwtUser jwtUser){
        QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("to_id",jwtUser.getUserId());
        queryWrapper.eq("to_platform", JwtUtil.convertToPlatform(jwtUser.getType()));
        queryWrapper.eq("reading",false);
        return this.dao.count(queryWrapper);
    }

    /**
     * 分页系统消息
     * @param iSearchPageable 查询条件
     * @return 消息列表
     */
    @Override
    public ResultPage<SysMessageDTO> findPage(ISearchPageable<SysMessageSearchDTO> iSearchPageable){
        QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
        String searchKey = iSearchPageable.getSearchKey();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            switch (searchKey) {
                case "title":
                    queryWrapper.and(wrapper -> wrapper.like("title", iSearchPageable.getSearchValue()));
                    break;
                case "content":
                    queryWrapper.and(wrapper -> wrapper.like("content", iSearchPageable.getSearchValue()));
                    break;
                case "msgId":
                    queryWrapper.and(wrapper -> wrapper.like("msgId", iSearchPageable.getSearchValue()));
                    break;
            }
        }
        if(null != iSearchPageable.getFilters()){
            SysMessageSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getToId()) {
                queryWrapper.and(true, wrapper -> wrapper.eq("to_id", searchDTO.getToId()));
            }
            if(null != searchDTO.getToPlatform()){
                queryWrapper.and(true, wrapper -> wrapper.eq("to_platform", searchDTO.getToPlatform()));
            }

            if(null != searchDTO.getMsgType() && searchDTO.getMsgType().length > 0) {
                queryWrapper.and(true, wrapper -> wrapper.in("msg_type", Arrays.asList(searchDTO.getMsgType())));
            }

            if(null != searchDTO.getReading()){
                queryWrapper.and(true,wrapper -> wrapper.eq("reading",searchDTO.getReading()));
            }
            this.dao.useBaseFilter(queryWrapper,searchDTO);
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysMessage> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        this.dao.page(page,queryWrapper);
        ResultPage<SysMessageDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysMessageConvert.Instance.sysMessagesToSysMessageDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
