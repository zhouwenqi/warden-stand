package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.IResultModel;

/**
 * exception - 重置装态码异常
 * 用于重置response状态码
 * @author zhouwenqi
 */
public class WardenRestCodeException extends WardenException {
    public WardenRestCodeException(IResultModel iResultModel){
        super(iResultModel);
    }
}
