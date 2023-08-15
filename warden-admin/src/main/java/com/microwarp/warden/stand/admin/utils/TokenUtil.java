package com.microwarp.warden.stand.admin.utils;

import com.microwarp.warden.stand.admin.domain.pojo.TokenUser;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.security.UserType;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;

/**
 * Token - util
 */
public class TokenUtil {
    private static final Logger logger = LoggerFactory.getLogger(TokenUtil.class);
    /**
     * 生成token(默认到期时间7天)
     * @param jwtUser 用户参数
     * @return
     */
    public static String build(JwtUser jwtUser){
        return JwtUtil.create(jwtUser);
    }

    /**
     * 生成token
     * @param jwtUser 用户参数
     * @param expireDate 到期时间
     * @return
     */
    public static String build(JwtUser jwtUser,Date expireDate){
        return JwtUtil.create(jwtUser,expireDate);
    }

    /**
     * 生成token
     * @param userDTO 系统用户参数
     * @param expireDate 到期时间
     * @return
     */
    public static String build(SysUserDTO userDTO, Date expireDate){
        TokenUser tokenUser = new TokenUser();
        tokenUser.setType(UserType.SYSTEM);
        tokenUser.setUserId(userDTO.getId().toString());
        tokenUser.setUsername(userDTO.getUid());
        return build(tokenUser,expireDate);
    }

    /**
     * 解析token
     * @param token jwt-token凭据
     * @return 用户参数对象
     */
    public static TokenUser parse(String token){
        try{
            Claims claims = JwtUtil.parse(token);
            TokenUser tokenUser = new TokenUser();
            tokenUser.setUserId((String)claims.get(JwtUtil.USER_ID));
            tokenUser.setUsername((String)claims.get(JwtUtil.USER_NAME));
            tokenUser.setType(UserType.valueOf(claims.get(JwtUtil.USER_TYPE).toString()));
            return tokenUser;
        }catch (Exception e){
            logger.error("token解析错误:{}",token);
        }
        return null;
    }
}
