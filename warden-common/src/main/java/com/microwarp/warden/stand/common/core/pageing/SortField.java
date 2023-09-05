package com.microwarp.warden.stand.common.core.pageing;

import com.google.common.base.CaseFormat;

/**
 * pageable - 排序字段
 */
public class SortField {
    /** 排序字段 */
    private String sortKey;
    /** 排序方向 */
    private SortDirection direction = SortDirection.ASC;

    public String getSortKey() {
        return sortKey;
    }

    public void setSortKey(String sortKey) {
        // 鸵峰转下划线
        this.sortKey = CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE,sortKey);
    }

    public SortDirection getDirection() {
        return direction;
    }

    public void setDirection(SortDirection direction) {
        this.direction = direction;
    }

    @Override
    public boolean equals(Object object){
        if(null == object){
            return false;
        }
        if(this == object){
            return true;
        }
        if(object instanceof SortField){
            SortField sortField = (SortField)object;
            return sortField.sortKey.equals(this.getSortKey());
        }
        return false;
    }

    @Override
    public int hashCode(){
        return sortKey.hashCode();
    }
}
