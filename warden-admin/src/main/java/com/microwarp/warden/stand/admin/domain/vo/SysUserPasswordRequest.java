package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * vo - 更新系统用户密码 - request
 */
public class SysUserPasswordRequest {
    /** 用户id */
    private Long userId;
    /** 原始密码 */
    private String oldPassword;
    /** 新的密码 */
    @NotBlank(message = "密码不能为空")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}",message = "密码必需包含字母数字和特殊字符，长度为6-18")
    private String newPassword;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
