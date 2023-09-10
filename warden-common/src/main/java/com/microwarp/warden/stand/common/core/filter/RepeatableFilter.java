package com.microwarp.warden.stand.common.core.filter;

import com.microwarp.warden.stand.common.core.handler.RepeatedRequestWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * filter - 重复提交Wrapper构建
 * @author zhouwenqi
 */
public class RepeatableFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        ServletRequest requestWrapper = null;
        if(request instanceof HttpServletRequest && StringUtils.startsWithIgnoreCase(request.getContentType(), MediaType.APPLICATION_JSON_VALUE)){
            requestWrapper = new RepeatedRequestWrapper((HttpServletRequest)request,response);
        }
        if(null == requestWrapper){
            filterChain.doFilter(request,response);
        }else{
            filterChain.doFilter(requestWrapper,response);
        }
    }
}
