package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.microwarp.warden.stand.common.core.enums.AgainVerifyTypeEnum;

import java.io.Serializable;

/**
 * entity - 系统配置
 * @author zhouwenqi
 */
@TableName("wd_sys_config")
public class SysConfig implements Serializable {
    private static final long serialVersionUID = 7684092470786349797L;
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
