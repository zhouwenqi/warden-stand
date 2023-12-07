package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.microwarp.warden.stand.data.basic.BaseServiceImpl;
import com.microwarp.warden.stand.data.dao.SysUserBlipDao;
import com.microwarp.warden.stand.data.entity.SysUserBlip;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserBlipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service - 系统用户注记 - impl
 * @author zhouwenqi
 */
@Service
public class SysUserBlipServiceImpl extends BaseServiceImpl<SysUserBlip,SysUserBlipDao> implements SysUserBlipService {
    /**
     * 检查用户是否被标记波动
     * @param userId 用户id
     * @param ip ip地址
     * @return
     */
    public boolean isBlip(Long userId,String ip){
        QueryWrapper<SysUserBlip> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("ip",ip);
        return this.dao.count(queryWrapper) > 0;
    }

    /**
     * 添加一条用户波动标记
     * @param userId 用户id
     * @param ip ip地址
     */
    public void add(Long userId,String ip){
        SysUserBlip sysUserBlip = this.dao.find(userId,ip);
        if(null != sysUserBlip){
            return;
        }
        sysUserBlip = new SysUserBlip();
        sysUserBlip.setIp(ip);
        sysUserBlip.setUserId(userId);
        this.dao.save(sysUserBlip);
    }

    /**
     * 删除一条用户波动标记信息
     * @param userId 用户id
     * @param ip ip地址
     */
    public void delete(Long userId,String ip){
        QueryWrapper<SysUserBlip> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("ip",ip);
        this.dao.remove(queryWrapper);
    }

    /**
     * 清除用户波动标记信息
     * @param userId 用户id
     */
    public void clear(Long userId){
        QueryWrapper<SysUserBlip> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        this.dao.remove(queryWrapper);
    }
}
