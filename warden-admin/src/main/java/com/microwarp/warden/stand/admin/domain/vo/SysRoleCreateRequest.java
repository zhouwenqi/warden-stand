package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 创建角色 - request
 */
public class SysRoleCreateRequest {
    /** 角色名称 */
    @NotBlank(message = "角色名不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "角色名只能是4-40个中文或数字或英文字符")
    private String name;
    /** 角色值 */
    @NotBlank(message = "角色值不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9_:]{6,50}",message = "帐号只能是a-zA-Z0-9_:等6-50位字符")
    private String value;
    /** 描述 */
    private String description;
    /** 排序值 */
    @Max(value = Long.MAX_VALUE, message = "排序值过大")
    @Min(value = 0, message = "排序值最小是0")
    private Long orders;

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
