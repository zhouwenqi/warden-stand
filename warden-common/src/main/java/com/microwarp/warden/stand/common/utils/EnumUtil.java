package com.microwarp.warden.stand.common.utils;

import com.microwarp.warden.stand.common.core.enums.BaseEnum;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 5/9/2023.
 */
public class EnumUtil {
    public static List<Integer> getCodes(BaseEnum[] baseEnum){
        List<Integer> list = new ArrayList<>();
        if(null == baseEnum || baseEnum.length <0){
            return list;
        }
        for(BaseEnum e:baseEnum){
            list.add(e.getCode());
        }
        return list;
    }
}
