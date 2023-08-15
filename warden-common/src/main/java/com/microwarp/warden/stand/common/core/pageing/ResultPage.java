package com.microwarp.warden.stand.common.core.pageing;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * pageable - 分页查询结果
 */
public class ResultPage<E> implements Serializable {
    private static final long serialVersionUID = -986558128471594750L;
    private PageInfo pageInfo;
    private List<E> list = new ArrayList<E>();

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

    public List<E> getList() {
        return list;
    }

    public void setList(List<E> list) {
        this.list = list;
    }
}
