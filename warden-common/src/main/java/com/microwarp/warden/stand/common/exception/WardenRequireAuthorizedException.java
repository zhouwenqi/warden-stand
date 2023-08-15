package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 权限不足异常
 * @author zhouwenqi
 */
public class WardenRequireAuthorizedException extends WardenException {
    public WardenRequireAuthorizedException(){
        super(new ResultModel(ResultCode.REQUIRE_AUTHORIZED));
    }
    public WardenRequireAuthorizedException(String message){
        super(new ResultModel(ResultCode.REQUIRE_AUTHORIZED.getCode(),message));
    }
}
