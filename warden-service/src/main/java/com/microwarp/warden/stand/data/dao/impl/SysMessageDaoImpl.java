package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.data.basic.BaseDaoImpl;
import com.microwarp.warden.stand.data.convert.SysMessageConvert;
import com.microwarp.warden.stand.data.dao.SysMessageDao;
import com.microwarp.warden.stand.data.entity.SysMessage;
import com.microwarp.warden.stand.data.mapper.SysMessageMapper;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import org.springframework.stereotype.Repository;

import java.util.Arrays;

/**
 * dao - 系统消息 - impl
 */
@Repository
public class SysMessageDaoImpl extends BaseDaoImpl<SysMessageMapper,SysMessage> implements SysMessageDao {

    /**
     * 查询一条系统消息
     * @param id 消息ID
     * @param jwtUser 接收用户
     * @return
     */
    public SysMessageDTO findById(Long id, JwtUser jwtUser){
        QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("to_id", Long.parseLong(jwtUser.getUserId()));
        queryWrapper.eq("to_platform", JwtUtil.convertToPlatform(jwtUser.getType()));
        queryWrapper.eq("id",id);
        queryWrapper.last("limit 1");
        SysMessage sysMessage = baseMapper.selectOne(queryWrapper);
        return null == sysMessage ? null : SysMessageConvert.Instance.sysMessageToSysMessageDTO(sysMessage);
    }
    /**
     * 设置消息阅读状态
     * @param id 消息ID
     * @param jwtUser 接收人
     * @param status 阅读状态
     */
    public void setReadStatus(Long[] id, JwtUser jwtUser, boolean status){
        if(null != jwtUser) {
            UpdateWrapper<SysMessage> updateWrapper = new UpdateWrapper<>();
            updateWrapper.set("reading", status);
            updateWrapper.eq("to_id", Long.parseLong(jwtUser.getUserId()));
            updateWrapper.eq("to_platform", JwtUtil.convertToPlatform(jwtUser.getType()));
            // id 为空将设置所有当前接收人消息
            if(null != id && id.length > 0) {
                updateWrapper.in("id", Arrays.asList(id));
            }
            baseMapper.update(null, updateWrapper);
        }
    }

    /**
     * 删除消息
     * @param id 消息ID
     * @param jwtUser 接收人
     */
    public void delete(Long[] id, JwtUser jwtUser){
        if(null != id && id.length > 0 && null != jwtUser) {
            QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("to_id", Long.parseLong(jwtUser.getUserId()));
            queryWrapper.eq("to_platform", JwtUtil.convertToPlatform(jwtUser.getType()));
            queryWrapper.in("id", Arrays.asList(id));
            baseMapper.delete(queryWrapper);
        }
    }
}
