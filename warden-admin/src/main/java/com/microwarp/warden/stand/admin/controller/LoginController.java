package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.pojo.SseMessage;
import com.microwarp.warden.stand.admin.domain.pojo.TokenUser;
import com.microwarp.warden.stand.admin.domain.vo.SysUserLoginRequest;
import com.microwarp.warden.stand.admin.service.CaptchaService;
import com.microwarp.warden.stand.admin.service.LoginService;
import com.microwarp.warden.stand.admin.service.SseService;
import com.microwarp.warden.stand.admin.service.TokenCacheService;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.admin.utils.TokenUtil;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.core.enums.*;
import com.microwarp.warden.stand.common.exception.WardenAccountFailedException;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.security.UserType;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserLockService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * controller - 登录
 * @author zhouwenqi
 */
@RestController
public class LoginController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private SysUserLockService sysUserLockService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private CaptchaService captchaService;
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private TokenCacheService tokenCacheService;
    @Autowired
    private SseService sseService;

    /**
     * 登录
     * @param loginRequest 登录参数
     * @return
     */
    @PostMapping("/login")
    public ResultModel login(@RequestBody @Validated SysUserLoginRequest loginRequest){
        ResultModel resultModel = ResultModel.success();
        String ip = WebUtil.getIpAddr();
        // IP锁定次数检查
        if(sysUserLockService.totalByIp(ip) > SecurityConstants.IP_LOCK_LIMIT){
            throw new WardenParamterErrorException("当前IP暂时禁止登录");
        }

        // 图形验证码校验
        if(wardenGlobalConfig.getEnableCaptcha()){
            if(StringUtils.isBlank(loginRequest.getCaptchaCode())){
                throw new WardenParamterErrorException("请输入验证码");
            }
            // 验证码类型检查
            switch (wardenGlobalConfig.getCaptchaType()){
                case KAPTCHA_IMAGE:
                    if(!captchaService.verify(loginRequest.getCaptchaCode())){
                        throw new WardenParamterErrorException("验证码错误");
                    }
                    break;
            }
        }

        // 查询用户信息
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsByUid(loginRequest.getUid());
        if(null == sysUserDetailsDTO){
            // 实际只是帐号不存在
            throw new WardenParamterErrorException("帐号或密码错误");
        }

        // 判断用户是否锁住
        if(sysUserLockService.isLocked(sysUserDetailsDTO.getId(),ip)){
            // 写入日志
            loginService.asyncWriteLog(sysUserDetailsDTO,"登录失败:用户已被锁住", ActionStatusEnum.FAILED, ip, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE);
            throw new WardenParamterErrorException("用户已被锁住");
        }

        // 校验登录密码
        if(!bCryptPasswordEncoder.matches(loginRequest.getPwd(),sysUserDetailsDTO.getPwd())){
            int failedCount = loginService.getLoginFailed(sysUserDetailsDTO.getId(),ip).getCount();
            // 失败 5 次锁住
            if(failedCount >= SecurityConstants.LOGIN_COUNT_LIMIT){
                loginService.lock(sysUserDetailsDTO.getId(), ip);
                // 写入日志
                loginService.asyncWriteLog(sysUserDetailsDTO,"登录失败:失败次败超限被锁住", ActionStatusEnum.FAILED, ip, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE);
                throw new WardenParamterErrorException("用户已被锁住");
            }else{
                loginService.failed(sysUserDetailsDTO.getId(),ip);
            }
            // 写入日志
            loginService.asyncWriteLog(sysUserDetailsDTO,"登录失败:密码错误", ActionStatusEnum.FAILED, ip, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE);
            throw new WardenParamterErrorException("帐号或密码错误");
        }

        // 检查系统用户状态
        if(sysUserDetailsDTO.getDisabled()){
            // 写入日志
            loginService.asyncWriteLog(sysUserDetailsDTO,"登录失败:此用户已被禁用", ActionStatusEnum.FAILED, ip, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE);
            throw new WardenAccountFailedException("此用户已被禁用");
        }

        // 生成token
        int effectiveHour = wardenGlobalConfig.getTokenEffectiveHour();
        Date expireDate = DateUtils.addHours(new Date(),effectiveHour);
        String token = TokenUtil.build(sysUserDetailsDTO,expireDate);
        resultModel.addData("token",token);

        // token写入缓存
        TokenUser tokenUser = new TokenUser();
        tokenUser.setType(UserType.SYSTEM);
        tokenUser.setUserId(sysUserDetailsDTO.getId().toString());
        tokenUser.setUsername(sysUserDetailsDTO.getUid());
        if(!sysConfigService.findCurrent().getAllowManyToken()){
            SseMessage<String> message = new SseMessage<>();
            message.setMsgId(System.currentTimeMillis());
            message.setTopic(TopicEnum.EVENT_TOKEN_OFFLINE);
            sseService.sendMessage(message,tokenUser,token);
            tokenCacheService.clear(tokenUser);
        }
        tokenCacheService.add(tokenUser,token);

        // 清除登录失败计数
        loginService.success(sysUserDetailsDTO.getId(),ip);
        // 写入日志
        loginService.asyncWriteLog(sysUserDetailsDTO,"登录成功", ActionStatusEnum.SUCCESS,ip, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE);
        return resultModel;
    }

    /**
     * 退出登录
     * @return
     */
    @RequestMapping("/logout")
    public ResultModel logout(HttpServletRequest request){
        String ip = WebUtil.getIpAddr();
        JwtUser jwtUser = getJwtUser();
        String token = request.getHeader(wardenGlobalConfig.getTokenKeyName());
        if(null != jwtUser && StringUtils.isNotBlank(token)) {
            // 清除缓存
            tokenCacheService.remove(jwtUser,token);
            // 清除登录失败计数
            loginService.success(Long.parseLong(jwtUser.getUserId()), ip);
        }
        return ResultModel.success();

    }

}
