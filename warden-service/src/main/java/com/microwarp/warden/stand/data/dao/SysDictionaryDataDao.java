package com.microwarp.warden.stand.data.dao;

import com.microwarp.warden.stand.data.basic.BaseDao;
import com.microwarp.warden.stand.data.entity.SysDictionaryData;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;


/**
 * dao - 字典数据
 * @author zhouwenqi
 */
public interface SysDictionaryDataDao extends BaseDao<SysDictionaryData> {
    /**
     * 查询字典数据信息
     * @param id 字典数据id
     * @return
     */
    SysDictionaryDataDTO findById(Long id);

    /**
     * 删除字典数据
     * @param dictId 字典id
     */
    void deleteByDictId(Long... dictId);
}
