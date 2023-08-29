package com.microwarp.warden.stand.admin.domain.vo;

import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;

import java.util.Date;

/**
 * vo - 操作日志 - response
 */
public class SysOperationLogVO {
    private Long id;
    /** 用户id */
    private Long userId;
    /** 用户帐号 */
    private String uid;
    /** 动作类型 */
    private ActionTypeEnum actionType;
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
    /** 对应模块id */
    private Long mateId;
    /** 创建时间 */
    private Date createDate;
    /** 修改时间 */
    private Date updateDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public ActionTypeEnum getActionType() {
        return actionType;
    }

    public void setActionType(ActionTypeEnum actionType) {
        this.actionType = actionType;
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

    public Long getMateId() {
        return mateId;
    }

    public void setMateId(Long mateId) {
        this.mateId = mateId;
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
