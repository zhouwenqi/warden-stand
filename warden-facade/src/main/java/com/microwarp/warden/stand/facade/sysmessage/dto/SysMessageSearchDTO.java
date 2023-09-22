package com.microwarp.warden.stand.facade.sysmessage.dto;

import com.microwarp.warden.stand.common.core.enums.MessageTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto - 系统消息过淲
 */
public class SysMessageSearchDTO extends BasicSearchDTO {
    /** 接收人ID */
    private Long toId;
    /** 接收平台 */
    private PlatformTypeEnum toPlatform;
    /** 已读 */
    private Boolean reading;
    /** 消息类型 */
    private MessageTypeEnum[] msgType;

    public Long getToId() {
        return toId;
    }

    public void setToId(Long toId) {
        this.toId = toId;
    }

    public Boolean getReading() {
        return reading;
    }

    public void setReading(Boolean reading) {
        this.reading = reading;
    }

    public MessageTypeEnum[] getMsgType() {
        return msgType;
    }

    public void setMsgType(MessageTypeEnum[] msgType) {
        this.msgType = msgType;
    }

    public PlatformTypeEnum getToPlatform() {
        return toPlatform;
    }

    public void setToPlatform(PlatformTypeEnum toPlatform) {
        this.toPlatform = toPlatform;
    }
}
