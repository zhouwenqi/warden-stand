package com.microwarp.warden.stand.facade.sysdictionary.dto;

import java.util.Date;

/**
 * dto - 字典数据
 * @author zhouwenqi
 */
public class SysDictionaryDataDTO {
    private Long id;
    /** 字典id */
    private Long dictId;
    /** key */
    private String dataKey;
    /** 值 */
    private String dataValue;
    /** 别名 */
    private String dataAlias;
    /** 描述 */
    private String description;
    /** 默认项 */
    private Boolean dataDefault;
    /** 排序 */
    private Integer orders;
    /** 是否禁用 */
    private Boolean disabled;
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

    public Long getDictId() {
        return dictId;
    }

    public void setDictId(Long dictId) {
        this.dictId = dictId;
    }

    public String getDataKey() {
        return dataKey;
    }

    public void setDataKey(String dataKey) {
        this.dataKey = dataKey;
    }

    public String getDataValue() {
        return dataValue;
    }

    public void setDataValue(String dataValue) {
        this.dataValue = dataValue;
    }

    public String getDataAlias() {
        return dataAlias;
    }

    public void setDataAlias(String dataAlias) {
        this.dataAlias = dataAlias;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDataDefault() {
        return dataDefault;
    }

    public void setDataDefault(Boolean dataDefault) {
        this.dataDefault = dataDefault;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
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

    @Override
    public boolean equals(Object object){
        if(null == object){
            return false;
        }
        if(this == object){
            return true;
        }
        if(object instanceof SysDictionaryDataDTO){
            SysDictionaryDataDTO sysPermissionDTO = (SysDictionaryDataDTO)object;
            return sysPermissionDTO.getId().equals(getId());
        }
        return false;
    }
    @Override
    public int hashCode(){
        return id.hashCode();
    }
}
