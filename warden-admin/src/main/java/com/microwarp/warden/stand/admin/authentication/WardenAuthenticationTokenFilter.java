package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.admin.domain.pojo.TokenUser;
import com.microwarp.warden.stand.admin.service.TokenCacheService;
import com.microwarp.warden.stand.admin.utils.SpringUtil;
import com.microwarp.warden.stand.admin.utils.TokenUtil;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.exception.WardenTokenErrorException;
import com.microwarp.warden.stand.common.security.UserType;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserBlipService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
 * filter - token 过滤器
 * @author zhouwenqi
 */
public class WardenAuthenticationTokenFilter extends OncePerRequestFilter {
    private static final Logger logger = LoggerFactory.getLogger(WardenAuthenticationTokenFilter.class);
    @Resource
    private WardenGlobalConfig wardenGlobalConfig;

    @Resource
    private HandlerExceptionResolver handlerExceptionResolver;

    @Resource
    private SysConfigService sysConfigService;

    @Resource
    private SysUserDetailsService sysUserDetailsService;

    @Resource
    private TokenCacheService tokenCacheService;


    public WardenAuthenticationTokenFilter(){
        super();
        this.wardenGlobalConfig = SpringUtil.getBean(WardenGlobalConfig.class);
        this.handlerExceptionResolver = SpringUtil.getBean(HandlerExceptionResolverComposite.class);
        this.sysConfigService = SpringUtil.getBean(SysConfigService.class);
        this.sysUserDetailsService = SpringUtil.getBean(SysUserDetailsService.class);
        this.tokenCacheService = SpringUtil.getBean(TokenCacheService.class);

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

            // 判断token是否是后台系统用户类型
            if(!tokenUser.getType().equals(UserType.SYSTEM)){
                logger.error("非后台系统token:{}",token);
                handlerExceptionResolver.resolveException(request,response,null,new WardenTokenErrorException());
            }

            // 判断是否只允许保持一个token会话
            if(!sysConfigService.findCurrent().getAllowManyToken() && !tokenCacheService.contains(token)){
                logger.error("未登录的token:{}",token);
                handlerExceptionResolver.resolveException(request,response,null,new WardenTokenErrorException());
            }

            SecurityUser securityUser = sysUserDetailsService.loadUserByUsername(tokenUser.getUsername());
            if(null == securityUser){
                handlerExceptionResolver.resolveException(request,response,null,new WardenTokenErrorException());
                return;
            }
            request.setAttribute(AttrConstants.SECURITY_USER_KEY, securityUser);
            request.setAttribute(AttrConstants.JWT_USER_KEY, tokenUser);
        }
        chain.doFilter(request,response);
    }
}
