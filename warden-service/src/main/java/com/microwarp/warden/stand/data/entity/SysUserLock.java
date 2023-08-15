package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import javax.persistence.Entity;
import java.io.Serializable;
import java.util.Date;

/**
 * entity - 系统用户锁
 * @author zhouwenqi
 */
@Entity
@TableName("wd_sys_user_lock")
public class SysUserLock implements Serializable {
    private static final long serialVersionUID = -5274993372881992222L;
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
