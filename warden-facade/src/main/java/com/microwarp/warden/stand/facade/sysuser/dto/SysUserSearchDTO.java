package com.microwarp.warden.stand.facade.sysuser.dto;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto - 系统用户过滤
 * @author zhouwenqi
 */
public class SysUserSearchDTO extends BasicSearchDTO {
    private Long deptId;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }
}
