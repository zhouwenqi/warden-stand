package com.microwarp.warden.stand.data.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.microwarp.warden.stand.common.core.enums.*;

/**
 * entity - 登录日志
 * @author zhouwenqi
 */
@TableName("wd_sys_login_log")
public class SysLoginLog extends LogicEntity {
    private static final long serialVersionUID = -5254418036048563593L;
    /** 用户id */
    private Long userId;
    /** 用户帐号 */
    private String uid;
    /** 状态 */
    private ActionStatusEnum status;
    /** 应用终端类型 */
    private AppTerminalEnum appTerminalType;
    /** 平台类型 */
    private PlatformTypeEnum platformType;
    /** 模块类型 */
    private ModuleTypeEnum moduleType;
    /** ip地址 */
    private String ip;
    /** 位置 */
    private String location;
    /** 日志内容 */
    private String content;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public ActionStatusEnum getStatus() {
        return status;
    }

    public void setStatus(ActionStatusEnum status) {
        this.status = status;
    }

    public AppTerminalEnum getAppTerminalType() {
        return appTerminalType;
    }

    public void setAppTerminalType(AppTerminalEnum appTerminalType) {
        this.appTerminalType = appTerminalType;
    }

    public PlatformTypeEnum getPlatformType() {
        return platformType;
    }

    public void setPlatformType(PlatformTypeEnum platformType) {
        this.platformType = platformType;
    }

    public ModuleTypeEnum getModuleType() {
        return moduleType;
    }

    public void setModuleType(ModuleTypeEnum moduleType) {
        this.moduleType = moduleType;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
