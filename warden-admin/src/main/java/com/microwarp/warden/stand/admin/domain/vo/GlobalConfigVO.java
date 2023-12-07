package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.core.enums.CaptchaTypeEnum;

/**
 * vo - 全局配置信息 - response
 */
public class GlobalConfigVO {
    /**
     * 启用启用接口永远返回200
     * 启用后拦截器中postHandle可能会失效
     * */
    private boolean responseForeverOk;
    /** token有效时间(单位:小时) */
    private int tokenEffectiveHour  = 24 * 7;
    /** 开启注册功能 */
    private Boolean enableRegister = false;
    /** 默认分页大小 */
    private int defaultPageSize = HttpConstants.DEFAULT_PAGE_SIZE;
    /** 来宾帐号 */
    private String guestId;
    /** 启用验证码 */
    private Boolean enableCaptcha;
    /** 验证码类型 */
    private CaptchaTypeEnum captchaType;

    public boolean isResponseForeverOk() {
        return responseForeverOk;
    }

    public void setResponseForeverOk(boolean responseForeverOk) {
        this.responseForeverOk = responseForeverOk;
    }

    public int getTokenEffectiveHour() {
        return tokenEffectiveHour;
    }

    public void setTokenEffectiveHour(int tokenEffectiveHour) {
        this.tokenEffectiveHour = tokenEffectiveHour;
    }

    public Boolean getEnableRegister() {
        return enableRegister;
    }

    public void setEnableRegister(Boolean enableRegister) {
        this.enableRegister = enableRegister;
    }

    public int getDefaultPageSize() {
        return defaultPageSize;
    }

    public void setDefaultPageSize(int defaultPageSize) {
        this.defaultPageSize = defaultPageSize;
    }

    public String getGuestId() {
        return guestId;
    }

    public void setGuestId(String guestId) {
        this.guestId = guestId;
    }

    public Boolean getEnableCaptcha() {
        return enableCaptcha;
    }

    public void setEnableCaptcha(Boolean enableCaptcha) {
        this.enableCaptcha = enableCaptcha;
    }

    public CaptchaTypeEnum getCaptchaType() {
        return captchaType;
    }

    public void setCaptchaType(CaptchaTypeEnum captchaType) {
        this.captchaType = captchaType;
    }
}
