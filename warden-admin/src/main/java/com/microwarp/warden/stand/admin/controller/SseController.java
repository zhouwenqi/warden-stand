package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

/**
 * controller - sse
 */
@Controller
@RequestMapping("/sse")
public class SseController {
    public static Map<String,SseEmitter> sseEmitterMap = new ConcurrentHashMap<>();
    @GetMapping("conn")
    public SseEmitter connection(){
        SysUserDetailsDTO userDetailsDTO = SecurityUtil.getCurrentSysUser();
        SseEmitter sseEmitter = new SseEmitter(0L);
        sseEmitter.onCompletion(new Runnable() {
            @Override
            public void run() {
                System.out.print("completion...");
                sseEmitterMap.remove(userDetailsDTO.getId().toString());
            }
        });
        sseEmitter.onError(new Consumer<Throwable>() {
            @Override
            public void accept(Throwable throwable) {
                System.out.print("error...");
                sseEmitterMap.remove(userDetailsDTO.getId().toString());
            }
        });
        sseEmitter.onTimeout(new Runnable() {
            @Override
            public void run() {
                System.out.print("timeout...");
                sseEmitterMap.remove(userDetailsDTO.getId().toString());
            }
        });
        sseEmitterMap.put(userDetailsDTO.getId().toString(),sseEmitter);
        return sseEmitter;
    }
    @RequestMapping("send")
    @ResponseBody
    public ResultModel send(String msg) throws Exception{
        SysUserDetailsDTO userDetailsDTO = SecurityUtil.getCurrentSysUser();
        SseEmitter sseEmitter = sseEmitterMap.get(userDetailsDTO.getId().toString());
        for(int i=0;i<10;i++){
            Thread.sleep(2000);
            sseEmitter.send("tt-"+i+":"+msg);
        }
        return ResultModel.success();
    }
}
