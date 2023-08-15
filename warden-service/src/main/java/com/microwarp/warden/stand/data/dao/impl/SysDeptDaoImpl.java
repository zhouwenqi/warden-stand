package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysDeptConvert;
import com.microwarp.warden.stand.data.dao.SysDeptDao;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.data.mapper.SysDeptMapper;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import org.springframework.stereotype.Repository;

/**
 * dao - 部门 - impl
 * @author zhouwenqi
 */
@Repository
public class SysDeptDaoImpl extends ServiceImpl<SysDeptMapper,SysDept> implements SysDeptDao {
    public SysDeptDTO findById(Long id){
        SysDept sysDept = this.baseMapper.selectById(id);
        return null != sysDept ? SysDeptConvert.Instance.sysDeptToSysDeptDTO(sysDept) : null;
    }
}
