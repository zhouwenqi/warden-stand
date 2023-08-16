package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysLoginLogConvert;
import com.microwarp.warden.stand.data.dao.SysLoginLogDao;
import com.microwarp.warden.stand.data.entity.SysLoginLog;
import com.microwarp.warden.stand.data.mapper.SysLoginLogMapper;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

/**
 * dao - 登录日志 - impl
 */
@Repository
public class SysLoginLogDaoImpl extends ServiceImpl<SysLoginLogMapper,SysLoginLog> implements SysLoginLogDao {
    /**
     * 查询操作日志信息
     * @param id 日志id
     * @return
     */
    public SysLoginLogDTO findById(Long id){
        if(null == id){
            return null;
        }
        SysLoginLog sysLoginLog = baseMapper.selectById(id);
        return null == sysLoginLog ? null : SysLoginLogConvert.Instance.sysLoginLogToSysOperationLogDTO(sysLoginLog);
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
        QueryWrapper<SysLoginLog> queryWrapper = new QueryWrapper<>();
        queryWrapper.isNotNull("id");
        baseMapper.delete(queryWrapper);
    }

}
