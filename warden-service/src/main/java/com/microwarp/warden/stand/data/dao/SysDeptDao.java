package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;

/**
 * dao - 部门
 * @author zhouwenqi
 */
public interface SysDeptDao extends IService<SysDept> {
    SysDeptDTO findById(Long id);
}
