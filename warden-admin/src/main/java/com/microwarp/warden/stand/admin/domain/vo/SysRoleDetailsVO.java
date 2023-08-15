package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;

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
    private Integer orders;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;
    /** 权限列表 */
    private Set<SysPermissionDTO> permissions;

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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
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

    public Set<SysPermissionDTO> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<SysPermissionDTO> permissions) {
        this.permissions = permissions;
    }
}
