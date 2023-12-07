package com.microwarp.warden.stand.data.dao.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.dao.SysUserBlipDao;
import com.microwarp.warden.stand.data.entity.SysUserBlip;
import com.microwarp.warden.stand.data.mapper.SysUserBlipMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

/**
 * dao - 系统用户标记 - impl
 * @author zhouwenqi
 */
@Repository
public class SysUserBlipDaoImpl extends ServiceImpl<SysUserBlipMapper,SysUserBlip> implements SysUserBlipDao{
    /**
     * 查询一条用户标记信息
     * @param userId 用户id
     * @param ip ip地址
     * @return
     */
    public SysUserBlip find(Long userId,String ip){
        if(null == userId || StringUtils.isBlank(ip)){
            return null;
        }
        QueryWrapper<SysUserBlip> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("ip",ip);
        queryWrapper.last("limit 1");
        return baseMapper.selectOne(queryWrapper);
    }
}
