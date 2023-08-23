package com.microwarp.warden.stand.admin.domain.vo;


import javax.validation.constraints.*;

/**
 * vo - 部门 - response
 */
public class SysDeptRequest {
    private Long id;
    /** 部门名称 */
    @NotBlank(message = "部门名称不能为空")
    @Size(max = 40, message = "部门名称不能超过40个字符")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "部门名称只能是4-40个中文或数字或英文字符")
    private String name;
    /** 部门电话 */
    private String phone;
    /** 部门编号 */
    @NotBlank(message = "部门编号不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9]{6,20}",message = "部门编号只能是6-20位字母和数字字符")
    private String code;
    /** 负责人id */
    private Long leaderId;
    /** 描述 */
    private String description;
    /** 排序值 */
    @Max(value = 99999, message = "排序值只能在0-100000之间")
    @Min(value = 0, message = "排序值只能在0-100000之间")
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
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
