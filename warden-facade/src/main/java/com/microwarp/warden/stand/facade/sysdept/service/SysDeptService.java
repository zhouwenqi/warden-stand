package com.microwarp.warden.stand.facade.sysdept.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptSearchDTO;

/**
 * service - 部门
 * @author zhouwenqi
 */
public interface SysDeptService {

    /**
     * 查询部门信息
     * @param id 部门id
     * @return
     */
    SysDeptDTO findById(Long id);
    /**
     * 创建部门
     * @param sysDeptDTO 部门信息
     * @return
     */
    SysDeptDTO create(SysDeptDTO sysDeptDTO);
    /**
     * 更新部门信息
     * @param sysDeptDTO 部门id
     */
    void update(SysDeptDTO sysDeptDTO);
    /**
     * 删除部门信息
     * @param id 部门id
     */
    void delete(Long...id);
    /**
     * 分页查询部门信息
     * @param iSearchPageable 查询参数
     * @return
     */
    ResultPage<SysDeptDTO> findPage(ISearchPageable<SysDeptSearchDTO> iSearchPageable);
}
