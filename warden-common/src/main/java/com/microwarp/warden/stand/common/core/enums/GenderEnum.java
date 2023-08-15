package com.microwarp.warden.stand.common.core.enums;
/**
 * enum - 性别
 * @author zhouwenqi
 */
public enum GenderEnum implements BaseEnum {
    MALE(0,"男"),
    FEMALE(1,"女"),
    UNKNOWN(2,"未知");
    int code;
    String tag;
    GenderEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
