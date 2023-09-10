package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysRoleConvert;
import com.microwarp.warden.stand.data.dao.SysRoleDao;
import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.data.mapper.SysRoleMapper;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.Collectors;

/**
 * dao - 系统角色 - impl
 * @author zhouwenqi
 */
@Repository
public class SysRoleDaoImpl extends ServiceImpl<SysRoleMapper,SysRole> implements SysRoleDao {

    /**
     * 查询用户角色列表
     * @param userId 用户id
     * @return
     */
    @Override
    public List<SysRoleDTO> findByUserId(Long userId){
        List<SysRole> list = this.baseMapper.findByUserId(userId);
        return null == list ? new ArrayList<>() : SysRoleConvert.Instance.sysRolesToSysRoleDTOs(list);
    }

    /**
     * 查询角色列表
     * @param ids 角色id
     * @return
     */
    @Override
    public List<SysRoleDTO> findByIds(Long...ids){
        List<SysRole> list = baseMapper.selectBatchIds(Arrays.asList(ids));
        return null == list ? new ArrayList<>() : SysRoleConvert.Instance.sysRolesToSysRoleDTOs(list);
    }

    /**
     * 查询所有角色列表
     * @return
     */
    public List<SysRoleDTO> findAll(){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("orders");
        List<SysRole> list = baseMapper.selectList(queryWrapper);
        return null == list ? new ArrayList<>() : SysRoleConvert.Instance.sysRolesToSysRoleDTOs(list);
    }

    /**
     * 查询角色列表
     * @param values 角色值
     * @return
     */
    @Override
    public List<SysRoleDTO> findByValues(String...values){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("value",Arrays.asList(values));
        List<SysRole> list = baseMapper.selectList(queryWrapper);
        return null == list ? new ArrayList<>() : SysRoleConvert.Instance.sysRolesToSysRoleDTOs(list);
    }



    /**
     * 删除用户角色关联信息
     * @param userId 用户id
     */
    public void deleteRoleByUserId(Long userId){
        baseMapper.deleteRoleByUserId(userId);
    }

    /**
     * 删除角色信息
     * @param ids 角色id
     */
    public void deleteByIds(Long[] ids){
        // 删除角色与用户关键信息
        baseMapper.deleteRoleByIds(ids);
        // 删除角色信息
        baseMapper.deleteBatchIds(Arrays.asList(ids));
    }

    /**
     * 保存用户角色关系信息
     * @param userId 用户id
     * @param roleIds 角色id列表
     */
    public void saveUserRoles(Long userId,Long... roleIds){
        if(null == userId || null == roleIds){
            return;
        }
        baseMapper.deleteRoleByUserId(userId);
        if(roleIds.length < 1){
            return;
        }
        List<Map> list = new ArrayList<>();
        for(Long roleId : roleIds){
            Map<String,Long> map = new HashMap<>();
            map.put("userId",userId);
            map.put("roleId",roleId);
            list.add(map);
        }
        baseMapper.insertRoleUser(list);
    }
}
