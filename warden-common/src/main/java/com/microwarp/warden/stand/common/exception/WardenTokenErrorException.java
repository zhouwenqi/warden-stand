package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - Token凭据异常
 * 校验失败或已过期
 * @author zhouwenqi
 */
public class WardenTokenErrorException extends WardenException {
    public WardenTokenErrorException(){
        super(new ResultModel(ResultCode.ERROR_TOKEN));
    }
    public WardenTokenErrorException(String message){
        super(new ResultModel(ResultCode.ERROR_TOKEN.getCode(),message));
    }
}
