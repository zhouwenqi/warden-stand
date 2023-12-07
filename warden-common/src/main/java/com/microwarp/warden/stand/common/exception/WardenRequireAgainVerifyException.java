package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 需要第二次验证异常
 * @author zhouwenqi
 */
public class WardenRequireAgainVerifyException extends WardenException {
    public WardenRequireAgainVerifyException(){
        super(new ResultModel(ResultCode.REQUIRE_AGAIN_VERIFY));
    }
    public WardenRequireAgainVerifyException(String message){
        super(new ResultModel(ResultCode.REQUIRE_AGAIN_VERIFY.getCode(),message));
    }
}
