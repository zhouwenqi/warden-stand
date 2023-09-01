package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysRoleMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysRolePermissionRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleUpdateRequest;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * controller - 角色
 * @author zhouwenqi
 */
@RestController
public class RoleController extends BaseController {
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysPermissionService sysPermissionService;

    /**
     * 获取角色信息
     * @param id 角色id
     * @return
     */
    @GetMapping("/role/{id}")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel info(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("参数错误");
        }
        SysRoleDetailsDTO sysRoleDetailsDTO = sysRoleService.findDetailsById(id);
        if(null == sysRoleDetailsDTO){
            throw new WardenParamterErrorException("角色信息不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("role", SysRoleMapstruct.Instance.sysRoleDetailsDtoToSysRoleDetailsVO(sysRoleDetailsDTO));
        return resultModel;
    }

    /**
     * 创建角色信息
     * @param createRequest 角色信息
     * @return
     */
    @PostMapping("/role")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel postRole(@Validated @RequestBody SysRoleCreateRequest createRequest){
        SysRoleDTO sysRoleDTO = SysRoleMapstruct.Instance.sysRoleCreateRequestTosysRoleDTO(createRequest);
        sysRoleDTO = sysRoleService.create(sysRoleDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("role",SysRoleMapstruct.Instance.sysRoleDtoToSysRoleVO(sysRoleDTO));

        // 写入日志
        writeLog("创建角色信息:"+sysRoleDTO.getName()+"["+sysRoleDTO.getValue()+"]", ActionTypeEnum.CREATE, ModuleTypeEnum.SYS_ROLE,sysRoleDTO.getId());
        return resultModel;
    }

    /**
     * 更新角色信息
     * @param updateRequest 角色信息
     * @return
     */
    @PatchMapping("/role")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel putRole(@Validated @RequestBody SysRoleUpdateRequest updateRequest){
        SysRoleDTO sysRoleDTO = sysRoleService.findById(updateRequest.getId());
        if(null == sysRoleDTO){
            throw new WardenParamterErrorException("角色信息不存在");
        }
        if(sysRoleDTO.getValue().equals(SecurityConstants.ROLE_ROOT_VALUE)){
            throw new WardenParamterErrorException("保留角色信息不可修改");
        }
        SysRoleDTO sysRolRequesteDTO = SysRoleMapstruct.Instance.sysRoleUpdateRequestTosysRoleDTO(updateRequest);
        sysRoleService.update(sysRolRequesteDTO);
        // 写入日志
        writeLog("修改角色信息:"+sysRolRequesteDTO.getName()+"["+sysRolRequesteDTO.getValue()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_ROLE,sysRolRequesteDTO.getId());
        return ResultModel.success();
    }

    /**
     * 更新角色权限
     * @param roleRequest 更新参数
     * @return
     */
    @PutMapping("/role/permissions")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel putRolePermissions(@Validated @RequestBody SysRolePermissionRequest roleRequest){
        SysRoleDTO sysRoleDTO = sysRoleService.findById(roleRequest.getRoleId());
        if(null == sysRoleDTO){
            throw new WardenParamterErrorException("角色信息不存在");
        }
        if(sysRoleDTO.getValue().equals(SecurityConstants.ROLE_ROOT_VALUE)){
            throw new WardenParamterErrorException("保留角色权限不能修改");
        }
        sysPermissionService.saveRolePermission(roleRequest.getRoleId(), roleRequest.getPermissionIds());
        // 写入日志
        writeLog("修改角色权限:"+sysRoleDTO.getName()+"["+sysRoleDTO.getValue()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_ROLE,sysRoleDTO.getId());
        return ResultModel.success();
    }

    /**
     * 删除角色信息
     * @param id 角色id
     * @return
     */
    @DeleteMapping("/role/{id}")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel deleteRoles(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("角色id不能为空");
        }
        SysRoleDTO sysRoleDTO = sysRoleService.findById(id);
        if(null == sysRoleDTO){
            return ResultModel.success();
        }
        if(sysRoleDTO.getValue().equals(SecurityConstants.ROLE_ROOT_VALUE) || sysRoleDTO.getValue().equals(SecurityConstants.ROLE_ADMIN_VALUE)){
            throw new WardenParamterErrorException("保留角色权限不能删除");
        }
        sysRoleService.delete(id);
        // 写入日志
        writeLog("删除角色ID:"+sysRoleDTO.getName()+"["+sysRoleDTO.getValue()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_ROLE,sysRoleDTO.getId());
        return ResultModel.success();
    }

    /**
     * 分页查询角色
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/roles/search")
    @PreAuthorize("hasAuthority('role:admin')")
    public ResultModel postSearch(@RequestBody SearchPageable<BasicSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysRoleDTO> resultPage = sysRoleService.findPage(searchPageable);
        resultModel.addData("list", resultPage.getList());
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return  resultModel;
    }
}
