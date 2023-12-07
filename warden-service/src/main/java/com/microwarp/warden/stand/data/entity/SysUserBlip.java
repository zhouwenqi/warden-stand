package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import javax.persistence.Entity;
import java.io.Serializable;

/**
 * entity - 用户标记(需要二次验证)
 * @author zhouwenqi
 */
@Entity
@TableName("wd_sys_user_blip")
public class SysUserBlip implements Serializable {
    private static final long serialVersionUID = 4142496166411511632L;
    /** 用户id */
    private Long userId;
    /** ip地址 */
    private String ip;

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
}
