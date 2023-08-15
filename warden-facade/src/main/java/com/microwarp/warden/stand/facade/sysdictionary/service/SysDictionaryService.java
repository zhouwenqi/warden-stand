package com.microwarp.warden.stand.facade.sysdictionary.service;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;

/**
 * service - 字典
 * @author zhouwenqi
 */
public interface SysDictionaryService {
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
    /**
     * 创建字典
     * @param sysDictionaryDTO 字典信息
     * @return
     */
    SysDictionaryDTO create(SysDictionaryDTO sysDictionaryDTO);
    /**
     * 更新字典
     * @param sysDictionaryDTO 字典信息
     */
    void update(SysDictionaryDTO sysDictionaryDTO);
    /**
     * 删除字典信息
     * @param id 字典id
     */
    void delete(Long...id);
    /**
     * 分页查询字典信息
     * @param iSearchPageable 查询参数
     * @return
     */
    ResultPage<SysDictionaryDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable);

}
