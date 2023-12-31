package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.admin.utils.SpringUtil;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.exception.WardenAccountFailedException;
import com.microwarp.warden.stand.common.exception.WardenRequireAgainVerifyException;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserBlipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.handler.HandlerExceptionResolverComposite;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * filter - 解析(token)后的用户过淲器
 * @author zhouwenqi
 */
public class WardenAuthenticationUserFilter extends OncePerRequestFilter {
    @Resource
    private HandlerExceptionResolver handlerExceptionResolver;

    public WardenAuthenticationUserFilter(){
        super();
        this.handlerExceptionResolver = SpringUtil.getBean(HandlerExceptionResolverComposite.class);
    }
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,FilterChain chain) throws RuntimeException, ServletException, IOException{
        SecurityUser securityUser = (SecurityUser)request.getAttribute(AttrConstants.SECURITY_USER_KEY);
        if(null != securityUser){

            // 判断用户是否被锁住
            if(!securityUser.isAccountNonLocked()){
                handlerExceptionResolver.resolveException(request,response,null,new WardenAccountFailedException("帐号已被锁住"));
                return;
            }

            // 判断用户是否被禁用
            if(!securityUser.isEnabled()){
                handlerExceptionResolver.resolveException(request,response,null,new WardenAccountFailedException("帐号已被禁用"));
                return;
            }
            WardenAuthentication wardenAuthentication = new WardenAuthentication(securityUser.getSysUser(),securityUser.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(wardenAuthentication);
        }
        chain.doFilter(request,response);
    }
}
