package com.microwarp.warden.stand.data.service;

import com.microwarp.warden.stand.data.dao.SysUserLockDao;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserLockDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserLockService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * service - 系统用户锁 - impl
 * @author zhouwenqi
 */
@Service
public class SysUserLockServiceImpl implements SysUserLockService {
    @Resource
    private SysUserLockDao sysUserLockDao;

    /**
     * 判断用户是否被锁定
     * @param userId 用户id
     * @return
     */
    public boolean isLocked(Long userId){
        return sysUserLockDao.isLocked(userId);
    }
    /**
     * 添加一条锁记录
     * @param userId 用户id
     * @param ip IP地址
     * @param unlockTime 解锁时间(时间为空永久锁住)
     */
    public void add(Long userId, String ip, Date unlockTime){
        sysUserLockDao.lock(userId,ip,unlockTime);
    }

}
