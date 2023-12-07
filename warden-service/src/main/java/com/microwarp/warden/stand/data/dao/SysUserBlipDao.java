package com.microwarp.warden.stand.data.dao;

import com.microwarp.warden.stand.data.basic.BaseDao;
import com.microwarp.warden.stand.data.entity.SysUserBlip;

/**
 * dao - 系统用户标记
 * @author zhouwenqi
 */
public interface SysUserBlipDao extends BaseDao<SysUserBlip> {
    /**
     * 查询一条用户标记信息
     * @param userId 用户id
     * @param ip ip地址
     * @return
     */
    SysUserBlip find(Long userId,String ip);
}
