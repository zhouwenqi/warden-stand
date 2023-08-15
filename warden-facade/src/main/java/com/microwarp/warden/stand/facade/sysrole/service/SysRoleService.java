package com.microwarp.warden.stand.facade.sysrole.service;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;

import java.util.Set;

/**
 * service - 系统角色
 */
public interface SysRoleService {
    /**
     * 查询系统角色信息
     * @param id 角色id
     * @return 角色信息
     */
    SysRoleDTO findById(Long id);

    /**
     * 查询角色列表
     * @param ids 角色id
     * @return
     */
    Set<SysRoleDTO> findByIds(Long...ids);

    /**
     * 查询系统角色详情
     * @param id 角色id
     * @return 角色详情
     */
    SysRoleDetailsDTO findDetailsById(Long id);
    /**
     * 创建角色信息
     * @param sysRoleDTO 角色信息
     * @return
     */
     SysRoleDTO create(SysRoleDTO sysRoleDTO);

    /**
     * 更新角色信息
     * @param sysRoleDTO 角色信息
     */
    void update(SysRoleDTO sysRoleDTO);

    /**
     * 删除角色信息
     * @param id
     */
    void delete(Long... id);
    /**
     * 设置系统用户角色信息
     * @param userId 用户id
     * @param roleIds 角色id
     */
    void saveUserRoles(Long userId, Long... roleIds);
    /**
     * 查询角色列表
     * @param values 角色值
     * @return
     */
    Set<SysRoleDTO> findByValues(String... values);

    /**
     * 分页查询角色列表
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysRoleDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable);
}
