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
     * 使用字典id反向查询字典code
     * @param ids 字典数据id列表
     * @return
     */
    public String[] findDCodeByIds(Long...ids){
        List<String> list = baseMapper.findCodeByIds(ids);
        if(null != list && list.size()>0){
            return list.toArray(new String[list.size()]);
        }
        return new String[0];
    }

    /**
     * 使用字典数据id反向查询字典code
     * @param ids 字典数据id列表
     * @return
     */
    public String[] findCodeByDataIds(Long...ids){
        List<String> list = baseMapper.findCodeByDataIds(ids);
        if(null != list && list.size()>0){
            return list.toArray(new String[list.size()]);
        }
        return new String[0];
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
        queryWrapper.last("limit 1");
        SysDictionary sysDictionary = baseMapper.selectOne(queryWrapper);
        if(null == sysDictionary){
            return null;
        }
        return SysDictionaryConvert.Instance.sysDictionaryToSysDictionaryDTO(sysDictionary);
    }

}
