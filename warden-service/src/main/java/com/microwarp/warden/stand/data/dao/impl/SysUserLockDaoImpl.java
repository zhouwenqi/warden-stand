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
import java.util.List;

/**
 * dao - 系统用户锁 - impl
 * @author zhouwenqi
 */
@Repository
public class SysUserLockDaoImpl extends ServiceImpl<SysUserLockMapper,SysUserLock> implements SysUserLockDao {
    /**
     * 查询用户锁列表
     * @param userId 用户id
     * @return
     */
    public List<SysUserLock> findByUserId(Long userId) {
        QueryWrapper<SysUserLock> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        return baseMapper.selectList(queryWrapper);
    }

    /**
     * 查询一条锁记录
     * @param userId 系统用户id
     * @param ip ip地址
     * @return
     */
    public SysUserLock queryByUserIdAndIp(Long userId, String ip){
        QueryWrapper<SysUserLock> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("ip",ip);
        queryWrapper.last("limit 1");
        return baseMapper.selectOne(queryWrapper);
    }

    /**
     * 查询一条锁记录(dto)
     * @param userId 系统用户id
     * @param ip ip地址
     * @return
     */
    public SysUserLockDTO findByUserIdAndIp(Long userId,String ip){
        SysUserLock sysUserLock = queryByUserIdAndIp(userId,ip);
        return null != sysUserLock ? SysUserLockConvert.Instance.sysUserLockToSysUserLockDTO(sysUserLock) : null;
    }

    /**
     * 判断用户是否被锁定
     * @param userId 用户id
     * @param ip ip地址
     * @return
     */
    public boolean isLocked(Long userId, String ip){
        boolean locked = false;
        SysUserLockDTO sysUserLockDTO = findByUserIdAndIp(userId,ip);
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
        SysUserLock sysUserLock = queryByUserIdAndIp(userId,ip);
        if(null == sysUserLock){
            sysUserLock = new SysUserLock();
            sysUserLock.setUserId(userId);
            sysUserLock.setIp(ip);
            sysUserLock.setLockTime(new Date());
            sysUserLock.setUnlockTime(unlockTime);
            baseMapper.insert(sysUserLock);
        }else{
            UpdateWrapper<SysUserLock> updateWrapper = new UpdateWrapper<>();
            updateWrapper.set("lock_time",new Date());
            updateWrapper.set("unlock_time",unlockTime);
            updateWrapper.eq("user_id",sysUserLock.getUserId());
            updateWrapper.eq("ip",ip);
            baseMapper.update(null,updateWrapper);
        }
    }
}
