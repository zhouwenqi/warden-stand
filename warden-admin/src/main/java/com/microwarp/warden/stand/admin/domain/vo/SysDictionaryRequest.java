package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * vo - 字典 - request
 */
public class SysDictionaryRequest {
    private Long id;
    /** 字典名 */
    @NotBlank(message = "字典名称不能为空")
    @Size(max = 40, message = "字典名称不能超过40个字符")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "字典名称只能是4-40个中文或数字或英文字符")
    private String name;
    /** 字典编码 */
    @NotBlank(message = "字典编码不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9_]{6,20}",message = "字典编码只能是6-20位字母和数字和下划线字符")
    private String code;
    /** 描述 */
    private String description;
    /** 排序值 */
    private Integer orders;
    /** 禁用 */
    private Boolean disabled;

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
