package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysUserRegisterRequest;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
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
    @Autowired
    private LogService logService;

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
        Long userId = sysUserService.insert(sysUserDTO);
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsById(userId);

        ResultModel resultModel = ResultModel.success();
        resultModel.addData("user",SysUserMapstruct.Instance.sysUserDetailsDtoToSysUserDetailsVo(sysUserDetailsDTO));

        // 写入日志
        String ip = WebUtil.getIpAddr();
        logService.syncWrite(sysUserDetailsDTO,"注册个人信息:"+sysUserDetailsDTO.getUid()+"["+sysUserDetailsDTO.getId()+"]",ip, ActionTypeEnum.CREATE, AppTerminalEnum.PC_WEB, PlatformTypeEnum.BACKSTAGE, ModuleTypeEnum.SYS_USER,sysUserDetailsDTO.getId());
        return resultModel;
    }
}
