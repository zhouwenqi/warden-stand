package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 缺少参数异常
 * @author zhouwenqi
 */
public class WardenRequireParamterException extends WardenException {
    public WardenRequireParamterException(){
        super(new ResultModel(ResultCode.REQUIRE_PARAMETER));
    }
    public WardenRequireParamterException(String message){
        super(new ResultModel(ResultCode.REQUIRE_PARAMETER.getCode(),message));
    }
}
