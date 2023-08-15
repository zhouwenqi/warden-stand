package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;

/**
 * entity - 操作日志
 * @author zhouwenqi
 */
@TableName("wd_sys_operation_log")
public class SysOperationLog extends LogicEntity {
    /** 用户id */
    private Long user_id;
    /** 用户帐号 */
    private String uid;
    /** 动作类型 */
    private ActionTypeEnum actoinType;
    /** 应用终端类型 */
    private AppTerminalEnum appTerminalType;
    /** 平台类型 */
    private PlatformTypeEnum platformType;
    /** 模块类型 */
    private ModuleTypeEnum moduleType;
    /** ip地址 */
    private String ip;
    /** 日志内容 */
    private String content;
    /** 对应模块id */
    private Long mateId;
}
