package com.microwarp.warden.stand.common.model;

/**
 * enum - warden 统一请求状态码
 * @author zhouwenqi
 * @version 1.0.0
 */
public enum ResultCode {
    SUCCESS(200,"请求成功"),
    ERROR(500,"请求服务器错误"),
    FAILED(701,"请求失败"),
    FAILED_BODY(702,"Body结构异常"),
    REQUIRE_PARAMETER(720,"缺少参数"),
    ERROR_PARAMETER(730,"参数错误"),
    REQUIRE_AUTHORIZED(900,"缺少权限"),
    REQUIRE_TOKEN(901,"缺少Token凭证"),
    ERROR_TOKEN(902,"Token校验失败"),
    ACCOUNT_FAILED(903,"帐号异常"),
    REQUIRE_LOGIN(912,"需要登录");
    private final int code;
    private final String message;
    ResultCode(int code,String message){
        this.code = code;
        this.message = message;
    }
    public static ResultCode valueOf(int code) {
        ResultCode status = resolve(code);
        if(status == null) {
            throw new IllegalArgumentException("There is no such [" + code + "]");
        } else {
            return status;
        }
    }
    public static ResultCode resolve(int code) {
        ResultCode[] vars = values();
        for(int i = 0; i < vars.length; ++i) {
            ResultCode status = vars[i];
            if(status.code == code) {
                return status;
            }
        }
        return null;
    }
    public int getCode() {
        return code;
    }
    public String getMessage(){
        return message;
    }
}
