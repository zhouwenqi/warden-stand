package com.microwarp.warden.stand.admin.domain.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.microwarp.warden.stand.admin.domain.ExcelBaseEnumConverter;
import com.microwarp.warden.stand.common.core.enums.ActionStatusEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;

import java.util.Date;

/**
 * excel - 登录日志
 */
public class SysLoginLogExcel {
    @ExcelProperty("ID")
    private Long id;
    @ExcelProperty("用户ID")
    private Long userId;
    @ExcelProperty("用户帐号")
    private String uid;
    @ExcelProperty(value = "状态", converter = ExcelBaseEnumConverter.class)
    private ActionStatusEnum status;
    @ExcelProperty(value = "应用终端类型", converter = ExcelBaseEnumConverter.class)
    private AppTerminalEnum appTerminalType;
    @ExcelProperty(value = "平台类型", converter = ExcelBaseEnumConverter.class)
    private PlatformTypeEnum platformType;
    @ExcelProperty("ip地址")
    private String ip;
    @ExcelProperty("位置")
    private String location;
    @ExcelProperty("日志内容")
    private String content;
    @ExcelProperty("创建时间")
    private Date createDate;
    @ExcelProperty("修改时间")
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
