package com.microwarp.warden.stand.facade.sysconfig.service;

import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;

/**
 * service - 配置
 * @author zhouwenqi
 */
public interface SysConfigService {
    /**
     * 获取当前系统配置
     * @return 系统配置
     */
    SysConfigDTO findCurrent();

    /**
     * 更新系统配置
     * @param sysConfigDTO 系统配置
     */
    void update(SysConfigDTO sysConfigDTO);
}
