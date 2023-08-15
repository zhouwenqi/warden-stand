package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysDictionary;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;

/**
 * dao - 字典
 * @author zhouwenqi
 */
public interface SysDictionaryDao extends IService<SysDictionary> {
    /**
     * 查询字典信息
     * @param id 字典id
     * @return
     */
    SysDictionaryDTO findById(Long id);
    /**
     * 查询字典信息
     * @param code 字典编码
     * @return
     */
    SysDictionaryDTO findByCode(String code);
}
