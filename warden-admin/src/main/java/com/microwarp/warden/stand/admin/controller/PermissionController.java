package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysPermissionMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionVO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionSearchDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * controller - 系统权限
 * @author zhouwenqi
 */
@RestController
public class PermissionController {
    @Autowired
    private SysPermissionService sysPermissionService;

    /**
     * 获取权限信息
     * @param id 权限id
     * @return
     */
    @GetMapping("/permission/{id}")
    public ResultModel getPermission(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("权限id不能为空");
        }
        SysPermissionDTO sysPermissionDTO = sysPermissionService.findById(id);
        if(null == sysPermissionDTO){
            throw new WardenParamterErrorException("权限不存在");
        }
        SysPermissionVO sysPermissionVO = SysPermissionMapstruct.Instance.sysPermissionDtoToSysPermissionVO(sysPermissionDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("permission",sysPermissionVO);
        return resultModel;
    }

    /**
     * 删除权限信息
     * @param id 权限id
     * @return
     */
    @DeleteMapping("/permission/{id}")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel deletePermission(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenParamterErrorException("权限id不能为空");
        }
        sysPermissionService.delete(id);
        return  ResultModel.success();
    }

    /**
     * 创建权限
     * @param permissionRequest 权限信息
     * @return
     */
    @PostMapping("/permission")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel postPermission(@Validated @RequestBody SysPermissionRequest permissionRequest){
        SysPermissionDTO sysPermissionDTO = SysPermissionMapstruct.Instance.sysPermissionRequestToSysPermissionDTO(permissionRequest);
        ResultModel resultModel = ResultModel.success();
        SysPermissionDTO newSysPermission = sysPermissionService.create(sysPermissionDTO);
        resultModel.addData("permission", SysPermissionMapstruct.Instance.sysPermissionDtoToSysPermissionVO(newSysPermission));
        return resultModel;
    }

    /**
     * 创建权限
     * @param permissionRequest 权限信息
     * @return
     */
    @PutMapping("/permission")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel putPermission(@Validated @RequestBody SysPermissionRequest permissionRequest){
        SysPermissionDTO sysPermissionDTO = SysPermissionMapstruct.Instance.sysPermissionRequestToSysPermissionDTO(permissionRequest);
        if(null == sysPermissionDTO.getId()){
            throw new WardenParamterErrorException("权限id不能为空");
        }
        sysPermissionService.update(sysPermissionDTO);
        return ResultModel.success();
    }

    /**
     * 查询所有权限
     * @return
     */
    @GetMapping("/permissions")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel all(){
        ResultModel resultModel = ResultModel.success();
        List<SysPermissionDTO> sysPermissionDTOS = sysPermissionService.findAll();
        resultModel.addData("list",SysPermissionMapstruct.Instance.sysPermissionsDtoToSysPermissionsVO(sysPermissionDTOS));
        return resultModel;
    }
    /**
     * 权限页分查询
     * @param searchPageable 查询参数
     * @return
     */
    @PostMapping("/permissions/search")
    @PreAuthorize("hasAnyRole('role:super','role:admin')")
    public ResultModel search(@RequestBody SearchPageable<SysPermissionSearchDTO> searchPageable){
        ResultPage<SysPermissionDTO> resultPage = sysPermissionService.findPage(searchPageable);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("list",SysPermissionMapstruct.Instance.sysPermissionsDtoToSysPermissionsVO(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }
}