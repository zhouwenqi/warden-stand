package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 消息主题
 * @author zhouwenqi
 */
public enum TopicEnum  implements BaseEnum  {
    MSG_PUSH(0,"消息推送"),
    CHAT(1,"聊天"),
    EVENT_TOKEN_OFFLINE(2,"Token离线");
    int code;
    String tag;
    TopicEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}

