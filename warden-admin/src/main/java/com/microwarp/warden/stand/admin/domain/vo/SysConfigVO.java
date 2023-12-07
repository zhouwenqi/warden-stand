package com.microwarp.warden.stand.admin.domain.vo;


import com.microwarp.warden.stand.common.core.enums.AgainVerifyTypeEnum;

/**
 * dto - 配置
 * @author zhouwenqi
 */
public class SysConfigVO {
    /** 开启注册功能 */
    private Boolean enabledRegister;
    /** 允许一个帐号生成多个有效token */
    private Boolean allowManyToken;
    /** 再次验证功能 */
    private AgainVerifyTypeEnum againVerify;

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

    public AgainVerifyTypeEnum getAgainVerify() {
        return againVerify;
    }

    public void setAgainVerify(AgainVerifyTypeEnum againVerify) {
        this.againVerify = againVerify;
    }
}
