package com.microwarp.warden.stand.common.core.pageing;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * pageable - 分页信息
 * 带排序参数
 */
public class Pageable implements IPageable {
    /** 排序参数 */
    private List<SortField> sorts = new ArrayList<SortField>();

    private PageInfo pageInfo = new PageInfo();

    @Override
    public List<SortField> getSorts() {
        return sorts;
    }

    public void setSorts(List<SortField> sorts) {
        this.sorts = sorts;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
