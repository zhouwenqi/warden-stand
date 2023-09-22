package com.microwarp.warden.stand.facade.sysmessage.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageSearchDTO;

/**
 * service - 系统消息
 */
public interface SysMessageService {
    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @return 消息内容
     */
    SysMessageDTO findById(Long id);

    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @param jwtUser 接收用户
     * @return 消息内容
     */
    SysMessageDTO findById(Long id,JwtUser jwtUser);

    /**
     * 创建一条系统消息
     * @param sysMessageDTO 消息内容
     * @return
     */
    SysMessageDTO create(SysMessageDTO sysMessageDTO);

    /**
     * 批量写入消息(所有用户写一条)
     * @param sysMessageDTO 消息内容
     */
    void writeByAllSysUser(SysMessageDTO sysMessageDTO);

    /**
     * 设计消息已读
     * @param id 消息ID
     * @param jwtUser 接收人
     */
    void read(Long[] id, JwtUser jwtUser);

    /**
     * 设置所有消息已读
     * @param jwtUser 接收人
     */
    void readAll(JwtUser jwtUser);

    /**
     * 删除系统消息
     * @param jwtUser 接收人
     */
    void delete(Long[]id, JwtUser jwtUser);

    /**
     * 获取未读消息数量
     * @param jwtUser 接收人
     * @return
     */
    long totalUnread(JwtUser jwtUser);

    /**
     * 分页系统消息
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysMessageDTO> findPage(ISearchPageable<SysMessageSearchDTO> iSearchPageable);
}
