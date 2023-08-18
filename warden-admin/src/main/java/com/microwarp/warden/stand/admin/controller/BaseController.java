package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.authentication.SecurityUser;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.utils.WebUtil;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * controller - base
 * @author zhouwenqi
 */
public class BaseController {
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
    public SecurityUser getSecruityUser(){
        HttpServletRequest request = WebUtil.getRequest();
        return (SecurityUser)request.getAttribute(AttrConstants.SECURITY_USER_KEY);
    }
}
