package com.microwarp.warden.stand.common.core.constant;

/**
 * security constant
 */
public class SecurityConstants {
    /** 超级管理员角色默认值 */
    public static final String ROOT_DEFAULT_VALUE = "role:super";
    /** 管理员角色默认值 */
    public static final String ADMIN_DEFAULT_VALUE = "role:admin";
    /** 保留超管用户名 */
    public static final String RESERVE_ROOT_USER = "superman";
    /** 登录失败次数限制 */
    public static final int LOGIN_COUNT_LIMIT = 5;
    /** IP锁定上限 */
    public static final int IP_LOCK_LIMIT = 3;
    /** 锁定时间/ip(分钟) */
    public static final int LOGIN_LOCK_TIME = 10;
}
