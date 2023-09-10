package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysDeptConvert;
import com.microwarp.warden.stand.data.dao.SysDeptDao;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.data.mapper.SysDeptMapper;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * dao - 部门 - impl
 * @author zhouwenqi
 */
@Repository
public class SysDeptDaoImpl extends ServiceImpl<SysDeptMapper,SysDept> implements SysDeptDao {

    /**
     * 查询部门信息
     * @param id 部门ID
     * @return
     */
    public SysDeptDTO findById(Long id){
        SysDept sysDept = this.baseMapper.selectById(id);
        return null != sysDept ? SysDeptConvert.Instance.sysDeptToSysDeptDTO(sysDept) : null;
    }

    /**
     * 查询子部门列表
     * @param parentId 上级部门ID
     * @return
     */
    public List<SysDeptTreeDTO> findByParentId(Long parentId){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("parent_id",parentId);
        queryWrapper.orderByAsc("orders");
        List<SysDept> list = baseMapper.selectList(queryWrapper);
        return null == list ? new ArrayList<>() : SysDeptConvert.Instance.sysDeptsToSysDeptTreeDTOs(list);
    }
}
