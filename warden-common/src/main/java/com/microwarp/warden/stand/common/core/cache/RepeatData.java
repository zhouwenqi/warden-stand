package com.microwarp.warden.stand.common.core.cache;

import java.io.Serializable;

/**
 * 重复提交数据缓存
 */
public class RepeatData implements Serializable {
    private static final long serialVersionUID = -4670002066022419509L;
    private String data;
    private Long time;
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }
}
