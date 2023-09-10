package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysPermissionConvert;
import com.microwarp.warden.stand.data.dao.SysPermissionDao;
import com.microwarp.warden.stand.data.entity.SysPermission;
import com.microwarp.warden.stand.data.mapper.SysPermissionMapper;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * dao - 系统权限 - impl
 * @author zhouwenqi
 */
@Repository
public class SysPermissionDaoImpl extends ServiceImpl<SysPermissionMapper,SysPermission> implements SysPermissionDao {
    /**
     * 查询所有权限
     * @return
     */
    public List<SysPermissionDTO> findAll(){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("orders");
        List<SysPermission> list = baseMapper.selectList(queryWrapper);
        if(null == list || list.size() < 0){
            return new ArrayList<>();
        }
        return SysPermissionConvert.Instance.sysPermissionsToSysPermissionDTOs(list);
    }

    /**
     * 根据角色id数组查询权限列表(entity)
     * @param roleIds 角色id数组
     * @return
     */
    @Override
    public List<SysPermissionDTO> findByRoleIds(Long ...roleIds){
        if(null == roleIds || roleIds.length < 1){
            return new ArrayList<>();
        }
        List<SysPermission> list = baseMapper.findByRoleIds(roleIds);
        if(null == list || list.size() < 0){
            return new ArrayList<>();
        }
        return SysPermissionConvert.Instance.sysPermissionsToSysPermissionDTOs(list);
    }

    /**
     * 根据权限id查询权限列表
     * @param ids 权限值
     * @return
     */
    public List<SysPermissionDTO> findByIds(Long... ids){
        List<SysPermission> list = baseMapper.selectBatchIds(Arrays.asList(ids));
        if(null == list || list.size() < 0){
            return new ArrayList<>();
        }
        return SysPermissionConvert.Instance.sysPermissionsToSysPermissionDTOs(list);
    }

    /**
     * 保存角色权限关联信息
     * @param roleId 角色id
     * @param permissionIds 权限id
     */
    @Override
    public void saveRolePermission(Long roleId, Long... permissionIds){
        if(null == roleId || null == permissionIds){
            return;
        }
        baseMapper.deletePermissionByRoleIds(roleId);
        if(permissionIds.length < 1){
            return;
        }
        List<Map> list = new ArrayList<>();
        for(Long permissionId : permissionIds){
            Map<String,Long> map = new HashMap<>();
            map.put("roleId",roleId);
            map.put("permissionId",permissionId);
            list.add(map);
        }
        baseMapper.insertRolePermission(list);
    }

    /**
     * 根据角色id删除权限与角色关联
     * @param roleIds 角色id
     */
    public void deletePermissionByRoleIds(Long... roleIds){
        baseMapper.deletePermissionByRoleIds(roleIds);
    }

    /**
     * 删除权限
     * @param ids 权限id 列表
     */
    public void delete(Long... ids){
        baseMapper.deletePermissionByIds(ids);
        baseMapper.deleteBatchIds(Arrays.asList(ids));
    }
}
