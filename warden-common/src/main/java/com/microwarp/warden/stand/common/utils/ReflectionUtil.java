package com.microwarp.warden.stand.common.utils;

import java.lang.reflect.Field;

/**
 * 反射 - util
 * Created by microwarp.com on 2023/6/29.
 * @author zhouwenqi
 * @version 1.0.0
 */
public class ReflectionUtil {
    public static Field findField(Class<?> cls, String fieldName){
        try {
            Field[] fields = cls.getDeclaredFields();
            for(Field field:fields){
                if(field.getName().equals(fieldName)){
                    return field;
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
