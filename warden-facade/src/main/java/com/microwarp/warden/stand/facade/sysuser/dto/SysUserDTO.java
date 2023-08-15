package com.microwarp.warden.stand.facade.sysuser.dto;

import com.microwarp.warden.stand.common.core.enums.GenderEnum;

import java.io.Serializable;
import java.util.Date;

/**
 * dto - 系统用户
 * @author zhouwenqi
 */
public class SysUserDTO implements Serializable {
    private static final long serialVersionUID = -812754276540457750L;
    private Long id;
    /** 帐号 */
    private String uid;
    /** 密码 */
    private String pwd;
    /** 姓名 */
    private String realName;
    /** 全拼 */
    private String pinyin;
    /** 简拼 */
    private String py;
    /** 性别 */
    private GenderEnum gender;
    /** 头像 */
    private String face;
    /** 手机号 */
    private String mobile;
    /** 电子邮箱 */
    private String email;
    /** 部门id */
    private Long deptId;
    /** 岗位id */
    private Long postId;
    /** 关闭 */
    private Boolean disabled;
    /** 锁定*/
    private Boolean locked;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public String getPy() {
        return py;
    }

    public void setPy(String py) {
        this.py = py;
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

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }
}
