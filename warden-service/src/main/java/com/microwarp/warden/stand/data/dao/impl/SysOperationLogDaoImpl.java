package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.microwarp.warden.stand.data.basic.BaseDaoImpl;
import com.microwarp.warden.stand.data.convert.SysOperationLogConvert;
import com.microwarp.warden.stand.data.dao.SysOperationLogDao;
import com.microwarp.warden.stand.data.entity.SysOperationLog;
import com.microwarp.warden.stand.data.mapper.SysOperationLogMapper;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

/**
 * dao - 操作日志 - impl
 */
@Repository
public class SysOperationLogDaoImpl extends BaseDaoImpl<SysOperationLogMapper,SysOperationLog> implements SysOperationLogDao {
    /**
     * 查询操作日志信息
     * @param id 日志id
     * @return
     */
    public SysOperationLogDTO findById(Long id){
        if(null == id){
            return null;
        }
        SysOperationLog sysOperationLog = baseMapper.selectById(id);
        return null == sysOperationLog ? null : SysOperationLogConvert.Instance.sysOperationLogToSysOperationLogDTO(sysOperationLog);
    }

    /**
     * 删除操作日志
     * @param id 日志id
     */
    public void delete(Long...id){
        if(null == id || id.length < 1){
            return;
        }
        baseMapper.deleteBatchIds(Arrays.asList(id));
    }

    /**
     * 清空操作日志
     */
    public void clearAll(){
        QueryWrapper<SysOperationLog> queryWrapper = new QueryWrapper<>();
        queryWrapper.isNotNull("id");
        baseMapper.delete(queryWrapper);
    }

}
