package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.SortRequest;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysDeptMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysDeptCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDeptUpdateRequest;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.annotation.RepeatRequestCheck;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptSearchDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;
import com.microwarp.warden.stand.facade.sysdept.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * controller - 部门
 * @author zhouwenqi
 */
@RestController
public class DeptController extends BaseController {
    @Autowired
    private SysDeptService sysDeptService;
    /**
     * 获取部门信息
     * @param id 部门id
     * @return
     */
    @GetMapping("/dept/{id}")
    @PreAuthorize("hasAuthority('dept:view')")
    public ResultModel getInfo(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("部门ID不能为空");
        }
        SysDeptDTO sysDeptDTO = sysDeptService.findById(id);
        if(null == sysDeptDTO){
            throw new WardenParamterErrorException("部门信息不存不在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("dept", SysDeptMapstruct.Instance.sysDeptDtoToSysDeptVO(sysDeptDTO));
        return resultModel;
    }

    /**
     * 创建部门
     * @param sysDeptRequest 部门信息
     * @return
     */
    @PostMapping("/dept")
    @RepeatRequestCheck
    @PreAuthorize("hasAuthority('dept:create')")
    public ResultModel postInfo(@Validated @RequestBody SysDeptCreateRequest sysDeptRequest){
        SysDeptDTO sysDeptDTO = SysDeptMapstruct.Instance.sysDeptCreateRequestToSysDeptDTO(sysDeptRequest);
        ResultModel resultModel = ResultModel.success();
        SysDeptDTO newDeptDTO = sysDeptService.create(sysDeptDTO);
        resultModel.addData("dept",newDeptDTO);

        // 写入日志
        writeLog("创建部门信息:"+newDeptDTO.getName()+"["+newDeptDTO.getCode()+"]", ActionTypeEnum.CREATE, ModuleTypeEnum.SYS_DEPT,newDeptDTO.getId());
        return resultModel;
    }

    /**
     * 更新部门
     * @param sysDeptRequest 部门信息
     * @return
     */
    @PatchMapping("/dept")
    @RepeatRequestCheck
    @PreAuthorize("hasAuthority('dept:modify')")
    public ResultModel putInfo(@Validated @RequestBody SysDeptUpdateRequest sysDeptRequest){
        SysDeptDTO sysDeptDTO = SysDeptMapstruct.Instance.sysDeptUpdateRequestToSysDeptDTO(sysDeptRequest);
        sysDeptService.update(sysDeptDTO);
        // 写入日志
        writeLog("修改部门信息:"+sysDeptDTO.getName()+"["+sysDeptDTO.getCode()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_DEPT,sysDeptDTO.getId());
        return ResultModel.success();
    }

    /**
     * 删除部门信息
     * @param id 部门id
     * @return
     */
    @DeleteMapping("/dept/{id}")
    @PreAuthorize("hasAuthority('dept:modify')")
    public ResultModel deleteInfo(@PathVariable Long[] id){
        if(null != id && id.length>0){
            sysDeptService.delete(id);
            // 写入日志
            writeLog("删除部门信息:"+"["+ Arrays.toString(id)+"]", ActionTypeEnum.DELETE, ModuleTypeEnum.SYS_DEPT,id);
        }
        return ResultModel.success();
    }

    /**
     * 部门拖拽排序
     * @param sortRequest 排序参数
     * @return
     */
    @PutMapping("/depts/sort")
    @PreAuthorize("hasAuthority('dept:modify')")
    public ResultModel sort(@Validated @RequestBody SortRequest sortRequest){
        sysDeptService.dragAndSort(sortRequest);
        return ResultModel.success();
    }

    /**
     * 获取所有部门树型数据结构
     * @return
     */
    @GetMapping("/depts/tree")
    public ResultModel tree(){
        ResultModel resultModel = ResultModel.success();
        List<SysDeptTreeDTO> list = sysDeptService.findTrees();
        resultModel.addData("list",SysDeptMapstruct.Instance.sysDeptTreeDtosToSysDeptTreesVOs(list));
        return resultModel;
    }

    /**
     * 分页查询部门信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/depts/search")
    @PreAuthorize("hasAuthority('dept:view')")
    public ResultModel search(@RequestBody SearchPageable<SysDeptSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysDeptDTO> resultPage = sysDeptService.findPage(searchPageable);
        resultModel.addData("list",SysDeptMapstruct.Instance.sysDeptDtosToSysDeptsVOs(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }
}
