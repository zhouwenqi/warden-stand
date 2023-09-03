package com.microwarp.warden.stand.common.core.constant;

/**
 * http constant
 */
public class HttpConstants {
    /** 统一包请求头部包装类型字段名 */
    public static final String HEADER_PACKAGE_TYPE = "Result-Type";
    /**  统一包请求头部来宾ID字段名 */
    public static final String HEADER_GUEST_KEY = "Guest-Id";
    /** 统一包请求头应用终端类型字段名 */
    public static final String HEADER_APP_TERMINAL = "App-Terminal";
    /** 统一返回验证结果字段 */
    public static final String RESULT_VAILD_KEY = "vaildFields";
    /** 强制包装非warden返回结构字段 */
    public static final String RESULT_ADVICE_KEY = "adviceResult";
    /** 默认分页大小 */
    public static final int DEFAULT_PAGE_SIZE = 10;
}
