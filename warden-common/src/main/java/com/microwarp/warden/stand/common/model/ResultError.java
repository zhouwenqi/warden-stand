package com.microwarp.warden.stand.common.model;

import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import java.util.*;
import java.util.stream.Collectors;

/**
 * warden返回校验错误结果
 * @author zhouwenqi
 */
public class ResultError {
    private List<FieldError> fieldErrors = new ArrayList<>();
    public ResultError(List<FieldError> errorList){
        if(null != errorList){
            this.fieldErrors = errorList.stream().sorted(Comparator.comparing(ObjectError::hashCode)).collect(Collectors.toList());
        }
    }
    public List<FieldError> getFieldErrors(){
        return this.fieldErrors;
    }
    public ObjectError defaultError(){
        return this.fieldErrors.size() > 0 ? this.fieldErrors.get(0) : null;
    }
    public String defaultMessage(){
        ObjectError objectError = defaultError();
        return null != objectError ? objectError.getDefaultMessage() : "";
    }
    public List<Map<String,String>> getVaildFields(){
        List<Map<String,String>> list = new ArrayList<>();
        for(FieldError fieldError:this.fieldErrors){
            Map<String,String> map = new HashMap<>();
            map.put("field",fieldError.getField());
            map.put("error",fieldError.getDefaultMessage());
            list.add(map);
        }
        return list;
    }
}
