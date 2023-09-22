package com.microwarp.warden.stand.common.core.message;

import com.microwarp.warden.stand.common.core.enums.MessageTypeEnum;
import com.microwarp.warden.stand.common.core.enums.TopicEnum;

/**
 * interface 消息推送
 * @author zhouwenqi
 */
public interface IMessage<T> {
    TopicEnum getTopic();
    T getBody();
    long getMsgId();
}
