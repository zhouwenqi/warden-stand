package com.microwarp.warden.stand.admin.domain.pojo;

import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.security.UserType;

/**
 * token 用户
 */
public class TokenUser implements JwtUser {
    /** 用户id */
    private String userId;
    /** 用户名 */
    private String username;
    /** 用户类型 */
    private UserType type;

    @Override
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public UserType getType() {
        return type;
    }

    public void setType(UserType type) {
        this.type = type;
    }
}
