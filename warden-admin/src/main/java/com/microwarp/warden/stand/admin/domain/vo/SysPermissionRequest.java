package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 权限信息 - request
 */
public class SysPermissionRequest {
    private Long id;
    /** 权限名称 */
    @NotBlank(message = "权限名不能为空")
    @Size(max = 40, message = "权限名不能超过40个字符")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "权限名只能是4-40个中文或数字或英文字符")
    private String name;
    /** 权限值 */
    @NotBlank(message = "权限值不能为空")
    @Size(max = 50, message = "权限值不能超过50个字符")
    @Pattern(regexp = "^[a-zA-Z0-9_:]{6,50}",message = "权限值只能是a-zA-Z0-9_:等6-50位字符")
    private String value;
    /** 排序值 */
    @Max(value = 99999, message = "排序值只能在0-100000之间")
    @Min(value = 0, message = "排序值只能在0-100000之间")
    private Integer orders;
    /** 分类id */
    private Long classifyId;

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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public Long getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Long classifyId) {
        this.classifyId = classifyId;
    }
}
