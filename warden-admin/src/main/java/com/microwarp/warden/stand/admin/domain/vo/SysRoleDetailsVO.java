package com.microwarp.warden.stand.admin.domain.vo;

import java.util.Date;
import java.util.Set;

/**
 * vo - 系统角色详情 - response
 */
public class SysRoleDetailsVO {
    private Long id;
    /** 角色名称 */
    private String name;
    /** 角色值 */
    private String value;
    /** 描述 */
    private String description;
    /** 排序值 */
    private Long orders;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;
    /** 权限列表 */
    private Set<SysPermissionVO> permissions;

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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
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

    public Set<SysPermissionVO> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<SysPermissionVO> permissions) {
        this.permissions = permissions;
    }
}
