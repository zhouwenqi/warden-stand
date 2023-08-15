package com.microwarp.warden.stand.common.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Web - util
 * @author zhouwenqi
 */
public class WebUtil {
    /**
     * 获取客户端IP地址
     * @param request 请求上下文
     * @return
     */
    public static String getIpAddr(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if(StringUtils.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)){
            if(ip.contains(",")){
                ip = ip.split(",")[0];
            }
        }
        String[] forwardeds = new String[]{"Proxy-Client-IP","WL-Proxy-Client-IP","HTTP_CLIENT_IP","HTTP_X_FORWARDED_FOR","X-Real-IP"};
        for(String k:forwardeds){
            ip = request.getHeader(k);
            if(StringUtils.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)){
                return ip;
            }
        }
        if(StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)){
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获取当前客户端IP地址
     * @return
     */
    public static String getIpAddr(){
        return getIpAddr(getRequest());
    }

    /**
     * 获取客户端IP地址
     * 如果是本机ip再获取局域网ip
     * @return ip地址
     */
    public static String getLocalAnyIpAddr(){
        String ip = getIpAddr();
        if(StringUtils.isNotBlank(ip) && ("localhost".equalsIgnoreCase(ip) || "127.0.0.1".equalsIgnoreCase(ip) || "0:0:0:0:0:0:0:1".equalsIgnoreCase(ip))){
            try {
                InetAddress inetAddress = InetAddress.getLocalHost();
                ip = inetAddress.getHostAddress();
            }catch (UnknownHostException e){
                e.printStackTrace();
            }
        }
        return ip;
    }

    public static HttpServletRequest getRequest(){
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        return ((ServletRequestAttributes) requestAttributes).getRequest();
    }
}
