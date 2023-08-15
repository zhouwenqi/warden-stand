package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 系统终端
 */
public enum SystemTerminalEnum implements BaseEnum {
    WINDOWS(0,"Windows"),
    OSX(1,"OSX"),
    LINUX(2,"Linux"),
    UNIX(3,"Unix"),
    ANDROID(4,"Android"),
    IOS(5,"IOS"),
    UNKNOWN(6,"未知");
    int code;
    String tag;
    SystemTerminalEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}