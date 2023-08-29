package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 创建权限信息 - request
 */
public class SysPermissionCreateRequest {
    /** 权限名称 */
    @NotBlank(message = "权限名不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "权限名只能是4-40个中文或数字或英文字符")
    private String name;
    /** 权限值 */
    @NotBlank(message = "权限值不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9_:]{6,50}",message = "权限值只能是a-zA-Z0-9_:等6-50位字符")
    private String value;
    /** 排序值 */
    @Max(value = 99999, message = "排序值只能在0-100000之间")
    @Min(value = 0, message = "排序值只能在0-100000之间")
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
