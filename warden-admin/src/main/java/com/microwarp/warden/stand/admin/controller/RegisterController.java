package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysUserRegisterRequest;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * controller - 注册
 * @author zhouwenqi
 */
@RestController
public class RegisterController {
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 注册系统用户
     * @param registerRequest 注册信息
     * @return
     */
    @PostMapping("/register")
    public ResultModel register(@RequestBody @Validated SysUserRegisterRequest registerRequest){
        if(!wardenGlobalConfig.getEnableRegister()){
            throw new WardenRequireParamterException("注册功能已关闭");
        }
        SysUserDTO sysUserDTO = SysUserMapstruct.Instance.sysUserRegisterRequestToSysUserDTO(registerRequest);
        sysUserDTO.setPwd(bCryptPasswordEncoder.encode(registerRequest.getPwd()));
        sysUserService.insert(sysUserDTO);
        return ResultModel.success();
    }
}
