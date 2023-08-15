package com.microwarp.warden.stand.facade.sysuser.dto;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * Created by Administrator on 2023/7/25.
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
