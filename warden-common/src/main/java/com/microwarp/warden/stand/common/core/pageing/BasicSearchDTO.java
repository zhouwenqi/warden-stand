package com.microwarp.warden.stand.common.core.pageing;

import java.util.Date;

/**
 * 基本查询参数
 */
public class BasicSearchDTO {
    /** 创建时间区间 */
    private Date[] createDate;
    /** 修改时间区间 */
    private Date[]  updateDate;

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
}
