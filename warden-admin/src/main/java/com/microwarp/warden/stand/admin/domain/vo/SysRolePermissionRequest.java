package com.microwarp.warden.stand.admin.domain.vo;


import javax.validation.constraints.NotNull;

/**
 * vo - 修改角色权限 - request
 */
public class SysRolePermissionRequest {
    @NotNull(message = "角色id不能为空")
    private Long roleId;
    @NotNull(message = "权限值不能为null可以为[]")
    private Long[] permissionIds;
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long[] getPermissionIds() {
        return permissionIds;
    }

    public void setPermissionIds(Long[] permissionIds) {
        this.permissionIds = permissionIds;
    }
}
