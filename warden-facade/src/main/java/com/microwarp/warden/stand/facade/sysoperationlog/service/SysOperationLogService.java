package com.microwarp.warden.stand.facade.sysoperationlog.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogSearchDTO;

/**
 * service - 操作日志
 * @author zhouwenqi
 */
public interface SysOperationLogService {
    /**
     * 查询操作日志信息
     * @param id 日志id
     * @return
     */
    SysOperationLogDTO findById(Long id);
    /**
     * 添加操作日志信息
     * @param sysOperationLogDTO 日志信息
     */
    void add(SysOperationLogDTO sysOperationLogDTO);
    /**
     * 删除操作日志
     * @param id 日志id
     */
    void delete(Long... id);
    /**
     * 清空操作日志
     */
    void clearAll();
    /**
     * 分页查询操作日志
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysOperationLogDTO> findPage(ISearchPageable<SysOperationLogSearchDTO> iSearchPageable);
}
