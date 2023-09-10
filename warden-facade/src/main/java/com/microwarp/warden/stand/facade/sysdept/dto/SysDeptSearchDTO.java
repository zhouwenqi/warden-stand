package com.microwarp.warden.stand.facade.sysdept.dto;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto -  部门过滤查询
 */
public class SysDeptSearchDTO extends BasicSearchDTO {
    /** 负责人id */
    private Long leaderId;
    /** 禁用 */
    private Boolean disabled;

    public Long getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Long leaderId) {
        this.leaderId = leaderId;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }
}
