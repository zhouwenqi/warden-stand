package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 硬件终端
 */
public enum TerminalEnum implements BaseEnum {
    PC(0,"PC"),
    MAX(1,"MAC"),
    MOBILE(2,"MOBILE"),
    UNKNOWN(3,"未知");
    int code;
    String tag;
    TerminalEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
