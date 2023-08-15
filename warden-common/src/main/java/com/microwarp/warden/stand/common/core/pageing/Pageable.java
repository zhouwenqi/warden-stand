package com.microwarp.warden.stand.common.core.pageing;

import java.util.HashSet;
import java.util.Set;

/**
 * pageable - 分页信息
 * 带排序参数
 */
public class Pageable implements IPageable {
    /** 排序参数 */
    private Set<SortField> sorts = new HashSet<>();

    private PageInfo pageInfo = new PageInfo();

    public Set<SortField> getSorts() {
        return sorts;
    }

    public void setSorts(Set<SortField> sorts) {
        this.sorts = sorts;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
