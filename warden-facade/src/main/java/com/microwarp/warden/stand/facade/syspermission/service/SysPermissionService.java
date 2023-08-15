package com.microwarp.warden.stand.facade.syspermission.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionSearchDTO;

import java.util.List;

/**
 * service - 系统权限
 * @author zhouwenqi
 */
public interface SysPermissionService {
    /**
     * 查询所有权限
     * @return
     */
    List<SysPermissionDTO> findAll();
    /**
     * 保存角色权限关联信息
     * @param roleId 角色id
     * @param permessionIds 权限id
     */
    void saveRolePermission(Long roleId,Long... permessionIds);

    /**
     * 根据权限id查询权限列表
     * @param ids 权限值
     * @return
     */
    List<SysPermissionDTO> findByIds(Long... ids);

    /**
     * 查询权限信息
     * @param id 权限id
     * @return 权限信息
     */
    SysPermissionDTO findById(Long id);

    /**
     * 创建权限
     * @param sysPermissionDTO 权限内容
     * @return 权限信息
     */
    SysPermissionDTO create(SysPermissionDTO sysPermissionDTO);
    /**
     * 更新权限信息
     * @param sysPermissionDTO 权限信息
     */
    void update(SysPermissionDTO sysPermissionDTO);

    /**
     * 删除权限信息
     * @param id 权限id
     */
    void delete(Long... id);

    /**
     * 分页查询权限信息
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysPermissionDTO> findPage(ISearchPageable<SysPermissionSearchDTO> iSearchPageable);
}
