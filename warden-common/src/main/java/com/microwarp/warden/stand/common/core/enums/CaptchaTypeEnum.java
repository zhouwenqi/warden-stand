package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 验证码类型
 * @author zhouwenqi
 */
public enum  CaptchaTypeEnum implements BaseEnum {
    NONE(0,"关闭"),
    KAPTCHA_IMAGE(1,"Google图形验证码"),
    ALIYUN(2,"阿里云验证");
    int code;
    String tag;
    CaptchaTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
