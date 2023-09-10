package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 更新字典数据 - request
 */
public class SysDictionaryDataUpdateRequest {
    @NotNull(message = "字典数据ID不能为空")
    private Long id;
    /** 字典id */
    private Long dictId;
    /** key */
    @Pattern(regexp = "^[a-zA-Z0-9_]{1,20}",message = "Key只能是1-20位字母和数字和下划线字符")
    private String dataKey;
    /** 值 */
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{1,40}",message = "字典数据只能是1-40个中文或数字或英文字符")
    private String dataValue;
    /** 标签 */
    @Pattern(regexp = "^[a-zA-Z0-9_]{2,20}",message = "标签只能是6-20位字母和数字和下划线字符")
    private String dataAlias;
    /** 描述 */
    private String description;
    /** 默认项 */
    private Boolean dataDefault;
    /** 排序值 */
    @Max(value = Long.MAX_VALUE, message = "排序值过大")
    @Min(value = 0, message = "排序值最小是0")
    private Long orders;
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
