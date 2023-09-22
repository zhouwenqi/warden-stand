package com.microwarp.warden.stand.data.dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;

import java.util.List;

/**
 * dao - 系统用户
 * @author zhouwenqi
 */
public interface SysUserDao extends IService<SysUser> {
    /**
     * 查询系统用户基本信息
     * @param userId 用户id
     * @return
     */
    SysUserDTO findById(Long userId);
    /**
     * 查询系统用户基本信息
     * @param uid 用户名(帐号)
     * @return
     */
    SysUserDTO findByUid(String uid);

    /**
     * 查询所有有效系统用户
     * @return 系统用户列表
     */
    List<SysUser> findAll();

    /**
     * 清除用户岗位id
     * @param id 岗位id
     */
    void clearPostId(Long... id);

    /**
     * 清除用户部门id
     * @param id 部门id
     */
    public void clearDeptId(Long... id);
}
