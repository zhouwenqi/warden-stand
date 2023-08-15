package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;

/**
 * entity - 系统权限
 * @author zhouwenqi
 */
@TableName("wd_sys_permission")
public class SysPermission extends BaseEntity {
    private static final long serialVersionUID = 591953647267292837L;
    /** 权限名称 */
    private String name;
    /** 权限值 */
    private String value;
    /** 排序值 */
    private Integer orders;

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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }
}