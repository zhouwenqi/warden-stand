package com.microwarp.warden.stand.common.core.pageing;

import java.util.Map;

/**
 * interface - 查询分页
 */
public interface ISearchPageable<T> extends IPageable {
    /** 查询关键词 */
    String getSearchKey();
    /** 查询内容 */
    String getSearchValue();
    /** 过滤条件 */
    T getFilters();
    /** 过虑条件字符串 */
    String getSortString();

    PageInfo getPageInfo();
}
