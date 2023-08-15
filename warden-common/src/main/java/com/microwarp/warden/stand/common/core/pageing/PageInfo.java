package com.microwarp.warden.stand.common.core.pageing;

/**
 * pageable - 分页信息
 */
public class PageInfo implements IPageInfo {
    /** 当页页码 */
    private long current = 1;
    /** 总页数 */
    private long pageCount = 0;
    /** 分页行数 */
    private long pageSize = 10;
    /** 数据集总数 */
    private long total = 0;

    public long getCurrent() {
        return current;
    }

    public void setCurrent(long current) {
        this.current = current;
    }

    public long getPageCount() {
        return pageCount;
    }

    public void setPageCount(long pageCount) {
        this.pageCount = pageCount;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }
}
