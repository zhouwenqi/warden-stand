package com.microwarp.warden.stand.facade.sysdept.dto;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 10/9/2023.
 */
public class SysDeptTreeDTO implements Serializable {
    private static final long serialVersionUID = 3962547095741903449L;
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
    /** 全拼 */
    private String pinyin;
    /** 简拼 */
    private String py;
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

    private List<SysDeptTreeDTO> children;

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

    public Long getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public String getPy() {
        return py;
    }

    public void setPy(String py) {
        this.py = py;
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

    public List<SysDeptTreeDTO> getChildren() {
        return children;
    }

    public void setChildren(List<SysDeptTreeDTO> children) {
        this.children = children;
    }
}
