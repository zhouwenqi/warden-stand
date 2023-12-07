package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.microwarp.warden.stand.data.basic.BaseDaoImpl;
import com.microwarp.warden.stand.data.convert.SysDictionaryDataConvert;
import com.microwarp.warden.stand.data.dao.SysDictionaryDataDao;
import com.microwarp.warden.stand.data.entity.SysDictionaryData;
import com.microwarp.warden.stand.data.mapper.SysDictionaryDataMapper;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * dao - 字典数据 - impl
 */
@Repository
public class SysDictionaryDataDaoImpl extends BaseDaoImpl<SysDictionaryDataMapper,SysDictionaryData> implements SysDictionaryDataDao {
    /**
     * 查询字典数据信息
     * @param id 字典数据id
     * @return
     */
    public SysDictionaryDataDTO findById(Long id){
        if(null == id){
            return null;
        }
        SysDictionaryData sysDictionaryData = baseMapper.selectById(id);
        if(null == sysDictionaryData){
            return null;
        }
        return SysDictionaryDataConvert.Instance.sysDictionaryDataToSysDictionaryDataDTO(sysDictionaryData);
    }


    /**
     * 删除字典数据
     * @param dictId 字典id
     */
    public void deleteByDictId(Long... dictId){
        QueryWrapper<SysDictionaryData> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("dict_id", Arrays.asList(dictId));
        baseMapper.delete(queryWrapper);
    }
}
