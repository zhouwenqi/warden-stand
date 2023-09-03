package com.microwarp.warden.stand.admin.filter;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.utils.AesUtil;
import com.microwarp.warden.stand.common.utils.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * filter - guest
 * @author zhouwenqi
 */
public class GuestFilter implements Filter {
    private static final Logger logger = LoggerFactory.getLogger(GuestFilter.class);
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,FilterChain filterChain) throws IOException,ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String guestId = null;
        Object guestObject = request.getHeader(HttpConstants.HEADER_GUEST_KEY);
        if(null != guestObject){
            guestId = guestObject.toString();
        }else{
            logger.warn("前端没有传递Guest-Id");
        }
        if(StringUtils.isBlank(guestId)){
//            guestId = StringUtil.generateUUID();
//            logger.info("生成Guest-Id:{}",guestId);
        }
        try {
            // 校验一下GuestId
            AesUtil.hexDecrypt(guestId);
            request.setAttribute(HttpConstants.HEADER_GUEST_KEY, guestId);
            response.setHeader(HttpConstants.HEADER_GUEST_KEY, guestId);
        }
        catch (Exception e){
            logger.warn("无效的Guest-Id");
        }
        filterChain.doFilter(request,response);
    }
    @Override
    public void destroy(){

    }
}
