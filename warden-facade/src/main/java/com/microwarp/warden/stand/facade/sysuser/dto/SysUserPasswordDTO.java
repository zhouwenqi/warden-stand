package com.microwarp.warden.stand.facade.sysuser.dto;

/**
 * dto - 修改系统用户密码
 * @author zhouwenqi
 */
public class SysUserPasswordDTO {
    private Long userId;
    /** 新的密码 */
    private String newPassword;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
