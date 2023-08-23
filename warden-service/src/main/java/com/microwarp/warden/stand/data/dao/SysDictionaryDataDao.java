package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysDictionaryData;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;

import java.util.List;

/**
 * dao - 字典数据
 * @author zhouwenqi
 */
public interface SysDictionaryDataDao extends IService<SysDictionaryData> {
    /**
     * 查询字典数据信息
     * @param id 字典数据id
     * @return
     */
    SysDictionaryDataDTO findById(Long id);

    /**
     * 反向查询字典code
     * @param ids 字典数据id列表
     * @return
     */
    String[] findDictCodeByIds(Long...ids);

    /**
     * 删除字典数据
     * @param dictId 字典id
     */
    void deleteByDictId(Long... dictId);
}
