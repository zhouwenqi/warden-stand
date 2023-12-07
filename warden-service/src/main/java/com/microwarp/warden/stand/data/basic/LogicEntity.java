package com.microwarp.warden.stand.data.basic;

import com.baomidou.mybatisplus.annotation.TableLogic;

/**
 * entity - 逻辑基类
 * @author zhouwenqi
 */
public class LogicEntity extends BaseEntity {
    private static final long serialVersionUID = 2139696935536246002L;
    /** 逻辑删除 */
    @TableLogic
    private boolean deleted;

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
