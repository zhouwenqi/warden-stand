package com.microwarp.warden.stand.facade.syspermission.dto;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto - 系统权限查询
 * @author zhouwenqi
 */
public class SysPermissionSearchDTO extends BasicSearchDTO {
    private Long roleId;
    private Long userId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
