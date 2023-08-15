package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.enums.GenderEnum;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;

import java.util.Date;
import java.util.Set;

/**
 * vo - 用户详情 - response
 */
public class SysUserDetailsVO {
    private Long id;
    /** 帐号 */
    private String uid;
    /** 姓名 */
    private String realName;
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
    /** 状态*/
    private String status;
    /** 关闭 */
    private Boolean disabled;
    /** 锁定*/
    private Boolean locked;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;
    /** 角色列表 */
    private Set<SysRoleDTO> roles;
    /** 权限列表 */
    private Set<SysPermissionDTO> permissions;
    /** 权限值列表 */
    private String[] authorities;
    /** 部门 */
    private SysDeptDTO dept;
    /** 岗位 */
    private SysPostDTO post;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
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

    public Set<SysRoleDTO> getRoles() {
        return roles;
    }

    public void setRoles(Set<SysRoleDTO> roles) {
        this.roles = roles;
    }

    public Set<SysPermissionDTO> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<SysPermissionDTO> permissions) {
        this.permissions = permissions;
    }

    public SysDeptDTO getDept() {
        return dept;
    }

    public void setDept(SysDeptDTO dept) {
        this.dept = dept;
    }

    public SysPostDTO getPost() {
        return post;
    }

    public void setPost(SysPostDTO post) {
        this.post = post;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String[] getAuthorities() {
        return authorities;
    }

    public void setAuthorities(String[] authorities) {
        this.authorities = authorities;
    }
}
