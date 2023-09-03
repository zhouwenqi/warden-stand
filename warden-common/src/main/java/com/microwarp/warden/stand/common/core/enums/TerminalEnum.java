package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 设备终端
 */
public enum TerminalEnum implements BaseEnum {
    PC(0,"PC"),
    MAC(1,"MAC"),
    MOBILE(2,"MOBILE"),
    TABLET(3,"平板设备"),
    UNKNOWN(3,"未知");
    int code;
    String tag;
    TerminalEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
