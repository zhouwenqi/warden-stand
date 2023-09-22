package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotNull;

/**
 * vo - 更新公告 - request
 */
public class SysNoticeUpdateRequest {
    @NotNull(message = "公告ID不能为空")
    private Long id;
    /** 公告标题 */
    private String title;
    /** 公告内容 */
    private String content;
    /** 禁用 */
    private Boolean disabled;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }
}
