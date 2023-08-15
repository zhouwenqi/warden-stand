package com.microwarp.warden.stand.facade.sysuser.dto;


/**
 * dto - 系统用户请求信息
 * @author zhouwenqi
 */
public class SysUserRequestDTO extends SysUserDTO {
    private static final long serialVersionUID = 3908591718694724877L;
    /** 角色id */
    private Long[] roleIds;

    public Long[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds) {
        this.roleIds = roleIds;
    }
}
