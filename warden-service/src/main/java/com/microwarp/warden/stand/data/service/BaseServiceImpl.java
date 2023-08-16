package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.common.base.CaseFormat;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;

/**
 * service - base
 */
public class BaseServiceImpl<T> {

    /**
     * 设置基础过滤条件
     * @param queryWrapper 查询wrapper
     * @param searchDTO 过滤条件
     */
    public void useBaseFilter(QueryWrapper<T> queryWrapper, BasicSearchDTO searchDTO){
        if(null == searchDTO){
            return;
        }
        if(null != searchDTO.getAppTerminalType()) {
            queryWrapper.and(true, wrapper -> wrapper.eq("app_terminal_type", searchDTO.getAppTerminalType()));
        }
        if(null != searchDTO.getPlatformType()) {
            queryWrapper.and(true, wrapper -> wrapper.eq("platform_type", searchDTO.getPlatformType()));
        }
        if(null != searchDTO.getCreateDate() && searchDTO.getCreateDate().length > 0){
            if(searchDTO.getCreateDate().length < 2){
                queryWrapper.and(true, wrapper -> wrapper.ge("create_date",searchDTO.getCreateDate()[0]));
            }else{
                queryWrapper.and(true, wrapper -> wrapper.between("create_date",searchDTO.getCreateDate()[0],searchDTO.getCreateDate()[1]));
            }
        }
    }

    /**
     * 设置Map过滤条件
     * @param queryWrapper 查询wrapper
     * @param map 过滤条件
     */
    public void useMapFilter(QueryWrapper<T> queryWrapper, Map<String,String> map){
        for(Map.Entry<String,String> entry : map.entrySet()){
            if(StringUtils.isNotBlank(entry.getKey()) && StringUtils.isNotBlank(entry.getValue())){
                final String key = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,entry.getKey());
                queryWrapper.and(true, wrapper -> wrapper.eq(key, entry.getValue()));
            }
        }
    }
}
