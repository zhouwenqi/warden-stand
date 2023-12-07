package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.microwarp.warden.stand.common.utils.GoogleAuthUtil;
import com.microwarp.warden.stand.data.basic.BaseDaoImpl;
import com.microwarp.warden.stand.data.convert.SysUserConvert;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.data.mapper.SysUserMapper;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * dao - 系统用户 - impl
 * @author zhouwenqi
 */
@Repository
public class SysUserDaoImpl extends BaseDaoImpl<SysUserMapper,SysUser> implements SysUserDao {
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
        queryWrapper.last("limit 1");
        SysUser sysUser = baseMapper.selectOne(queryWrapper);
        return SysUserConvert.Instance.sysUserToSysUserDTO(sysUser);
    }

    /**
     * 查询所有有效系统用户
     * @return 系统用户列表
     */
    public List<SysUser> findAll(){
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("disabled",false);
        List<SysUser> list = baseMapper.selectList(queryWrapper);
        return null == list ? new ArrayList<>() : list;
    }

    /**
     * 刷新用户密钥
     * @param userId 用户id
     * @return 新的密钥
     */
    @Override
    public String refreshSecretKey(Long userId){
        if(null == userId){
            return null;
        }
        String key = GoogleAuthUtil.getSecretKey();
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("secret_key",key);
        long count = baseMapper.selectCount(queryWrapper);
        if(count > 0){
            refreshSecretKey(userId);
        }
        SysUser sysUser = new SysUser();
        sysUser.setId(userId);
        sysUser.setSecretKey(key);
        baseMapper.updateById(sysUser);
        return  key;
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
