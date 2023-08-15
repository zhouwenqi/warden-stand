package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysUserLockConvert;
import com.microwarp.warden.stand.data.dao.SysUserLockDao;
import com.microwarp.warden.stand.data.entity.SysUserLock;
import com.microwarp.warden.stand.data.mapper.SysUserLockMapper;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserLockDTO;
import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * dao - 系统用户锁 - impl
 * @author zhouwenqi
 */
@Repository
public class SysUserLockDaoImpl extends ServiceImpl<SysUserLockMapper,SysUserLock> implements SysUserLockDao {
    /**
     * 查询一条锁记录(entity)
     * @param userId 系统用户id
     * @return
     */
    public SysUserLock queryByUserId(Long userId){
        QueryWrapper<SysUserLock> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        return baseMapper.selectOne(queryWrapper);
    }

    /**
     * 查询一条锁记录(dto)
     * @param userId 系统用户id
     * @return
     */
    public SysUserLockDTO findByUserId(Long userId){
        SysUserLock sysUserLock = queryByUserId(userId);
        return null != sysUserLock ? SysUserLockConvert.Instance.sysUserLockToSysUserLockDTO(sysUserLock) : null;
    }

    /**
     * 判断用户是否被锁定
     * @param userId 用户id
     * @return
     */
    public boolean isLocked(Long userId){
        boolean locked = false;
        SysUserLockDTO sysUserLockDTO = findByUserId(userId);
        if(null != sysUserLockDTO){
            if(null == sysUserLockDTO.getUnlockTime() || sysUserLockDTO.getUnlockTime().after(new Date())){
                locked = true;
            }
        }
        return locked;
    }

    /**
     * 锁住一个用户
     * @param userId 用户id
     * @param ip IP地址
     * @param unlockTime 解锁时间(时间为空永久锁住)
     */
    public void lock(Long userId, String ip, Date unlockTime){
        SysUserLock sysUserLock = queryByUserId(userId);
        if(null == sysUserLock){
            sysUserLock = new SysUserLock();
            sysUserLock.setUserId(userId);
            sysUserLock.setIp(ip);
            sysUserLock.setLockTime(new Date());
            sysUserLock.setUnlockTime(unlockTime);
            baseMapper.insert(sysUserLock);
        }else{
            UpdateWrapper<SysUserLock> updateWrapper = new UpdateWrapper<>();
            updateWrapper.set("ip",ip);
            updateWrapper.set("lock_time",new Date());
            updateWrapper.set("unlock_time",unlockTime);
            updateWrapper.eq("user_id",sysUserLock.getUserId());
            baseMapper.update(null,updateWrapper);
        }
    }
}
