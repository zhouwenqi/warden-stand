package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.admin.domain.pojo.TokenUser;
import com.microwarp.warden.stand.admin.utils.TokenUtil;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.exception.WardenTokenErrorException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.HandlerExceptionResolver;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * filter - token 过滤器
 * @author zhouwenqi
 */
public class WardenAuthenticationTokenFilter extends OncePerRequestFilter {
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;

    @Autowired
    private HandlerExceptionResolver handlerExceptionResolver;

    @Autowired
    private SysUserDetailsService sysUserDetailsService;

    public WardenAuthenticationTokenFilter(){
        super();
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,FilterChain chain) throws ServletException, IOException {
        String token = request.getHeader(wardenGlobalConfig.getTokenKeyName());
        if(StringUtils.isNotBlank(token)){
            TokenUser tokenUser = TokenUtil.parse(token);
            if(null == tokenUser){
                handlerExceptionResolver.resolveException(request,response,null,new WardenTokenErrorException());
                return;
            }
            SecurityUser securityUser = sysUserDetailsService.loadUserByUsername(tokenUser.getUsername());
            request.setAttribute(AttrConstants.SECURITY_USER_KEY,securityUser);
        }
        chain.doFilter(request,response);
    }
}
