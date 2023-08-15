package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysUserDetailsVO;
import com.microwarp.warden.stand.admin.domain.vo.SysUserPasswordRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysUserProfileRequest;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserPasswordDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * controller - 个人信息
 * @author zhouwenqi
 */
@RestController
public class ProfileController extends BaseController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    /**
     * 获取当前用户信息
     * @return
     */
    @GetMapping("/profile")
    public ResultModel getProfile(){
        ResultModel resultModel = ResultModel.success();
        SysUserDetailsVO sysUserResponseVO = SysUserMapstruct.Instance.sysUserDetailsDtoToSysUserDetailsVo(getSecruityUser().getSysUser());
        sysUserResponseVO.setAuthorities(SecurityUtil.getAuthorityArray());
        resultModel.addData("user",sysUserResponseVO);
        return resultModel;
    }

    /**
     * 更新当前用户信息
     * @return
     */
    @PutMapping("/profile")
    public ResultModel putProfile(@RequestBody @Validated SysUserProfileRequest profileRequest){
        ResultModel resultModel = ResultModel.success();
        SysUserDTO sysUserDTO = SysUserMapstruct.Instance.sysUserProfileRequestToSysUserDTO(profileRequest);
        sysUserDTO.setId(getSecruityUser().getSysUser().getId());
        sysUserService.update(sysUserDTO);
        return resultModel;
    }

    /**
     * 更新当前用户密码
     * @return
     */
    @PutMapping("/user/current/password")
    public ResultModel putProfilePassword(@RequestBody @Validated SysUserPasswordRequest passwordRequest){
        String oldPassword = passwordRequest.getOldPassword();
        SysUserDetailsDTO sysUserDetailsDTO = getSecruityUser().getSysUser();
        if(!bCryptPasswordEncoder.matches(oldPassword,sysUserDetailsDTO.getPwd())){
            throw new WardenRequireParamterException("原始密码错误");
        }
        SysUserPasswordDTO sysUserPasswordDTO = new SysUserPasswordDTO();
        sysUserPasswordDTO.setUserId(sysUserDetailsDTO.getId());
        sysUserPasswordDTO.setNewPassword(bCryptPasswordEncoder.encode(passwordRequest.getNewPassword()));
        sysUserService.updatePassowrd(sysUserPasswordDTO);
        return ResultModel.success();
    }
}
