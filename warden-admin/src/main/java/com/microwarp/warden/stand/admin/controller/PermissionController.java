package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.SortRequest;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysPermissionMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionTreeVO;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionUpdateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionVO;
import com.microwarp.warden.stand.admin.service.ExcelExportService;
import com.microwarp.warden.stand.common.core.annotation.RepeatRequestCheck;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionTreeDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * controller - 系统权限
 * @author zhouwenqi
 */
@RestController
public class PermissionController extends BaseController {
    @Autowired
    private SysPermissionService sysPermissionService;
    @Autowired
    private ExcelExportService excelExportService;

    /**
     * 获取权限信息
     * @param id 权限id
     * @return
     */
    @GetMapping("/permission/{id}")
    @PreAuthorize("hasAuthority('permission:view')")
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
    @PreAuthorize("hasAuthority('permission:delete')")
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
    @RepeatRequestCheck
    @PreAuthorize("hasAuthority('permission:create')")
    public ResultModel postPermission(@Validated @RequestBody SysPermissionCreateRequest permissionRequest){
        SysPermissionDTO sysPermissionDTO = SysPermissionMapstruct.Instance.sysPermissionCreateRequestToSysPermissionDTO(permissionRequest);
        ResultModel resultModel = ResultModel.success();
        SysPermissionDTO newSysPermission = sysPermissionService.create(sysPermissionDTO);
        resultModel.addData("permission", SysPermissionMapstruct.Instance.sysPermissionDtoToSysPermissionVO(newSysPermission));
        return resultModel;
    }

    /**
     * 修改权限
     * @param permissionRequest 权限信息
     * @return
     */
    @PatchMapping("/permission")
    @RepeatRequestCheck
    @PreAuthorize("hasAuthority('permission:modify')")
    public ResultModel putPermission(@Validated @RequestBody SysPermissionUpdateRequest permissionRequest){
        SysPermissionDTO sysPermissionDTO = SysPermissionMapstruct.Instance.sysPermissionUpdateRequestToSysPermissionDTO(permissionRequest);
        sysPermissionService.update(sysPermissionDTO);
        return ResultModel.success();
    }


    /**
     * 权限项拖拽排序
     * @param sortRequest 排序参数
     * @return
     */
    @PutMapping("/permissions/sort")
    @PreAuthorize("hasAuthority('permission:modify')")
    public ResultModel sort(@Validated @RequestBody SortRequest sortRequest){
        sysPermissionService.dragAndSort(sortRequest);
        return ResultModel.success();
    }

    /**
     * 查询所有权限
     * @return
     */
    @GetMapping("/permissions")
    @PreAuthorize("hasAuthority('permission:view')")
    public ResultModel all(){
        ResultModel resultModel = ResultModel.success();
        List<SysPermissionDTO> sysPermissionDTOS = sysPermissionService.findAll();
        resultModel.addData("list",SysPermissionMapstruct.Instance.sysPermissionDtosToSysPermissionVOs(sysPermissionDTOS));
        return resultModel;
    }

    /**
     * 获取所有权限树
     * @return 权限树
     */
    @GetMapping("/permissions/tree")
    @PreAuthorize("hasAuthority('permission:view')")
    public ResultModel tree(){
        ResultModel resultModel = ResultModel.success();
        List<SysPermissionTreeDTO> list = sysPermissionService.findTrees();
        resultModel.addData("list",SysPermissionMapstruct.Instance.sysPermissionTreeDtosToSysPermissionTreeVOs(list));
        return resultModel;
    }


    /**
     * 权限页分查询
     * @param searchPageable 查询参数
     * @return
     */
    @PostMapping("/permissions/search")
    @PreAuthorize("hasAuthority('permission:view')")
    public ResultModel search(@RequestBody SearchPageable<BasicSearchDTO> searchPageable){
        ResultPage<SysPermissionDTO> resultPage = sysPermissionService.findPage(searchPageable);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("list",SysPermissionMapstruct.Instance.sysPermissionDtosToSysPermissionVOs(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }

    /**
     * 导出Excel数据
     * @param searchPageable 查询条件
     * @param response
     * @throws IOException
     */
    @PostMapping("/permissions/export")
    @RepeatRequestCheck
    @PreAuthorize("hasAuthority('data:export')")
    public void export(@RequestBody SearchPageable<BasicSearchDTO> searchPageable, HttpServletResponse response) throws IOException{
        String fileName = "系统权限"+System.currentTimeMillis();
        excelExportService.sysPermissionPageData(fileName,"权限列表", response, searchPageable);

        // 写入日志
        writeLog("导出权限数据:"+fileName, ActionTypeEnum.EXPORT, ModuleTypeEnum.SYS_PERMISSION,null);
    }
}
