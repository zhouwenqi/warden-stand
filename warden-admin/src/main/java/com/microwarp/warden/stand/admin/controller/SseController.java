package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.service.SseService;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import javax.servlet.http.HttpServletRequest;

/**
 * controller - sse
 * @author zhouwenqi
 */
@Controller
@RequestMapping("/sse")
public class SseController {
    @Autowired
    private SseService sseService;

    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;
    @GetMapping("conn")
    public SseEmitter connection(HttpServletRequest request){
        String token = request.getHeader(wardenGlobalConfig.getTokenKeyName());
        return sseService.join(token);
    }
}
