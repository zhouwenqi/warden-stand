package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.common.exception.WardenException;
import com.microwarp.warden.stand.data.convert.SysUserConvert;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.data.mapper.SysUserMapper;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

/**
 * dao - 系统用户 - impl
 * @author zhouwenqi
 */
@Repository
public class SysUserDaoImpl extends ServiceImpl<SysUserMapper,SysUser> implements SysUserDao {
    /**
     * 查询系统用户基本信息
     * @param id 用户id
     * @return
     */
    public SysUserDTO findById(Long id){
        SysUser sysUser = this.baseMapper.selectById(id);
        return SysUserConvert.Instance.sysUserToSysUserDTO(sysUser);
    }

    /**
     * 查询系统用户基本信息
     * @param uid 用户名(帐号)
     * @return
     */
    public SysUserDTO findByUid(String uid){
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uid",uid);
        SysUser sysUser = baseMapper.selectOne(queryWrapper);
        return SysUserConvert.Instance.sysUserToSysUserDTO(sysUser);
    }

    /**
     * 清除用户岗位id
     * @param id 岗位id
     */
    public void clearPostId(Long... id){
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("post_id",null);
        updateWrapper.in("post_id", Arrays.asList(id));
        baseMapper.update(null,updateWrapper);
    }

    /**
     * 清除用户部门id
     * @param id 部门id
     */
    public void clearDeptId(Long... id){
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("dept_id",null);
        updateWrapper.in("dept_id", Arrays.asList(id));
        baseMapper.update(null,updateWrapper);
    }
}
