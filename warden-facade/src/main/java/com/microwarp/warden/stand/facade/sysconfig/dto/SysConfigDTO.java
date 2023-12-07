package com.microwarp.warden.stand.facade.sysconfig.dto;

import java.io.Serializable;

/**
 * dto - 配置
 * @author zhouwenqi
 */
public class SysConfigDTO implements Serializable {
    private static final long serialVersionUID = -4954462223218063452L;
    /** 开启注册功能 */
    private Boolean enabledRegister;
    /** 允许一个帐号生成多个有效token */
    private Boolean allowManyToken;
    /** 开启再次验证功能 */
    private Boolean enabledAgainVerify;

    public Boolean getEnabledRegister() {
        return enabledRegister;
    }

    public void setEnabledRegister(Boolean enabledRegister) {
        this.enabledRegister = enabledRegister;
    }

    public Boolean getAllowManyToken() {
        return allowManyToken;
    }

    public void setAllowManyToken(Boolean allowManyToken) {
        this.allowManyToken = allowManyToken;
    }

    public Boolean getEnabledAgainVerify() {
        return enabledAgainVerify;
    }

    public void setEnabledAgainVerify(Boolean enabledAgainVerify) {
        this.enabledAgainVerify = enabledAgainVerify;
    }
}
