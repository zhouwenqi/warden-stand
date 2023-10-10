package com.microwarp.warden.stand.common.core.config;

import com.microwarp.warden.stand.common.core.enums.CaptchaTypeEnum;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;


@Configuration
@ConfigurationProperties(prefix = "warden.global")
public class WardenGlobalConfig {
    /** Token键名 */
    private String tokenKeyName = "warden-token";

    /** 有效时间(单位:小时) */
    private int tokenEffectiveHour = 24 * 7;
    /**
     * 启用启用接口永远返回200
     * 启用后拦截器中postHandle可能会失效
     * */
    private Boolean responseForeverOk = false;

    /**
     * 强制用ResultModel包装返回结构
     * 如果设为 false 非 ResultModel结构将不受 responseForeverOk 影响
     */
    private Boolean resultModelPackage = true;

    /** 启用验证码 */
    private Boolean enableCaptcha = false;

    /** 验证码类型 */
    private CaptchaTypeEnum captchaType = CaptchaTypeEnum.KAPTCHA_IMAGE;

    public Boolean getResponseForeverOk() {
        return responseForeverOk;
    }

    public void setResponseForeverOk(Boolean responseForeverOk) {
        this.responseForeverOk = responseForeverOk;
        ResultUtil.ResponseForeverOk = null == responseForeverOk ? false : responseForeverOk;
    }

    public Boolean getResultModelPackage() {
        return resultModelPackage;
    }

    public void setResultModelPackage(Boolean resultModelPackage) {
        this.resultModelPackage = resultModelPackage;
    }

    public String getTokenKeyName() {
        return tokenKeyName;
    }

    public void setTokenKeyName(String tokenKeyName) {
        this.tokenKeyName = tokenKeyName;
    }

    public int getTokenEffectiveHour() {
        return tokenEffectiveHour;
    }

    public void setTokenEffectiveHour(int tokenEffectiveHour) {
        this.tokenEffectiveHour = tokenEffectiveHour;
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
