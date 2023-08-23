package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysDictionaryConvert;
import com.microwarp.warden.stand.data.dao.SysDictionaryDao;
import com.microwarp.warden.stand.data.entity.SysDictionary;
import com.microwarp.warden.stand.data.mapper.SysDictionaryMapper;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * dao - 字典 - impl
 * @author zhouwenqi
 */
@Repository
public class SysDictionaryDaoImpl extends ServiceImpl<SysDictionaryMapper,SysDictionary> implements SysDictionaryDao {
    /**
     * 查询字典信息
     * @param id 字典id
     * @return
     */
    public SysDictionaryDTO findById(Long id){
        if(null == id){
            return null;
        }
        SysDictionary sysDictionary = baseMapper.selectById(id);
        if(null == sysDictionary){
            return null;
        }
        return SysDictionaryConvert.Instance.sysDictionaryToSysDictionaryDTO(sysDictionary);
    }

    /**
     * 查询字典信息
     * @param code 字典编码
     * @return
     */
    public SysDictionaryDTO findByCode(String code){
        if(StringUtils.isBlank(code)){
            return null;
        }
        QueryWrapper<SysDictionary> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("code",code);
        SysDictionary sysDictionary = baseMapper.selectOne(queryWrapper);
        if(null == sysDictionary){
            return null;
        }
        return SysDictionaryConvert.Instance.sysDictionaryToSysDictionaryDTO(sysDictionary);
    }

}
