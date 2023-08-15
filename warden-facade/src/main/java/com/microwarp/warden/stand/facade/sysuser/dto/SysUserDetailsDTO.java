package com.microwarp.warden.stand.facade.sysuser.dto;

import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;

import java.util.Set;

/**
 * dto - 系统用户详情
 * @author zhouwenqi
 */
public class SysUserDetailsDTO extends SysUserDTO {
    private static final long serialVersionUID = 8738884156568220156L;
    /** 角色列表 */
    private Set<SysRoleDTO> roles;
    /** 权限列表 */
    private Set<SysPermissionDTO> permissions;
    /** 部门 */
    private SysDeptDTO dept;
    /** 岗位 */
    private SysPostDTO post;

    public Set<SysRoleDTO> getRoles() {
        return roles;
    }

    public void setRoles(Set<SysRoleDTO> roles) {
        this.roles = roles;
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

    public Set<SysPermissionDTO> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<SysPermissionDTO> permissions) {
        this.permissions = permissions;
    }
}
