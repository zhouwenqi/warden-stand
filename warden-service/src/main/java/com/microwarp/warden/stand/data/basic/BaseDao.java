package com.microwarp.warden.stand.data.basic;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;

import java.util.Map;

/**
 * service - DAO基类服务
 * @author zhouwenqi
 */
public interface BaseDao<T> extends IService<T> {
    /**
     * 设置基础过滤条件
     * @param queryWrapper 查询wrapper
     * @param searchDTO 过滤条件
     */
    void useBaseFilter(QueryWrapper<T> queryWrapper, BasicSearchDTO searchDTO);

    /**
     * 设置Map过滤条件
     * @param queryWrapper 查询wrapper
     * @param map 过滤条件
     */
    void useMapFilter(QueryWrapper<T> queryWrapper, Map<String, String> map);
}
