package com.microwarp.warden.stand.facade.syspermission.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * dto - 系统权限
 */
public class SysPermissionDTO implements Serializable {
    private static final long serialVersionUID = -2560792862551826445L;
    private Long id;
    /** 权限名称 */
    private String name;
    /** 权限值 */
    private String value;
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

    @Override
    public boolean equals(Object object){
        if(null == object){
            return false;
        }
        if(this == object){
            return true;
        }
        if(object instanceof SysPermissionDTO){
            SysPermissionDTO sysPermissionDTO = (SysPermissionDTO)object;
            return sysPermissionDTO.value.equals(this.getValue());
        }
        return false;
    }
    @Override
    public int hashCode(){
        return value.hashCode();
    }
}
