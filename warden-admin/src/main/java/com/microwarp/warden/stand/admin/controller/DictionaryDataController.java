package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysDictionaryDataMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryDataCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryDataUpdateRequest;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;
import com.microwarp.warden.stand.facade.sysdictionary.service.SysDictionaryDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * controller - 字典数据
 * @author zhouwenqi
 */
@RestController
public class DictionaryDataController {
    @Autowired
    private SysDictionaryDataService sysDictionaryDataService;
    @Autowired
    private LogService logService;

    /**
     * 获取一条字典数据
     * @param id 字典数据id
     * @return
     */
    @GetMapping("/dictionaryData/{id}")
    public ResultModel getDictionaryData(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("字典数据id不能为空");
        }
        SysDictionaryDataDTO sysDictionaryDataDTO = sysDictionaryDataService.findById(id);
        if(null == sysDictionaryDataDTO){
            throw new WardenParamterErrorException("字典数据不存在");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("dictionaryData", SysDictionaryDataMapstruct.Instance.sysDictionaryDataDtoToSysDictionaryDataVO(sysDictionaryDataDTO));
        return resultModel;

    }

    /**
     * 获取字典数据
     * @param dictId 字典id
     * @return
     */
    @GetMapping("/dictionaryDatas/{dictId}")
    public ResultModel getDictionaryDatas(@PathVariable("dictId") Long dictId){
        if(null == dictId){
            throw new WardenRequireParamterException("字典id不能为空");
        }
        List<SysDictionaryDataDTO> list = sysDictionaryDataService.findByDictId(dictId);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("list", SysDictionaryDataMapstruct.Instance.sysDictionaryDatasDtoToSysDictionaryDatasVO(list));
        return resultModel;
    }

    /**
     * 获取字典数据(过淲禁用数据)
     * @param codes 字典编码
     * @return
     */
    @GetMapping("/data/dictionarys/{codes}")
    public ResultModel getDataDictionarys(@PathVariable String[] codes){
        if(null == codes || codes.length < 1){
            throw new WardenRequireParamterException("字典编码不能为空");
        }
        Map<String,Object> map = new HashMap<>();
        for(String code:codes){
            List<SysDictionaryDataDTO> list = sysDictionaryDataService.findByDictCode(code);
            map.put(code,SysDictionaryDataMapstruct.Instance.sysDictionaryDatasDtoToDictionaryItems(list));
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData(map);
        return resultModel;
    }

    /**
     * 添加一条字典数据
     * @param dataRequest 字典数据
     * @return
     */
    @PostMapping("/dictionaryData")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel postDictionaryData(@Validated @RequestBody SysDictionaryDataCreateRequest dataRequest){
        SysDictionaryDataDTO sysDictionaryDataDTO = SysDictionaryDataMapstruct.Instance.sysDictionaryDataCreateRequestToSysDictionaryDataDTO(dataRequest);
        SysDictionaryDataDTO newDataDTO =  sysDictionaryDataService.create(sysDictionaryDataDTO);
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("dictionaryData", SysDictionaryDataMapstruct.Instance.sysDictionaryDataDtoToSysDictionaryDataVO(newDataDTO));

        // 写入日志
        logService.syncPcBackWrite("追加字典数据:"+newDataDTO.getDictId()+" -> [" +newDataDTO.getDataKey()+","+newDataDTO.getDataValue()+","+newDataDTO.getDataAlias()+"]", ActionTypeEnum.CREATE, ModuleTypeEnum.DICTIONARY_DATA,newDataDTO.getId());
        return resultModel;
    }

    /**
     * 更新一条字典数据
     * @param dataRequest 字典数据
     * @return
     */
    @PatchMapping("/dictionaryData")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel putDictionaryData(@Validated @RequestBody SysDictionaryDataUpdateRequest dataRequest){
        SysDictionaryDataDTO sysDictionaryDataDTO = SysDictionaryDataMapstruct.Instance.sysDictionaryDataUpdateRequestToSysDictionaryDataDTO(dataRequest);
        sysDictionaryDataService.update(sysDictionaryDataDTO);
        // 写入日志
        logService.syncPcBackWrite("修改字典数据:"+sysDictionaryDataDTO.getDictId()+" -> [" +sysDictionaryDataDTO.getDataKey()+","+sysDictionaryDataDTO.getDataValue()+","+sysDictionaryDataDTO.getDataAlias()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.DICTIONARY_DATA,sysDictionaryDataDTO.getId());
        return ResultModel.success();
    }

    /**
     * 删除字典数据
     * @param id 字典数据id
     * @return
     */
    @DeleteMapping("/dictionaryData/{id}")
    @PreAuthorize("hasAuthority('dictionary:admin')")
    public ResultModel deleteDictionaryData(@PathVariable Long... id){
        if(null != id && id.length > 0){
            sysDictionaryDataService.delete(id);

            // 写入日志
            logService.syncPcBackWrite("删除字典数据:"+"[" + Arrays.toString(id) +"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.DICTIONARY_DATA,id);
        }
        return ResultModel.success();
    }

}
