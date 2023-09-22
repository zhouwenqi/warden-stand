package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.common.core.message.IMessage;
import com.microwarp.warden.stand.common.security.JwtUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

/**
 * service - sse
 * @author zhouwenqi
 */
@Service
public class SseService {
    @Autowired
    private TokenCacheService tokenCacheService;
    public static Map<String,SseEmitter> emitterMap = new ConcurrentHashMap<>();

    /**
     * 加入并返回emitter
     * @param token 用户token凭据
     * @return
     */
    public SseEmitter join(String token){
        SseEmitter sseEmitter = new SseEmitter(0L);
        sseEmitter.onCompletion(new Runnable() {
            @Override
            public void run() {
                System.out.print("completion...");
                emitterMap.remove(token);
            }
        });
        sseEmitter.onError(new Consumer<Throwable>() {
            @Override
            public void accept(Throwable throwable) {
                System.out.print("error...");
                emitterMap.remove(token);
            }
        });
        sseEmitter.onTimeout(new Runnable() {
            @Override
            public void run() {
                System.out.print("timeout...");
                emitterMap.remove(token);
            }
        });
        emitterMap.put(token,sseEmitter);
        return sseEmitter;
    }

    /**
     * 发送消息
     * @param iMessage 推送消息体
     * @param token 用户token
     */
    public void sendMessage(IMessage iMessage,String token){
        try{
            emitterMap.get(token).send(iMessage);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送消息
     * @param iMessage 推送消息体
     * @param jwtUser Jwt用户
     * @param exclude 排除指定token
     */
    public void sendMessage(IMessage iMessage, JwtUser jwtUser, String exclude){
        List<String> tokens = tokenCacheService.getTokens(jwtUser);
        for (String token:tokens) {
            if(StringUtils.isNotBlank(exclude) && exclude.equals(token)){
                continue;
            }
            sendMessage(iMessage,token);
        }
    }

    /**
     * 发送消息
     * @param iMessage 推送消息体
     * @param jwtUser Jwt用户
     */
    public void sendMessage(IMessage iMessage, JwtUser jwtUser){
        sendMessage(iMessage,jwtUser);
    }

    /**
     * 群发消息
     * @param iMessage 推送消息体
     * @param jwtUsers Jwt用户列表
     */
    public void sendMessage(IMessage iMessage,List<JwtUser> jwtUsers){
        for (JwtUser jwtUser:jwtUsers){
            sendMessage(iMessage,jwtUser);
        }
    }

    /**
     * 群发消息给所有在线token
     * @param iMessage 推送消息体
     */
    public void sendMessageByAll(IMessage iMessage){
        emitterMap.forEach((key,vlaue)->{
            try {
                vlaue.send(iMessage);
            }
            catch (Exception e){
                e.printStackTrace();
            }
        });
    }
}
