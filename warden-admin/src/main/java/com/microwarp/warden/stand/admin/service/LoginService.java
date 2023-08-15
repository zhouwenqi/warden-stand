package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.domain.pojo.LoginFailed;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserLockService;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private SysUserLockService sysUserLockService;

    public static Map<Long,LoginFailed> loginFailedMap = new HashMap<>();

    public LoginFailed getLoginFailed(Long userId){
        LoginFailed loginFailed = loginFailedMap.get(userId);
        if(null == loginFailed){
            loginFailed = new LoginFailed();
            loginFailedMap.put(userId, new LoginFailed());
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

    public void failed(Long userId){
        LoginFailed loginFailed = getLoginFailed(userId);
        loginFailed.setCount(loginFailed.getCount() + 1);
        loginFailed.setFailedTime(new Date());
    }

    public void success(Long userId){
        loginFailedMap.remove(userId);
    }

    public void lock(Long userId){
        String ip = WebUtil.getIpAddr();
        sysUserLockService.add(userId,ip,DateUtils.addMinutes(new Date(),5));
        loginFailedMap.remove(userId);
    }

}
