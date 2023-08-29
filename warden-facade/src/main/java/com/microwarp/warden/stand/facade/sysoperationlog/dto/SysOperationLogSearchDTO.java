package com.microwarp.warden.stand.facade.sysoperationlog.dto;

import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

/**
 * dto -  操作日志过滤查询
 */
public class SysOperationLogSearchDTO extends BasicSearchDTO {
    /** 用户id */
    private Long userId;
    /** 对应模块id */
    private Long mateId;
    /** 动作类型 */
    private ActionTypeEnum actionType;
    /** 模块类型 */
    private ModuleTypeEnum moduleType;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getMateId() {
        return mateId;
    }

    public void setMateId(Long mateId) {
        this.mateId = mateId;
    }

    public ActionTypeEnum getActionType() {
        return actionType;
    }

    public void setActionType(ActionTypeEnum actionType) {
        this.actionType = actionType;
    }

    public ModuleTypeEnum getModuleType() {
        return moduleType;
    }

    public void setModuleType(ModuleTypeEnum moduleType) {
        this.moduleType = moduleType;
    }
}
