package com.microwarp.warden.stand.facade.sysloginlog.dto;

import com.microwarp.warden.stand.common.core.enums.ActionStatusEnum;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto -  登录日志过滤查询
 */
public class SysLoginLogSearchDTO extends BasicSearchDTO {
    /** 用户id */
    private Long userId;
    /** 状态 */
    private ActionStatusEnum status;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public ActionStatusEnum getStatus() {
        return status;
    }

    public void setStatus(ActionStatusEnum status) {
        this.status = status;
    }
}
