package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;

/**
 * entity - 字典
 * @author zhouwenqi
 */
@TableName("wd_sys_dictionary")
public class SysDictionary extends LogicEntity {
    private static final long serialVersionUID = 3772081033840925221L;
    /** 字典名 */
    private String name;
    /** 字典编码 */
    private String code;
    /** 描述 */
    private String description;
    /** 排序值 */
    private Integer orders;
    /** 禁用 */
    private Boolean disabled;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }
}
