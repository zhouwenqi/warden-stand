package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.enums.GenderEnum;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * vo - 更新用户信息 - response
 */
public class SysUserUpdateRequest {
    @NotNull(message = "帐号ID不能为空")
    private Long id;
    /** 帐号 */
    @Pattern(regexp = "^[a-zA-Z0-9_-]{6,20}",message = "帐号只能是a-zA-Z0-9_-等6-20位字符")
    private String uid;
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
    /** 部门id */
    private Long deptId;
    /** 岗位id */
    private Long postId;
    /** 关闭 */
    private Boolean disabled;
    /** 角色值 */
    private Long[] roleIds;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

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

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public Long[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds) {
        this.roleIds = roleIds;
    }
}
