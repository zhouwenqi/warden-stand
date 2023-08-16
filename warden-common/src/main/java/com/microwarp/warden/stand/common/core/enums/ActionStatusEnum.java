package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 操作状态
 */
public enum ActionStatusEnum implements BaseEnum {
    FAILED(0,"失败"),
    SUCCESS(1,"成功");
    int code;
    String tag;
    ActionStatusEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
