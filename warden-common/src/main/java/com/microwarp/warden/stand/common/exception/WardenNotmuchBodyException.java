package com.microwarp.warden.stand.common.exception;

import com.microwarp.warden.stand.common.model.IResultModel;

/**
 * exception - body包装异常
 * @author zhouwenqi
 */
public class WardenNotmuchBodyException extends WardenException {
    public WardenNotmuchBodyException(IResultModel iResultModel){
        super(iResultModel);
    }
}
