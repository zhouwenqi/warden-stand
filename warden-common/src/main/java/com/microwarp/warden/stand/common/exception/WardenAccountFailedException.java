package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 帐号异常
 * @author zhouwenqi
 */
public class WardenAccountFailedException extends WardenException {
    public WardenAccountFailedException(){
        super(new ResultModel(ResultCode.ACCOUNT_FAILED));
    }
    public WardenAccountFailedException(String message){
        super(new ResultModel(ResultCode.ACCOUNT_FAILED.getCode(),message));
    }
}
