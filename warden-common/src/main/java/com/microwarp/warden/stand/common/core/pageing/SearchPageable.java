package com.microwarp.warden.stand.common.core.pageing;

import java.util.HashMap;
import java.util.Map;

/**
 * pageable - 查询分页
 *
 * ======= 注意 =======
 * 查询内容(searchValue) 为主要 like 条件(多个字段就 or)
 * 过滤内容(filters)为附件 and 条件
 *
 */
public class SearchPageable<T> extends Pageable implements ISearchPageable<T> {
    /** 查询关键词 */
    private String searchKey;
    /** 查询内容 */
    private String searchValue;
    /** 过滤条件 */
    private T filters;

    public String getSearchKey() {
        return searchKey;
    }

    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    @Override
    public T getFilters() {
        return filters;
    }

    public void setFilters(T filters) {
        this.filters = filters;
    }

    public String getSortString(){
        StringBuilder stringBuilder = new StringBuilder();
        if(null != this.getSorts() && this.getSorts().size() > 0){
            int length = 0;
            for(SortField sortField:this.getSorts()){
                stringBuilder.append(sortField.getSortKey());
                stringBuilder.append(" ");
                stringBuilder.append(sortField.getDirection());
                if(length < this.getSorts().size()){
                    stringBuilder.append(",");
                }
            }
        }
        return stringBuilder.toString();
    }
}
