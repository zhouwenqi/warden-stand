package com.microwarp.warden.stand.common.security;

import com.microwarp.warden.stand.common.core.enums.BaseEnum;

/**
 * enum - 用户类型
 */
public enum UserType implements BaseEnum {
    GUEST("来宾"),
    NORMAL("普通用户"),
    SYSTEM("系统用户");
    private final String tag;
    UserType(String tag){
        this.tag = tag;
    }
}
