package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.common.dictionary.DictionaryItem;
import com.microwarp.warden.stand.common.dictionary.WardenDictionary;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.DictUtil;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * controller - 枚举字典数据
 * @author zhouwenqi
 */
@RequestMapping("/enum")
@RestController
public class EnumController {
    /**
     * 获取枚举字典列表
     * @param keys 枚举名称列表
     * @return
     */
    @GetMapping("dictionarys/{keys}")
    public ResultModel enums(@PathVariable String[] keys){
        if(null == keys || keys.length < 1){
            throw new WardenRequireParamterException("Key(枚举类名)不为为空");
        }
        Map<String,Object> map = new HashMap<>();
        for(String key:keys){
            WardenDictionary wardenDictionary = DictUtil.getEnumDictionary(key);
            List<DictionaryItem> list = null != wardenDictionary ? wardenDictionary.getItems() : new ArrayList<>();
            map.put(key, list);
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData(map);
        return resultModel;
    }
}
