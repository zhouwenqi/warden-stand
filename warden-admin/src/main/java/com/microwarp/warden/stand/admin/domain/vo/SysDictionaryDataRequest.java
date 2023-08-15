package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * vo - 字典数据 - request
 */
public class SysDictionaryDataRequest {
    private Long id;
    /** 字典id */
    @NotNull(message = "字典id不能为空")
    private Long dictId;
    /** key */
    @NotBlank(message = "Key不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9_]{6,20}",message = "Key只能是6-20位字母和数字和下划线字符")
    private String dataKey;
    /** 值 */
    @NotBlank(message = "数据值不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{1,40}",message = "字典名称只能是1-40个中文或数字或英文字符")
    private String dataValue;
    /** 标签 */
    @Pattern(regexp = "^[a-zA-Z0-9_]{2,20}",message = "标签只能是6-20位字母和数字和下划线字符")
    private String dataTag;
    /** 描述 */
    private String description;
    /** 默认项 */
    private Boolean dataDefault;
    /** 排序 */
    private Integer orders;
    /** 是否禁用 */
    private Boolean disabled;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public String getDataTag() {
        return dataTag;
    }

    public void setDataTag(String dataTag) {
        this.dataTag = dataTag;
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