package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * vo - 创建公告 - request
 */
public class SysNoticeCreateRequest {
    /** 公告标题 */
    @NotBlank(message = "公告标题不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,100}",message = "公告标题只能是4-100个中文或数字或英文字符")
    private String title;
    /** 公告内容 */
    @NotBlank(message = "公告标题不能为空")
    private String content;
    /** 禁用 */
    private Boolean disabled;

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
