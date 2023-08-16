package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysLoginLog;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;

/**
 * dao - 登录日志
 */
public interface SysLoginLogDao extends IService<SysLoginLog> {
    /**
     * 查询登录日志信息
     * @param id 日志id
     * @return
     */
    SysLoginLogDTO findById(Long id);
    /**
     * 删除登录日志
     * @param id 日志id
     */
    void delete(Long... id);

    /**
     * 清空登录日志
     */
    void clearAll();
}
