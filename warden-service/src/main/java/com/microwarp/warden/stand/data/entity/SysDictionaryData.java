package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.microwarp.warden.stand.data.basic.LogicEntity;

/**
 * entity - 字典数据
 * @author zhouwenqi
 */
@TableName("wd_sys_dictionary_data")
public class SysDictionaryData extends LogicEntity {
    private static final long serialVersionUID = -3695754001554454624L;
    /** 字典id */
    private Long dictId;
    /** key */
    private String dataKey;
    /** 值 */
    private String dataValue;
    /** 别名 */
    private String dataAlias;
    /** 描述 */
    private String description;
    /** 默认项 */
    private Boolean dataDefault;
    /** 排序 */
    private Long orders;
    /** 是否禁用 */
    private Boolean disabled;

    public Long getDictId() {
        return dictId;
    }

    public void setDictId(Long dictId) {
        this.dictId = dictId;
    }

    public String getDataKey() {
        return dataKey;
    }

    public void setDataKey(String dataKey) {
        this.dataKey = dataKey;
    }

    public String getDataValue() {
        return dataValue;
    }

    public void setDataValue(String dataValue) {
        this.dataValue = dataValue;
    }

    public String getDataAlias() {
        return dataAlias;
    }

    public void setDataAlias(String dataAlias) {
        this.dataAlias = dataAlias;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDataDefault() {
        return dataDefault;
    }

    public void setDataDefault(Boolean dataDefault) {
        this.dataDefault = dataDefault;
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
}
