package com.microwarp.warden.stand.common.utils;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;

/**
 * Web - util
 * @author zhouwenqi
 */
public class WebUtil {
    private static final Logger logger = LoggerFactory.getLogger(WebUtil.class);
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
        String[] forwardeds = new String[]{"Proxy-Client-IP","X-Forwarded-For","WL-Proxy-Client-IP","HTTP_CLIENT_IP","HTTP_X_FORWARDED_FOR","X-Real-IP"};
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

    public static HttpServletResponse getResponse(){
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        return ((ServletRequestAttributes) requestAttributes).getResponse();
    }

    /**
     * 获取当前请求应用类型
     * @return
     */
    public static AppTerminalEnum getAppTerminalType(){
        AppTerminalEnum appTerminalEnum = AppTerminalEnum.UNKNOWN;
        Object header = getRequest().getHeader(HttpConstants.HEADER_APP_TERMINAL);
        if(null != header){
            try{
                appTerminalEnum = AppTerminalEnum.valueOf(header.toString());
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return appTerminalEnum;
    }

    /**
     * 获取当前guestId
     * @return
     */
    public static String getGuestId(){
        HttpServletRequest request = getRequest();
        Object guestObject = request.getAttribute(HttpConstants.HEADER_GUEST_KEY);
        return null == guestObject ? null : guestObject.toString();
    }

    public static String getBody(HttpServletRequest request){
        StringBuilder stringBuilder = new StringBuilder();
        try{
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine())!= null){
                stringBuilder.append(line);
            }
            reader.close();
        }catch (IOException e){
            logger.warn("获取request-body失败:{}",e.getMessage());
        }
        return stringBuilder.toString();
    }
}
