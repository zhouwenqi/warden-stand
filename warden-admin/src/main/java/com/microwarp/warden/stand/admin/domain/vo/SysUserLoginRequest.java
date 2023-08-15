package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;

/**
 * vo - 登录 - request
 */
public class SysUserLoginRequest {
    @NotBlank(message = "帐号不能为空")
    private String uid;
    @NotBlank(message = "密码不能为空")
    private String pwd;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
