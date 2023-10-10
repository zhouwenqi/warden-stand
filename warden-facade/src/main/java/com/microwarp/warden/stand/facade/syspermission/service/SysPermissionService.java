package com.microwarp.warden.stand.facade.syspermission.service;

import com.microwarp.warden.stand.common.core.pageing.BaseSortDTO;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionTreeDTO;

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
     * 查询权限信息(含子级权限列表)
     * @param id 权限ID
     * @return 权限信息
     */
    SysPermissionTreeDTO findChildrenById(Long id);

    /**
     * 递归获取所有权限ID
     * @param ids 下级权限ID列表
     * @param permissionIds 权限ID平铺列表
     * @return
     */
    void recursionIds(List<Long> ids,List<Long> permissionIds);

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
     * 权限拖拽排序
     * @param baseSortDTO 排序参数
     */
    void dragAndSort(BaseSortDTO baseSortDTO);

    /**
     * 删除权限信息
     * @param id 权限id
     */
    void delete(Long... id);

    /**
     * 获取所有权限树
     * @return 权限树
     */
    List<SysPermissionTreeDTO> findTrees();
    /**
     * 分页查询权限信息
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysPermissionDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable);
}
