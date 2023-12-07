package com.microwarp.warden.stand.common.core.enums;

/**
 * enum - 二次验证类型
 * @author zhouwenqi
 */
public enum AgainVerifyTypeEnum implements BaseEnum  {
    NONE(0,"关闭"),
    RISK(1,"风险"),
    ALWAYS(2,"永远");
    int code;
    String tag;
    AgainVerifyTypeEnum(int code, String tag){
        this.code = code;
        this.tag = tag;
    }
}
