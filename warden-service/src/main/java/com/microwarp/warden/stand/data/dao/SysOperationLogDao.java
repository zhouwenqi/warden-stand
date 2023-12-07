package com.microwarp.warden.stand.data.dao;

import com.microwarp.warden.stand.data.basic.BaseDao;
import com.microwarp.warden.stand.data.entity.SysOperationLog;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;

/**
 * dao - 操作日志
 */
public interface SysOperationLogDao extends BaseDao<SysOperationLog> {
    /**
     * 查询操作日志信息
     * @param id 日志id
     * @return
     */
    SysOperationLogDTO findById(Long id);
    /**
     * 删除操作日志
     * @param id 日志id
     */
    void delete(Long...id);

    /**
     * 清空操作日志
     */
    void clearAll();
}
