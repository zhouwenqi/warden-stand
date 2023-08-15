package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 应用终端
 */
public enum  AppTerminalEnum implements BaseEnum {
    APP_ANDROID(0,"Android"),
    APP_IOS(1,"IOS"),
    MOBILE_H5(2,"手机端网页"),
    WEIXIN_H5(3,"微信公众号"),
    WEIXIN_APP(4,"微信小程序"),
    PC_WEB(5,"PC端网页"),
    UNKNOWN(6,"未知");
    int code;
    String tag;
    AppTerminalEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
