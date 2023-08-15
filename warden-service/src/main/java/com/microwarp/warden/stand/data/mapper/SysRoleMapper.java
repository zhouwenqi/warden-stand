package com.microwarp.warden.stand.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.microwarp.warden.stand.data.entity.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * mapper - 系统角色
 * @author zhouwenqi
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {
    /**
     * 查询用户角色信息
     * @param userId 用户id
     * @return
     */
    List<SysRole> findByUserId(@Param("userId") Long userId);
    /**
     * 删除用户角色关系
     * @param userId 用户id
     */
    void deleteRoleByUserId(@Param("userId") Long userId);

    /**
     * 删除角色关联信息
     * @param ids
     */
    void deleteRoleByIds(Long[] ids);

    /**
     * 插入用户角色信息
     * @param list 角色用户信息
     */
    void insertRoleUser(List<Map> list);

}
