package com.microwarp.warden.stand.facade.sysuser.service;

import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysuser.dto.*;

/**
 * service - 系统用户
 */
public interface SysUserService {
    /**
     * 查询用户基本信息
     * @param id  用户id
     * @return
     */
    SysUserDTO findById(Long id);

    /**
     * 查询用户基本信息
     * @param uid  用户名(帐号)
     * @return
     */
    SysUserDTO findByUid(String uid);

    /**
     * 查询用户详情
     * @param id 用户id
     * @return
     */
    SysUserDetailsDTO findDetailsById(Long id);
    /**
     * 查询用户详情
     * @param uid 用户名(帐号)
     * @return
     */
    SysUserDetailsDTO findDetailsByUid(String uid);

    /**
     * 插入系统用户
     * @param sysUserDTO 用户信息
     * @return 用户id
     */
    Long insert(SysUserDTO sysUserDTO);

    /**
     * 创建系统用户
     * @param sysUserRequestDTO 用户信息
     * @return
     */
     Long create(SysUserRequestDTO sysUserRequestDTO);

    /**
     * 更新用户信息
     * @param sysUserDTO 用户信息
     */
    void update(SysUserDTO sysUserDTO);

    /**
     * 更新用户密码
     * @param sysUserPasswordDTO 密码参数
     */
    void updatePassowrd(SysUserPasswordDTO sysUserPasswordDTO);

    /**
     * 分页查询用户列表信息
     * @param iSearchPageable 查询参数
     * @return
     */
    ResultPage<SysUserDTO> findPage(ISearchPageable<SysUserSearchDTO> iSearchPageable);

    /**
     * 删除系统用户
     * @param userId 用户id
     */
    void delete(Long userId);
}
