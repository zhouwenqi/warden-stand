package com.microwarp.warden.stand.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.microwarp.warden.stand.data.entity.SysDictionary;

import java.util.List;

/**
 * mapper - 字典
 * @author zhouwenqi
 */
public interface SysDictionaryMapper extends BaseMapper<SysDictionary> {
    /** 使用字典数据id反向查询字典code */
    List<String> findCodeByDataIds(Long...ids);
    /** 使用字典id反向查询字典code */
    List<String> findCodeByIds(Long...ids);
}
