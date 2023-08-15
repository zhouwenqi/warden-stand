package com.microwarp.warden.stand.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.microwarp.warden.stand.data.entity.SysPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * mapper - 系统权限
 * @author zhouwenqi
 */
public interface SysPermissionMapper extends BaseMapper<SysPermission> {
    List<SysPermission> findByClassifyId(@Param("classifyId") Long classifyId);
    /** 根据系统用户id查询权限 */
    List<SysPermission> findByUserId(@Param("userId") Long userId);
    /** 根据系统角色id查询权限 */
    List<SysPermission> findByRoleIds(Long[] ids);
    /** 根据权限id删除权限与角色关联 */
    void deletePermissionByIds(Long... roleIds);
    /** 根据角色id删除权限与角色关联 */
    void deletePermissionByRoleIds(Long... roleIds);
    /** 插入权限与角色关联 */
    void insertRolePermission(List<Map> list);
}
