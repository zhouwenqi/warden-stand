package com.microwarp.warden.stand.admin.domain.vo;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * request - 二次验证请求
 * @author zhouwenqi
 */
public class GoogleVerifyRequest {
    /** 验证码 */
    @NotNull(message = "验证码不能为空")
    @Max(value = Long.MAX_VALUE,message = "验证码只能是6位数字")
    @Min(value = Long.MIN_VALUE,message = "验证码只能是6位数字")
    private Long code;

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }
}
