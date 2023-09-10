package com.microwarp.warden.stand.admin.domain;

import com.microwarp.warden.stand.common.core.pageing.BaseSortDTO;

import javax.validation.constraints.NotNull;

/**
 * 数据拖拽重排请求
 * @author zhouwenqi
 */
public class SortRequest implements BaseSortDTO {
    /** 拖拽对象ID */
    private Long dragId;
    /** 父级对象ID */
    private Long parentId;
    /** 拖曳后对象所在例如重排后的ID组数 */
    @NotNull(message = "重排数据不能为空")
    private Long[] ids;

    @Override
    public Long getDragId() {
        return dragId;
    }

    public void setDragId(Long dragId) {
        this.dragId = dragId;
    }

    @Override
    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Override
    public Long[] getIds() {
        return ids;
    }

    public void setIds(Long[] ids) {
        this.ids = ids;
    }
}
