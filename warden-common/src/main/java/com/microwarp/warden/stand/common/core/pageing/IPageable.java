package com.microwarp.warden.stand.common.core.pageing;

import java.util.Set;

/**
 * interface - 分页信息
 * 带排序参数
 */
public interface IPageable {
    Set<SortField> getSorts();
}
