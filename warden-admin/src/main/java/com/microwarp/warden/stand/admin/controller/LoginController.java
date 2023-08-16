package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.vo.SysUserLoginRequest;
import com.microwarp.warden.stand.admin.service.LoginService;
import com.microwarp.warden.stand.admin.utils.TokenUtil;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.exception.WardenAccountFailedException;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * controller - 登录
 * @author zhouwenqi
 */
@RestController
public class LoginController {
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 登录
     * @param loginRequest 登录参数
     * @return
     */
    @PostMapping("/login")
    public ResultModel login(@RequestBody @Validated SysUserLoginRequest loginRequest){
        ResultModel resultModel = ResultModel.success();
        // 查询用户信息
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsByUid(loginRequest.getUid());
        if(null == sysUserDetailsDTO){
            // 实际只是帐号不存在
            throw new WardenParamterErrorException("帐号或密码错误");
        }

        // 判断用户是否锁住
        if(sysUserDetailsDTO.getLocked()){
            throw new WardenParamterErrorException("用户已被锁住");
        }

        // 校验登录密码
        if(!bCryptPasswordEncoder.matches(loginRequest.getPwd(),sysUserDetailsDTO.getPwd())){
            int failedCount = loginService.getLoginFailed(sysUserDetailsDTO.getId()).getCount();
            // 失败5次锁住
            if(failedCount >= 5){
                loginService.lock(sysUserDetailsDTO.getId());
                throw new WardenParamterErrorException("用户已被锁住");
            }else{
                loginService.failed(sysUserDetailsDTO.getId());
            }
            throw new WardenParamterErrorException("帐号或密码错误");
        }

        // 检查系统用户状态
        if(sysUserDetailsDTO.getDisabled()){
            throw new WardenAccountFailedException("此用户已被禁用");
        }

        // 生成token
        int effectiveHour = wardenGlobalConfig.getTokenEffectiveHour();
        Date expireDate = DateUtils.addHours(new Date(),effectiveHour);
        String token = TokenUtil.build(sysUserDetailsDTO,expireDate);
        resultModel.addData("token",token);
        // 清除登录失败计数
        loginService.success(sysUserDetailsDTO.getId());
        return resultModel;
    }

    @RequestMapping("/logout")
    public SysUserDTO logout(Long id){
        return sysUserService.findById(id);
    }

}
