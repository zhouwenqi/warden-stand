package com.microwarp.warden.stand.common.core.enums;

import com.microwarp.warden.stand.common.utils.ReflectionUtil;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Field;

/**
 * enum - basic
 */
public interface BaseEnum {
    String TAG_NAME="tag";
    String VALUE_NAME ="name";
    String INDEX_NAME="code";
    default String getTag(){
        Field field = ReflectionUtil.findField(this.getClass(),TAG_NAME);
        if(null == field){
            return null;
        }
        try{
            field.setAccessible(true);
            return field.get(this).toString();
        }catch (IllegalAccessException e){
            throw new RuntimeException(e);
        }
    }
    default Integer getCode(){
        Field field = ReflectionUtil.findField(this.getClass(),INDEX_NAME);
        if(null == field){
            return null;
        }
        try{
            field.setAccessible(true);
            return Integer.parseInt(field.get(this).toString());
        }catch (IllegalAccessException e){
            throw new RuntimeException(e);
        }
    }
    default String getName(){
        Field field = ReflectionUtil.findField(this.getClass(),VALUE_NAME);
        if(null == field){
            return null;
        }
        try{
            field.setAccessible(true);
            return field.get(this).toString();
        }catch (IllegalAccessException e){
            throw new RuntimeException(e);
        }
    }
    static <T extends BaseEnum> T codeOfEnum(Class<? extends BaseEnum> enumClass, Integer code){
        if(null == code){
            throw new IllegalArgumentException("Enum ordinal should not be null");
        }
        if(enumClass.isAssignableFrom(BaseEnum.class)){
            throw new IllegalArgumentException("illegal enum type");
        }
        T[] enums = (T[])enumClass.getEnumConstants();
        for(T t:enums){
            if(t.getCode().equals(code)){
                return t;
            }
        }
        throw new IllegalArgumentException("cannot parse integer:"+ code+" to " + enumClass.getName());
    }

    static <T extends BaseEnum> T tagOfEnum(Class<? extends BaseEnum> enumClass, String tag){
        if(StringUtils.isBlank(tag)){
            throw new IllegalArgumentException("Enum ordinal should not be null");
        }
        if(enumClass.isAssignableFrom(BaseEnum.class)){
            throw new IllegalArgumentException("illegal enum type");
        }
        T[] enums = (T[])enumClass.getEnumConstants();
        for(T t:enums){
            if(t.getTag().equals(tag)){
                return t;
            }
        }
        throw new IllegalArgumentException("cannot parse string:"+ tag +" to " + enumClass.getName());
    }

}
