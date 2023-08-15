package com.microwarp.warden.stand.facade.sysrole.dto;

import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;

import java.util.Set;

/**
 * dto - 系统角色详情
 */
public class SysRoleDetailsDTO extends SysRoleDTO {
    /** 权限列表 */
    private Set<SysPermissionDTO> permissions;

    public Set<SysPermissionDTO> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<SysPermissionDTO> permissions) {
        this.permissions = permissions;
    }
}
