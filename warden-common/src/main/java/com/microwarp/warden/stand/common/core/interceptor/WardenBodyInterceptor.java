package com.microwarp.warden.stand.common.core.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2023/7/6.
 */
public class WardenBodyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        int status = response.getStatus();
        System.out.println("pre - status:"+status);

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("path:"+request.getRequestURI());
        response.setStatus(990);
        int status = response.getStatus();
        System.out.println("post-status:"+status);

    }
}
