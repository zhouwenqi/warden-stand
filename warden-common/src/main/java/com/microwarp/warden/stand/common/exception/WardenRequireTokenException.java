package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 缺少Token凭据异常
 * @author zhouwenqi
 */
public class WardenRequireTokenException extends WardenException {
    public WardenRequireTokenException(){
        super(new ResultModel(ResultCode.REQUIRE_TOKEN));
    }
    public WardenRequireTokenException(String message){
        super(new ResultModel(ResultCode.REQUIRE_TOKEN.getCode(),message));
    }
}
