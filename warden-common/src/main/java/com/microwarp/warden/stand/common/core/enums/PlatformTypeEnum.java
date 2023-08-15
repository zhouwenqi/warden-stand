package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 平台类型
 */
public enum PlatformTypeEnum implements BaseEnum {
    BACKSTAGE(0,"后台"),
    FORESTAGE(1,"前台"),
    UNKNOWN(2,"未知平台");
    int code;
    String tag;
    PlatformTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
