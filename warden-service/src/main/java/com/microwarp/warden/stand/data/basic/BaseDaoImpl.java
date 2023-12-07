package com.microwarp.warden.stand.data.basic;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.CaseFormat;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.Map;

/**
 * service - DAO基类服务 - impl
 * @author zhouwenqi
 */
public class BaseDaoImpl<M extends BaseMapper<T>,T> extends ServiceImpl<M,T> implements BaseDao<T> {
    /**
     * 设置基础过滤条件
     * @param queryWrapper 查询wrapper
     * @param searchDTO 过滤条件
     */
    @Override
    public void useBaseFilter(QueryWrapper<T> queryWrapper, BasicSearchDTO searchDTO){
        if(null == searchDTO){
            return;
        }
        if(null != searchDTO.getAppTerminalType() && searchDTO.getAppTerminalType().length > 0) {
            queryWrapper.and(true, wrapper -> wrapper.in("app_terminal_type", Arrays.asList(searchDTO.getAppTerminalType())));
        }
        if(null != searchDTO.getPlatformType() && searchDTO.getPlatformType().length > 0) {
            queryWrapper.and(true, wrapper -> wrapper.in("platform_type", Arrays.asList(searchDTO.getPlatformType())));
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
    @Override
    public void useMapFilter(QueryWrapper<T> queryWrapper, Map<String,String> map){
        for(Map.Entry<String,String> entry : map.entrySet()){
            if(StringUtils.isNotBlank(entry.getKey()) && StringUtils.isNotBlank(entry.getValue())){
                final String key = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,entry.getKey());
                queryWrapper.and(true, wrapper -> wrapper.eq(key, entry.getValue()));
            }
        }
    }
}
