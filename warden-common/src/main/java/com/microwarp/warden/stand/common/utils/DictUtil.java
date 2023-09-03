package com.microwarp.warden.stand.common.utils;
import com.microwarp.warden.stand.common.core.enums.*;
import com.microwarp.warden.stand.common.dictionary.DictionaryItem;
import com.microwarp.warden.stand.common.dictionary.WardenDictionary;

import java.util.ArrayList;
import java.util.List;

/**
 * 枚举字典 - util
 */
public class DictUtil {
    static {
        addEnum(GenderEnum.class,GenderEnum.values(),"性别");
        addEnum(AppTerminalEnum.class,AppTerminalEnum.values(),"应用终端");
        addEnum(TerminalEnum.class,TerminalEnum.values(),"设备终端");
        addEnum(ModuleTypeEnum.class,ModuleTypeEnum.values(),"模块类型");
    }
    public static WardenDictionary getEnumDictionary(String key){
        return  WardenDictionary.DictMap.get(key);
    }

    public static void addEnum(Class<? extends BaseEnum> className, BaseEnum[] values, String description){
        String key = className.getSimpleName();
        addMap(key,description,values);
    }

    public static void addMap(String key, String descriptoin, BaseEnum[] baseEnums){
        WardenDictionary wardenDictionary = new WardenDictionary();
        wardenDictionary.setName(key);
        wardenDictionary.setDescription(descriptoin);
        List<DictionaryItem> list = new ArrayList<>();
        for (BaseEnum baseEnum:baseEnums ) {
            DictionaryItem dictionaryItem = new DictionaryItem();
            dictionaryItem.setDataValue(baseEnum.getTag());
            dictionaryItem.setDataAlias(baseEnum.toString());
            dictionaryItem.setDataKey(String.valueOf(baseEnum.getCode()));
            list.add(dictionaryItem);
        }
        wardenDictionary.setItems(list);
        WardenDictionary.DictMap.put(key, wardenDictionary);
    }
}
