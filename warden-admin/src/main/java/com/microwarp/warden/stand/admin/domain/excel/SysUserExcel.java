package com.microwarp.warden.stand.admin.domain.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.microwarp.warden.stand.admin.handler.ExcelBaseEnumConverter;
import com.microwarp.warden.stand.common.core.enums.GenderEnum;

import java.util.Date;

/**
 * excel - 系统用户
 */
public class SysUserExcel {
    @ExcelProperty("ID")
    private Long id;
    @ExcelProperty("帐号")
    private String uid;
    @ExcelProperty("姓名")
    private String realName;
    @ExcelProperty(value = "性别", converter = ExcelBaseEnumConverter.class)
    private GenderEnum gender;
    @ExcelProperty("头像")
    private String face;
    @ExcelProperty("手机号")
    private String mobile;
    @ExcelProperty("电子邮箱")
    private String email;
    @ExcelProperty("部门ID")
    private Long deptId;
    @ExcelProperty("岗位ID")
    private Long postId;
    @ExcelProperty(value = "禁用")
    private Boolean disabled;
    @ExcelProperty("创建时间")
    private Date createDate;
    @ExcelProperty("修改时间")
    private Date updateDate;

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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
