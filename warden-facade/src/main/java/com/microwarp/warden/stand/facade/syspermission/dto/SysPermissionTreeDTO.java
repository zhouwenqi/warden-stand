package com.microwarp.warden.stand.facade.syspermission.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * dto - 权限树
 * @author zhouwenqi
 */
public class SysPermissionTreeDTO implements Serializable {
    private static final long serialVersionUID = -3226893010613379382L;
    private Long id;
    /** 权限名称 */
    private String name;
    /** 权限值 */
    private String value;
    /** 父级权限ID */
    private Long parentId;
    /** 子权限列表 */
    private List<SysPermissionTreeDTO> children;
    /** 排序值 */
    private Long orders;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public List<SysPermissionTreeDTO> getChildren() {
        return children;
    }

    public void setChildren(List<SysPermissionTreeDTO> children) {
        this.children = children;
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
}
