package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;

/**
 * vo - 登录 - request
 */
public class SysUserLoginRequest {
    /** 帐号 */
    @NotBlank(message = "帐号不能为空")
    private String uid;
    /** 密码 */
    @NotBlank(message = "密码不能为空")
    private String pwd;
    /** 图形验证码 */
    private String captchaCode;

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

    public String getCaptchaCode() {
        return captchaCode;
    }

    public void setCaptchaCode(String captchaCode) {
        this.captchaCode = captchaCode;
    }
}
