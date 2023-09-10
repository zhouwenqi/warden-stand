package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;

import java.util.Date;

/**
 * vo - 部门 - response
 */
public class SysDeptVO {
    private Long id;
    /** 部门名称 */
    private String name;
    /** 部门电话 */
    private String phone;
    /** 部门编号 */
    private String code;
    /** 上级部门ID */
    private Long parentId;
    /** 负责人id */
    private Long leaderId;
    /** 上级部门 */
    private SysDeptDTO parentDept;
    /** r描述 */
    private String description;
    /** 排序值 */
    private Long orders;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public SysDeptDTO getParentDept() {
        return parentDept;
    }

    public void setParentDept(SysDeptDTO parentDept) {
        this.parentDept = parentDept;
    }

    public Long getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
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
