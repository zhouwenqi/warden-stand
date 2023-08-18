package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysUserLock;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserLockDTO;

import java.util.Date;
import java.util.List;

/**
 * dao - 系统用户锁
 * @author zhouwenqi
 */
public interface SysUserLockDao extends IService<SysUserLock> {
    /**
     * 查询一条锁记录
     * @param userId 系统用户id
     * @param ip ip地址
     * @return
     */
    SysUserLock queryByUserIdAndIp(Long userId, String ip);
    /**
     * 查询一条锁记录(dto)
     * @param userId 系统用户id
     * @param ip ip地址
     * @return
     */
    SysUserLockDTO findByUserIdAndIp(Long userId,String ip);

    /**
     * 查询用户锁列表
     * @param userId 用户id
     * @return
     */
    List<SysUserLock> findByUserId(Long userId);
    /**
     * 判断用户是否被锁定
     * @param userId 用户id
     * @param ip ip地址
     * @return
     */
    boolean isLocked(Long userId, String ip);
    /**
     * 锁住一个用户
     * @param userId 用户id
     * @param ip IP地址
     * @param unlockTime 解锁时间(时间为空永久锁住)
     */
    void lock(Long userId, String ip, Date unlockTime);
}
