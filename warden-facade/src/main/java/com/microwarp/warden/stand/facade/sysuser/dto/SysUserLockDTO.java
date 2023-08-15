package com.microwarp.warden.stand.facade.sysuser.dto;

import java.util.Date;

/**
 * dto - 系统用户锁
 * @author zhouwenqi
 */
public class SysUserLockDTO {
    /** 用户id */
    private Long userId;
    /** IP */
    private String ip;
    /** 锁定时间 */
    private Date lockTime;
    /** 解锁时间 */
    private Date unlockTime;
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getLockTime() {
        return lockTime;
    }

    public void setLockTime(Date lockTime) {
        this.lockTime = lockTime;
    }

    public Date getUnlockTime() {
        return unlockTime;
    }

    public void setUnlockTime(Date unlockTime) {
        this.unlockTime = unlockTime;
    }
}
