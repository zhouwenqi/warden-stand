package com.microwarp.warden.stand.common.core.pageing;

import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;

import java.util.Date;

/**
 * 基本查询参数
 */
public class BasicSearchDTO {
    /** 创建时间区间 */
    private Date[] createDate;
    /** 修改时间区间 */
    private Date[]  updateDate;
    /** 应用终端类型 */
    private AppTerminalEnum[] appTerminalType;
    /** 平台类型 */
    private PlatformTypeEnum[] platformType;

    public Date[] getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date[] createDate) {
        this.createDate = createDate;
    }

    public Date[] getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date[] updateDate) {
        this.updateDate = updateDate;
    }

    public AppTerminalEnum[] getAppTerminalType() {
        return appTerminalType;
    }

    public void setAppTerminalType(AppTerminalEnum[] appTerminalType) {
        this.appTerminalType = appTerminalType;
    }

    public PlatformTypeEnum[] getPlatformType() {
        return platformType;
    }

    public void setPlatformType(PlatformTypeEnum[] platformType) {
        this.platformType = platformType;
    }
}
