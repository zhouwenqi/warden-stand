package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;

import java.util.List;

/**
 * dao - 部门
 * @author zhouwenqi
 */
public interface SysDeptDao extends IService<SysDept> {
    /**
     * 查询部门信息
     * @param id 部门ID
     * @return
     */
    SysDeptDTO findById(Long id);
    /**
     * 查询子部门列表
     * @param parentId 上级部门ID
     * @return
     */
    List<SysDeptTreeDTO> findByParentId(Long parentId);
}
