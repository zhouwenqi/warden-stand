package com.microwarp.warden.stand.common.core.pageing;

import java.util.List;

/**
 * interface - 分页信息
 * 带排序参数
 */
public interface IPageable {
    List<SortField> getSorts();
}
