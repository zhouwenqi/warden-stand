package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 验证码类型
 * @author zhouwenqi
 */
public enum  CaptchaTypeEnum implements BaseEnum {
    KAPTCHA_IMAGE(0,"Google图形验证码"),
    ALIYUN(1,"阿里云验证"),
    GOOGLE_AUTHENTICATOR(2,"Google身份验证器");
    int code;
    String tag;
    CaptchaTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
