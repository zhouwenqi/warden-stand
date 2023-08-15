package com.microwarp.warden.stand.common.security;

/**
 * Created by Administrator on 2023/7/12.
 */
public interface JwtUser {
    String getUserId();
    String getUsername();
    UserType getType();
}
