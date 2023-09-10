package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 更新权限信息 - request
 */
public class SysPermissionUpdateRequest {
    @NotNull(message = "权限ID不能为空")
    private Long id;
    /** 权限名称 */
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "权限名只能是4-40个中文或数字或英文字符")
    private String name;
    /** 权限值 */
    @Pattern(regexp = "^[a-zA-Z0-9_:]{6,50}",message = "权限值只能是a-zA-Z0-9_:等6-50位字符")
    private String value;
    /** 排序值 */
    @Max(value = Long.MAX_VALUE, message = "排序值过大")
    @Min(value = 0, message = "排序值最小是0")
    private Long orders;

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

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }
}
