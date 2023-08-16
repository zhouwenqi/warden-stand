package com.microwarp.warden.stand.facade.sysloginlog.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogSearchDTO;

/**
 * service - 登录日志
 * @author zhouwenqi
 */
public interface SysLoginLogService {
    /**
     * 查询登录日志信息
     * @param id 日志id
     * @return
     */
    SysLoginLogDTO findById(Long id);
    /**
     * 添加登录日志信息
     * @param sysLoginLogDTO 日志信息
     */
    void add(SysLoginLogDTO sysLoginLogDTO);
    /**
     * 删除登录日志
     * @param id 日志id
     */
    void delete(Long... id);
    /**
     * 清空登录日志
     */
    void clearAll();
    /**
     * 分页查询登录日志
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysLoginLogDTO> findPage(ISearchPageable<SysLoginLogSearchDTO> iSearchPageable);
}
