package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysDictionaryMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryUpdateRequest;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;
import com.microwarp.warden.stand.facade.sysdictionary.service.SysDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * controller - 字典
 * @author zhouwenqi
 */
@RestController
public class DictionaryController {
    @Autowired
    private SysDictionaryService sysDictionaryService;

    /**
     * 获取字典信息
     * @param id 字典id
     * @return
     */
    @GetMapping("/dictionary/{id}")
    public ResultModel getDictionary(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("字典id不能为空");
        }
        SysDictionaryDTO sysDictionaryDTO = sysDictionaryService.findById(id);
        if(null == sysDictionaryDTO){
            throw new WardenParamterErrorException("字典不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("dictionary", SysDictionaryMapstruct.Instance.sysDictionaryDtoToSysDictionaryVO(sysDictionaryDTO));
        return resultModel;

    }

    /**
     * 创建字典
     * @param sysDictionaryRequest 字典信息
     * @return
     */
    @PostMapping("/dictionary")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel postDictionary(@Validated @RequestBody SysDictionaryCreateRequest sysDictionaryRequest){
        SysDictionaryDTO sysDictionaryDTO = SysDictionaryMapstruct.Instance.sysDictionaryCreateRequestToSysDictionaryDTO(sysDictionaryRequest);
        SysDictionaryDTO newDictionaryDTO = sysDictionaryService.create(sysDictionaryDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("dictionary", SysDictionaryMapstruct.Instance.sysDictionaryDtoToSysDictionaryVO(newDictionaryDTO));
        return resultModel;
    }

    /**
     * 更新字典
     * @param sysDictionaryRequest 字典信息
     * @return
     */
    @PutMapping("/dictionary")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel putDictionary(@Validated @RequestBody SysDictionaryUpdateRequest sysDictionaryRequest){
        SysDictionaryDTO sysDictionaryDTO = SysDictionaryMapstruct.Instance.sysDictionaryUpdateRequestToSysDictionaryDTO(sysDictionaryRequest);
        if(null == sysDictionaryDTO.getId()){
            throw new WardenRequireParamterException("字典id不能为空");
        }
        sysDictionaryService.update(sysDictionaryDTO);
        return ResultModel.success();
    }

    /**
     * 删除字典
     * @param id 字典id
     * @return
     */
    @DeleteMapping("/dictionary/{id}")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel deleteDictionary(@PathVariable Long... id){
        if(null != id && id.length > 0){
            sysDictionaryService.delete(id);
        }
        return ResultModel.success();
    }

    /**
     * 分页查询字典信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("dictionarys/search")
    public ResultModel search(@RequestBody SearchPageable<BasicSearchDTO> searchPageable){
        ResultPage<SysDictionaryDTO> resultPage = sysDictionaryService.findPage(searchPageable);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("list",SysDictionaryMapstruct.Instance.sysDictionarysDtoToSysDictionarysVO(resultPage.getList()));
        resultModel.addData("pageInfo",resultPage.getPageInfo());
        return resultModel;
    }

}
