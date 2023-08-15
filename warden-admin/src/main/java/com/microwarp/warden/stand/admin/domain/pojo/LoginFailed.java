package com.microwarp.warden.stand.admin.domain.pojo;

import java.util.Date;

/**
 * pojo - 登录异常
 */
public class LoginFailed {
    private int count = 0;
    private Date failedTime = new Date();

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getFailedTime() {
        return failedTime;
    }

    public void setFailedTime(Date failedTime) {
        this.failedTime = failedTime;
    }
}
