package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.microwarp.warden.stand.data.basic.LogicEntity;

/**
 * entity - 系统岗位
 * @author zhouwenqi
 */
@TableName("wd_sys_post")
public class SysPost extends LogicEntity {
    private static final long serialVersionUID = 6832756416891120730L;
    /** 岗位名称 */
    private String name;
    /** 岗位编号 */
    private String code;
    /** 全拼 */
    private String pinyin;
    /** 简拼 */
    private String py;
    /** 描述 */
    private String description;
    /** 排序值 */
    private Long orders;

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

}
