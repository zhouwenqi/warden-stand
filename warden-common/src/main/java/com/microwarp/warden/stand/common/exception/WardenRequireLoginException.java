package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.IResultModel;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;

/**
 * exception - 需要登录异常
 * @author zhouwenqi
 */
public class WardenRequireLoginException extends WardenException {
    public WardenRequireLoginException(){
        super(new ResultModel(ResultCode.REQUIRE_LOGIN));
    }
    public WardenRequireLoginException(IResultModel iResultModel){
        super(iResultModel);
    }
    public WardenRequireLoginException(String message){
        super(new ResultModel(ResultCode.REQUIRE_LOGIN));
        this.getResultModel().setMsg(message);
    }
}
