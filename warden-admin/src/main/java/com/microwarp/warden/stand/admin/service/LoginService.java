package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.domain.pojo.LoginFailed;
import com.microwarp.warden.stand.admin.utils.AddressUtil;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.core.enums.ActionStatusEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserLockService;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * service -  登录
 * @author zhouwenqi.
 */
@Component
public class LoginService {
    private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
    @Autowired
    private SysUserLockService sysUserLockService;
    @Autowired
    private SysLoginLogService sysLoginLogService;

    public static Map<String,LoginFailed> loginFailedMap = new HashMap<>();

    public LoginFailed getLoginFailed(Long userId,String ip){
        String key = userId+":"+ip;
        LoginFailed loginFailed = loginFailedMap.get(key);
        if(null == loginFailed){
            loginFailed = new LoginFailed();
            loginFailedMap.put(key, new LoginFailed());
        }
        resolve(loginFailed);
        return loginFailed;
    }

    private LoginFailed resolve(LoginFailed loginFailed){
        if(!DateUtils.isSameDay(loginFailed.getFailedTime(),new Date())){
            loginFailed = new LoginFailed();
        }
        return loginFailed;
    }

    public void failed(Long userId,String ip){
        LoginFailed loginFailed = getLoginFailed(userId,ip);
        loginFailed.setCount(loginFailed.getCount() + 1);
        loginFailed.setFailedTime(new Date());
    }

    public void success(Long userId,String ip){
        String key = userId+":"+ip;
        loginFailedMap.remove(key);
    }

    public void lock(Long userId,String ip){
        sysUserLockService.add(userId,ip,DateUtils.addMinutes(new Date(), SecurityConstants.LOGIN_LOCK_TIME));
        String key = userId+":"+ip;
        loginFailedMap.remove(key);
    }

    /**
     * 写入登录日志
     * @param sysLoginLogDTO 日志信息
     */
    public void writeLog(SysLoginLogDTO sysLoginLogDTO){
        sysLoginLogService.add(sysLoginLogDTO);
    }

    /**
     * 写入登录日志(同步)
     * @param user 登录用户
     * @param logContent 日志内容
     * @param status 状态
     * @param ip IP地址
     * @param appTerminalType 应用类型
     * @param platformType 平台类型
     */
    public void writeLog(SysUserDetailsDTO user,String logContent, ActionStatusEnum status, String ip, AppTerminalEnum appTerminalType, PlatformTypeEnum platformType){
        if(null != user) {
            try {
                SysLoginLogDTO sysLoginLogDTO = new SysLoginLogDTO();
                String location = AddressUtil.getLocation(ip);
                sysLoginLogDTO.setUserId(user.getId());
                sysLoginLogDTO.setUid(user.getUid());
                sysLoginLogDTO.setAppTerminalType(appTerminalType);
                sysLoginLogDTO.setPlatformType(platformType);
                sysLoginLogDTO.setStatus(status);
                sysLoginLogDTO.setContent(logContent);
                sysLoginLogDTO.setLocation(location);
                sysLoginLogDTO.setIp(ip);
                writeLog(sysLoginLogDTO);
            }
            catch (Exception e){
                logger.warn("写入登录日志失败:{}",e.getMessage());
            }
        }
    }

    /**
     * 写入登录日志(异步)
     * @param user 登录用户
     * @param logContent 日志内容
     * @param status 状态
     * @param ip IP地址
     * @param appTerminalType 应用类型
     * @param platformType 平台类型
     */
    @Async("taskExecutor")
    public void asyncWriteLog(SysUserDetailsDTO user,String logContent, ActionStatusEnum status, String ip, AppTerminalEnum appTerminalType, PlatformTypeEnum platformType){
        writeLog(user,logContent,status,ip,appTerminalType,platformType);
    }
}
