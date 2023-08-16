package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.*;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireAuthorizedException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import com.microwarp.warden.stand.facade.sysuser.dto.*;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * controller - 系统用户
 * @author zhouwenqi
 */
@RestController
public class UserController extends BaseController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 查看用户信息
     * @param id 用户id
     * @return
     */
    @GetMapping("/user/{id}")
    public ResultModel info(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("参数错误");
        }
        SysUserDTO sysUserDTO = sysUserService.findById(id);
        if(null == sysUserDTO){
            throw new WardenRequireParamterException("用户不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("user",SysUserMapstruct.Instance.sysUserDtoToSysUserVo(sysUserDTO));
        return resultModel;
    }

    /**
     * 创建用户信息
     * @param createRequest 用户信息
     * @return
     */
    @PostMapping("/user")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel postInfo(@RequestBody @Validated SysUserCreateRequest createRequest){
        SysUserRequestDTO requestDTO = SysUserMapstruct.Instance.sysUserCreateRequestToSysUserRequestDTO(createRequest);
        requestDTO.setPwd(bCryptPasswordEncoder.encode(createRequest.getPwd()));
        if(null != createRequest.getRoleIds()){
            Set<SysRoleDTO> roleDTOS = sysRoleService.findByIds(createRequest.getRoleIds());
            Set<String> roleValues = roleDTOS.stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
            if(SecurityUtil.hasAnyAuthority(roleValues, SecurityConstants.ROOT_DEFAULT_VALUE) && !SecurityUtil.inRoot()){
                throw new WardenRequireAuthorizedException("创建超级管理员权限不够");
            }
        }
        Long userId = sysUserService.create(requestDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("userId",userId);
        return resultModel;
    }

    /**
     * 更新用户信息
     * @param updateRequest 更新用户信息
     * @return
     */
    @PutMapping("/user")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel putInfo(@RequestBody @Validated SysUserUpdateRequest updateRequest){
        SysUserDTO sysUserDTO = SysUserMapstruct.Instance.sysUserUpdateRequestToSysUserDTO(updateRequest);
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsById(sysUserDTO.getId());

        if(null == sysUserDetailsDTO){
            throw new WardenParamterErrorException("用户不存在");
        }

        Set<String> roleValues = sysUserDetailsDTO.getRoles().stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
        if(SecurityUtil.hasAnyAuthority(roleValues, SecurityConstants.ROOT_DEFAULT_VALUE) && !SecurityUtil.inRoot()){
            throw new WardenRequireAuthorizedException("修改超级管理员权限不够");
        }

        ResultModel resultModel = ResultModel.success();
        sysUserService.update(sysUserDTO);
        // 角色更新
        if(null != updateRequest.getRoleIds()){
            Set<SysRoleDTO> roleDTOS = sysRoleService.findByIds(updateRequest.getRoleIds());
            Set<String> values = roleDTOS.stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
            if(SecurityUtil.hasAnyAuthority(values, SecurityConstants.ROOT_DEFAULT_VALUE) && !SecurityUtil.inRoot()){
                throw new WardenRequireAuthorizedException("提权超级管理员权限不够");
            }
            sysRoleService.saveUserRoles(sysUserDetailsDTO.getId(),updateRequest.getRoleIds());
        }
        return resultModel;
    }

    /**
     * 更新用户密码
     * @param passwordRequest 密码参数
     * @return
     */
    @PutMapping("/user/password")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel putPassword(@RequestBody @Validated SysUserPasswordRequest passwordRequest){
        if(null == passwordRequest.getUserId()){
            throw new WardenRequireParamterException("用户id不能为空");
        }
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsById(passwordRequest.getUserId());
        if(null == sysUserDetailsDTO){
            throw new WardenParamterErrorException("用户不存在");
        }
        Set<String> roleValues = sysUserDetailsDTO.getRoles().stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
        if(SecurityUtil.hasAnyAuthority(roleValues, SecurityConstants.ROOT_DEFAULT_VALUE) && !SecurityUtil.inRoot()){
            throw new WardenRequireAuthorizedException("修改超级管理员权限不够");
        }
        SysUserPasswordDTO sysUserPasswordDTO = new SysUserPasswordDTO();
        sysUserPasswordDTO.setUserId(passwordRequest.getUserId());
        sysUserPasswordDTO.setNewPassword(bCryptPasswordEncoder.encode(passwordRequest.getNewPassword()));
        sysUserService.updatePassowrd(sysUserPasswordDTO);
        return ResultModel.success();
    }

    /**
     * 删除用户
     * @param id 用户id
     * @return
     */
    @DeleteMapping("/user/{id}")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel deleteProfile(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("参数错误");
        }
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsById(id);
        if(null == sysUserDetailsDTO){
            throw new WardenParamterErrorException("用户不存在");
        }
        if(sysUserDetailsDTO.getUid().equals(SecurityConstants.RESERVE_ROOT_USER)){
            throw new WardenParamterErrorException("保留帐号不可删除");
        }
        Set<String> roleValues = sysUserDetailsDTO.getRoles().stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
        if(SecurityUtil.hasAnyAuthority(roleValues, SecurityConstants.ROOT_DEFAULT_VALUE) && !SecurityUtil.inRoot()){
            throw new WardenRequireAuthorizedException("删除超级管理员权限不够");
        }
        sysUserService.delete(sysUserDetailsDTO.getId());
        return  ResultModel.success();
    }

    /**
     * 查询用户列表 - 分页
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/users/search")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel postSearch(@RequestBody SearchPageable<SysUserSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysUserDTO> resultPage = sysUserService.findPage(searchPageable);
        resultModel.addData("list", resultPage.getList());
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return  resultModel;
    }
}
