package com.microwarp.warden.stand.admin.domain.vo;

import javax.validation.constraints.*;

/**
 * vo - 创建岗位 - request
 */
public class SysPostCreateRequest {
    /** 岗位名称 */
    @NotBlank(message = "岗位名称不能为空")
    @Pattern(regexp = "^[0-9a-zA-Z\\u4e00-\\u9fa5]{4,40}",message = "岗位名称只能是4-40个中文或数字或英文字符")
    private String name;
    /** 岗位编号 */
    @Pattern(regexp = "^[a-zA-Z0-9]{6,20}",message = " 岗位编号只能是6-20位字母和数字字符")
    private String code;
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
}
