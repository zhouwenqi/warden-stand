package com.microwarp.warden.stand.facade.sysdept.service;

import com.microwarp.warden.stand.common.core.pageing.BaseSortDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptSearchDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;

import java.util.List;

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
     * 获取部门信息(含子部门列表)
     * @param id
     * @return
     */
    SysDeptTreeDTO findChildsById(Long id);

    /**
     * 获取部门树型结构
     * @return 树型数据
     */
    List<SysDeptTreeDTO> findTrees();
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
     * 部门拖曳和排序
     * @param baseSortDTO 排序数据
     */
    void dragAndSort(BaseSortDTO baseSortDTO);
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
