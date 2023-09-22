package com.microwarp.warden.stand.admin.domain.vo;

import java.util.Date;

/**
 * vo - 系统公告 - response
 */
public class SysNoticeVO {
    private Long id;
    /** 公告标题 */
    private String title;
    /** 公告内容 */
    private String content;
    /** 已推送 */
    private Boolean served;
    /** 禁用 */
    private Boolean disabled;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;

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

    public Boolean getServed() {
        return served;
    }

    public void setServed(Boolean served) {
        this.served = served;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
