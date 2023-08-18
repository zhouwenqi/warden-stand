package com.microwarp.warden.stand.admin.domain.excel;

import com.alibaba.excel.annotation.ExcelProperty;

import java.util.Date;

/**
 * excel - 系统权限
 */
public class SysPermissionExcel {
    @ExcelProperty("ID")
    private Long id;
    @ExcelProperty("权限名称")
    private String name;
    @ExcelProperty("权限值")
    private String value;
    @ExcelProperty("排序值")
    private Integer orders;
    @ExcelProperty("创建时间")
    private Date createDate;
    @ExcelProperty("修改时间")
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
}
