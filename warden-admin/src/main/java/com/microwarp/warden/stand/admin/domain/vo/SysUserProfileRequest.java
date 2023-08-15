package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.enums.GenderEnum;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

/**
 * vo - 个人资料 - request
 */
public class SysUserProfileRequest {
    /** 姓名 */
    @Pattern(regexp = "^[a-zA-Z\\u4e00-\\u9fa5]{2,20}",message = "姓名只能是2-20个中文或英文字符")
    private String realName;
    /** 性别 */
    private GenderEnum gender;
    /** 头像 */
    private String face;
    /** 手机号 */
    @Pattern(regexp = "^1(3\\d|4[5-9]|5[0-35-9]|6[2567]|7[0-8]|8\\d|9[0-35-9])\\d{8}$",message = "手机号不正确")
    private String mobile;
    /** 电子邮箱 */
    @Email(message = "E-mail格式不正确，可以为空")
    @Length(min = 5, max=80,message = "E-mail只能是5-80个字符")
    private String email;

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public GenderEnum getGender() {
        return gender;
    }

    public void setGender(GenderEnum gender) {
        this.gender = gender;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
