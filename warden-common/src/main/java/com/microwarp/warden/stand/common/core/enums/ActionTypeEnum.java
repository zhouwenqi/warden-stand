package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 动作类型
 */
public enum ActionTypeEnum implements BaseEnum {
    CREATE(0,"创建"),
    MODIFY(1,"修改"),
    DELETE(2,"删除"),
    VERIFY(3,"审核"),
    IMPORT(4,"导入"),
    EXPORT(5,"导出"),
    JOIN(6,"加入"),
    LOGIN(7,"登录"),
    QUIT(8,"退出"),
    PAYMENT(9,"支付"),
    PUSH(10,"推送");
    int code;
    String tag;
    ActionTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
