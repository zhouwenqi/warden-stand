package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 消息类型
 * @author zhouwenqi
 */
public enum  MessageTypeEnum implements BaseEnum {
    NOTICE(0,"系统公告"),
    TODO(1,"待办事项");
    int code;
    String tag;
    MessageTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
