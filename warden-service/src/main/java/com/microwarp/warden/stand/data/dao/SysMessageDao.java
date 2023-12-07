package com.microwarp.warden.stand.data.dao;

import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.data.basic.BaseDao;
import com.microwarp.warden.stand.data.entity.SysMessage;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;

/**
 * dao - 系统消息
 */
public interface SysMessageDao extends BaseDao<SysMessage> {
    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @param jwtUser 接收用户
     * @return
     */
    SysMessageDTO findById(Long id, JwtUser jwtUser);
    /**
     * 设置消息阅读状态
     * @param id 消息ID
     * @param jwtUser 接收人
     * @param status 阅读状态
     */
    void setReadStatus(Long[] id, JwtUser jwtUser, boolean status);

    /**
     * 删除消息
     * @param id 消息ID
     * @param jwtUser 接收人
     */
    void delete(Long[] id, JwtUser jwtUser);
}
