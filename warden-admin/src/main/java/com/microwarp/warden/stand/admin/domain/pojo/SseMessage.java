package com.microwarp.warden.stand.admin.domain.pojo;

import com.microwarp.warden.stand.common.core.enums.MessageTypeEnum;
import com.microwarp.warden.stand.common.core.enums.TopicEnum;
import com.microwarp.warden.stand.common.core.message.IMessage;

/**
 * SSE 消息体
 * @author zhouwenqi
 */
public class SseMessage<T> implements IMessage<T> {
    /** 消息体 */
    private T body;
    /** 消息唯一ID */
    private long msgId;
    /** 主题 */
    private TopicEnum topic;

    @Override
    public T getBody() {
        return body;
    }

    public void setBody(T body) {
        this.body = body;
    }

    @Override
    public long getMsgId() {
        return msgId;
    }

    public void setMsgId(long msgId) {
        this.msgId = msgId;
    }

    @Override
    public TopicEnum getTopic() {
        return topic;
    }

    public void setTopic(TopicEnum topic) {
        this.topic = topic;
    }
}
