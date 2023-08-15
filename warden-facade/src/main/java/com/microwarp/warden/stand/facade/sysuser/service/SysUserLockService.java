package com.microwarp.warden.stand.facade.sysuser.service;

import java.util.Date;

/**
 * service - 系统用户锁
 * @author zhouwenqi
 */
public interface SysUserLockService {

    /**
     * 判断用户是否被锁定
     * @param userId 用户id
     * @return
     */
    boolean isLocked(Long userId);
    /**
     * 添加一条锁记录
     * @param userId 用户id
     * @param ip IP地址
     * @param unlockTime 解锁时间(时间为空永久锁住)
     */
    void add(Long userId, String ip, Date unlockTime);
}
