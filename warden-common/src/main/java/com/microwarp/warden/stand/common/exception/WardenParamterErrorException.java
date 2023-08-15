package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 参数错误异常
 * @author zhouwenqi
 */
public class WardenParamterErrorException extends WardenException {
    public WardenParamterErrorException(){
        super(new ResultModel(ResultCode.ERROR_PARAMETER));
    }
    public WardenParamterErrorException(String message){
        super(new ResultModel(ResultCode.ERROR_PARAMETER.getCode(),message));
    }
}
