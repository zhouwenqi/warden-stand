package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 创建字典 - request
 */
public class SysDictionaryCreateRequest {
    /** 字典名 */
    @NotBlank(message = "字典名称不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "字典名称只能是4-40个中文或数字或英文字符")
    private String name;
    /** 字典编码 */
    @NotBlank(message = "字典编码不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9_]{6,20}",message = "字典编码只能是6-20位字母和数字和下划线字符")
    private String code;
    /** 描述 */
    private String description;
    /** 排序值 */
    @Max(value = Long.MAX_VALUE, message = "排序值过大")
    @Min(value = 0, message = "排序值最小是0")
    private Long orders;
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
