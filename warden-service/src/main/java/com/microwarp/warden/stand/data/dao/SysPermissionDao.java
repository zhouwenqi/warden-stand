package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysPermission;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;

import java.util.List;

/**
 * dao - 系统权限
 */
public interface SysPermissionDao extends IService<SysPermission> {
    /**
     * 根据角色id数组查询权限列表
     * @param roleIds 角色id数组
     * @return
     */
    List<SysPermissionDTO> findByRoleIds(Long ...roleIds);

    /**
     * 根据权限id查询权限列表
     * @param ids 权限值
     * @return
     */
    List<SysPermissionDTO> findByIds(Long... ids);

    /**
     * 保存角色权限关联信息
     * @param roleId 角色id
     * @param permissionIds 权限id
     */
    void saveRolePermission(Long roleId, Long... permissionIds);

    /**
     * 设置权限分类字段为null
     * @param classifyId 权限分类id
     */
    void clearClassifyId(Long classifyId);
    /**
     * 根据角色id删除权限与角色关联
     * @param roleIds 角色id
     */
    void deletePermissionByRoleIds(Long... roleIds);

    /**
     * 删除权限
     * @param ids 权限id 列表
     */
    void delete(Long... ids);
}
