package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysDeptMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysDeptRequest;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptSearchDTO;
import com.microwarp.warden.stand.facade.sysdept.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
    public ResultModel getInfo(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("部门id不能为空");
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
    public ResultModel postInfo(@Validated @RequestBody SysDeptRequest sysDeptRequest){
        SysDeptDTO sysDeptDTO = SysDeptMapstruct.Instance.sysDeptRequestToSysDeptDTO(sysDeptRequest);
        sysDeptDTO.setId(null);
        ResultModel resultModel = ResultModel.success();
        SysDeptDTO newDeptDTO = sysDeptService.create(sysDeptDTO);
        resultModel.addData("dept",newDeptDTO);
        return resultModel;
    }

    /**
     * 更新部门
     * @param sysDeptRequest 部门信息
     * @return
     */
    @PutMapping("/dept")
    public ResultModel putInfo(@Validated @RequestBody SysDeptRequest sysDeptRequest){
        SysDeptDTO sysDeptDTO = SysDeptMapstruct.Instance.sysDeptRequestToSysDeptDTO(sysDeptRequest);
        if(null == sysDeptDTO.getId()){
            throw new WardenRequireParamterException("部门id不能为空");
        }
        sysDeptService.update(sysDeptDTO);
        return ResultModel.success();
    }

    /**
     * 删除部门信息
     * @param id 部门id
     * @return
     */
    @DeleteMapping("/dept/{id}")
    public ResultModel deleteInfo(@PathVariable Long[] id){
        if(null != id && id.length>0){
            sysDeptService.delete(id);
        }
        return ResultModel.success();
    }

    /**
     * 分页查询部门信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/dept/search")
    public ResultModel search(@RequestBody SearchPageable<SysDeptSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysDeptDTO> resultPage = sysDeptService.findPage(searchPageable);
        resultModel.addData("list",SysDeptMapstruct.Instance.sysDeptsDtoToSysDeptsVO(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }
}
