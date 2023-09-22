package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.authentication.SecurityUser;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * controller - base
 * @author zhouwenqi
 */
public class BaseController {
    @Autowired
    private LogService logService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
    public SecurityUser getSecruityUser(){
        HttpServletRequest request = WebUtil.getRequest();
        return (SecurityUser)request.getAttribute(AttrConstants.SECURITY_USER_KEY);
    }
    public JwtUser getJwtUser(){
        HttpServletRequest request = WebUtil.getRequest();
        return (JwtUser) request.getAttribute(AttrConstants.JWT_USER_KEY);
    }
    public void writeLog(String logContent,ActionTypeEnum actionType, ModuleTypeEnum moduleType, Long... mateId){
        String ip = WebUtil.getIpAddr();
        SysUserDetailsDTO sysUserDetailsDTO = SecurityUtil.getCurrentSysUser();
        logService.syncBackstageWrite(sysUserDetailsDTO,logContent,ip,actionType,moduleType,mateId);
    }
}
