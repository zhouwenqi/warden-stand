package com.microwarp.warden.stand.common.core.interceptor;

import com.microwarp.warden.stand.common.core.annotation.RepeatRequestCheck;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import com.microwarp.warden.stand.common.core.cache.RepeatData;
import com.microwarp.warden.stand.common.core.constant.AttrConstants;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.core.handler.RepeatedRequestWrapper;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.JsonUtil;
import com.microwarp.warden.stand.common.utils.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * interceptor - 数据重复提交拦截器
 * @author zhouwenqi
 */
public class RepeatedRequestInterceptor implements HandlerInterceptor {
    @Resource
    private ICacheService iCacheService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if(handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod)handler;
            Method method = handlerMethod.getMethod();
            RepeatRequestCheck repeatRequestCheck = method.getAnnotation(RepeatRequestCheck.class);
            if(null != repeatRequestCheck) {
                if (repeatSubmit(request, repeatRequestCheck)) {
                    throw new WardenParamterErrorException("不能重复提交数据");
                }
            }
            return true;
        }else {
            return true;
        }
    }
    private boolean repeatSubmit(HttpServletRequest request, RepeatRequestCheck repeatRequestCheck){
        String params = "";
        if(request instanceof RepeatedRequestWrapper){
            RepeatedRequestWrapper repeatedRequestWrapper = (RepeatedRequestWrapper)request;
            params = WebUtil.getBody(repeatedRequestWrapper);
        }
        if(StringUtils.isEmpty(params)){
            params = JsonUtil.objectToJson(request.getParameterMap());
        }
        RepeatData repeatData = new RepeatData();
        repeatData.setData(params);
        repeatData.setTime(System.currentTimeMillis());
        String url = request.getRequestURI();
        String cacheKey = request.getMethod()+":"+url;
        if(repeatRequestCheck.userSeparate()) {
            JwtUser jwtUser = (JwtUser) request.getAttribute(AttrConstants.JWT_USER_KEY);
            cacheKey = request.getMethod()+":"+jwtUser.getUserId()+"@"+jwtUser.getType()+":"+url;
        }
        RepeatData cacheData = iCacheService.get(CacheConstants.CACHE_REPEAT, cacheKey);
        if(null != cacheData){
            if(compareParams(repeatData,cacheData) && compareTimes(repeatData,cacheData, repeatRequestCheck.interval())){
                return true;
            }
        }
        iCacheService.save(CacheConstants.CACHE_REPEAT, cacheKey, repeatData);
        return false;
    }

    private boolean compareParams(RepeatData data, RepeatData firstData){
        return data.getData().equals(firstData.getData());
    }

    private boolean compareTimes(RepeatData data, RepeatData firstData,int interval){
        return data.getTime() - firstData.getTime() < interval;
    }
}
