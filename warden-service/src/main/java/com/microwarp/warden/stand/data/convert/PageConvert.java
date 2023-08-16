package com.microwarp.warden.stand.data.convert;

import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.SortDirection;
import com.microwarp.warden.stand.common.core.pageing.SortField;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;
import org.mapstruct.factory.Mappers;

import java.util.List;
import java.util.Set;

/**
 * 对象复制 - 翻页
 * @author zhouwenqi
 */
@Mapper
public interface PageConvert {
    PageConvert Instance = Mappers.getMapper(PageConvert.class);
    @Mapping(target = "column", source = "sortKey")
    @Mapping(target = "asc", source = "direction", qualifiedByName = "getAsc")
    OrderItem sortFieldToOrderItem(SortField sortField);
    List<OrderItem> sortFieldsToOrderItems(Set<SortField> sortFieldSet);
    @Named("getAsc")
    default Boolean getAsc(SortDirection direction){
        return direction.equals(SortDirection.ASC);
    }
    @Mappings(
            @Mapping(source="pages", target = "pageCount")
    )
    PageInfo pageToPageInfo(Page page);
}
