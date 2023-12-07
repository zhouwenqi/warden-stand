package com.microwarp.warden.stand.data.basic;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.util.Date;

/**
 * entity - 基类
 * @author zhouwenqi
 */
public class BaseEntity implements Serializable {
    private static final long serialVersionUID = 6830328944244879075L;
    /** 自增id */
    @TableId(type = IdType.AUTO)
    private Long id;
    /** 创建时间 */
    @TableField(fill = FieldFill.INSERT)
    private Date createDate;
    /** 修改时间 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
