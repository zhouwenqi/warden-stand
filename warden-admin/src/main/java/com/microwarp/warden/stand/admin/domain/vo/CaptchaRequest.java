package com.microwarp.warden.stand.admin.domain.vo;

/**
 * vo - 验证码请求 - request
 */
public class CaptchaRequest {
    /** 宽度 */
    private Integer width;
    /** 高度 */
    private Integer height;
    /** 背景色 */
    private String backgroundColor;
    /** 来宾分配ID */
    private String guestId;

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(String backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public String getGuestId() {
        return guestId;
    }

    public void setGuestId(String guestId) {
        this.guestId = guestId;
    }
}
