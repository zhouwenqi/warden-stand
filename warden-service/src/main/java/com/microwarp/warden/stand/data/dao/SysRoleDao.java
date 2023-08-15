package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;

import java.util.Set;

/**
 * dao - 系统角色
 * @author zhouwenqi
 */
public interface SysRoleDao extends IService<SysRole> {
    /**
     * 查询用户角色列表
     * @param id 用户id
     * @return
     */
    Set<SysRoleDTO> findByUserId(Long id);
    /**
     * 查询角色列表
     * @param ids 角色id
     * @return
     */
    Set<SysRoleDTO> findByIds(Long...ids);
    /**
     * 查询角色列表
     * @param values 角色值
     * @return
     */
    Set<SysRoleDTO> findByValues(String...values);

    /**
     * 删除用户角色关联信息
     * @param userId 用户id
     */
    void deleteRoleByUserId(Long userId);

    /**
     * 删除角色信息
     * @param ids 角色id
     */
    void deleteByIds(Long[] ids);

    /**
     * 保存用户角色关系信息
     * @param userId 用户id
     * @param roleIds 角色id列表
     */
    void saveUserRoles(Long userId,Long... roleIds);
}
