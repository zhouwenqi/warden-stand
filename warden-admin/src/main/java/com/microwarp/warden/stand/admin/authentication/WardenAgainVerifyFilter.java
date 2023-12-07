package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.admin.utils.SpringUtil;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.core.enums.AgainVerifyTypeEnum;
import com.microwarp.warden.stand.common.exception.WardenRequireAgainVerifyException;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserBlipService;
import org.springframework.util.AntPathMatcher;
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
 * filter - 二次验证过滤器
 * @author zhouwenqi
 */
public class WardenAgainVerifyFilter extends OncePerRequestFilter {
    @Resource
    private HandlerExceptionResolver handlerExceptionResolver;

    @Resource
    private SysUserBlipService sysUserBlipService;

    @Resource
    private SysConfigService sysConfigService;

    public WardenAgainVerifyFilter(){
        super();
        this.handlerExceptionResolver = SpringUtil.getBean(HandlerExceptionResolverComposite.class);
        this.sysUserBlipService = SpringUtil.getBean(SysUserBlipService.class);
        this.sysConfigService = SpringUtil.getBean(SysConfigService.class);
    }
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws RuntimeException, ServletException, IOException{
        SecurityUser securityUser = (SecurityUser)request.getAttribute(AttrConstants.SECURITY_USER_KEY);
        String ip = WebUtil.getIpAddr(request);
        String uri = request.getRequestURI();
        AntPathMatcher antPathMatcher = new AntPathMatcher();
        if(null != securityUser && !antPathMatcher.match("/googleauth/*",uri)){
            // 判断是否需要二次验证
            SysConfigDTO sysConfigDTO = sysConfigService.findCurrent();
            AgainVerifyTypeEnum againVerifyType = sysConfigDTO.getAgainVerify();
            if(null != againVerifyType && !againVerifyType.equals(AgainVerifyTypeEnum.NONE)){
                if(sysUserBlipService.isBlip(securityUser.getSysUser().getId(),ip)){
                    handlerExceptionResolver.resolveException(request,response,null,new WardenRequireAgainVerifyException("需要二次验证"));
                    return;
                }
            }
        }
        chain.doFilter(request,response);
    }
}
