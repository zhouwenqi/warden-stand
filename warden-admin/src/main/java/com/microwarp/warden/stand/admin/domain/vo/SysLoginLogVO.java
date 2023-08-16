package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.enums.ActionStatusEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;

import java.util.Date;

/**
 * vo - 登录日志 - response
 */
public class SysLoginLogVO {
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
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;

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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
