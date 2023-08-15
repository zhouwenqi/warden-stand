package com.microwarp.warden.stand.common.utils;

import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.security.SignType;
import com.microwarp.warden.stand.common.security.UserType;
import io.jsonwebtoken.*;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.time.DateUtils;

import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Jwt - util
 * @author zhouwenqi
 * @version 1.0.0
 *
 * */
public class JwtUtil {
    public static SignatureAlgorithm DEFAULT_SIGN_ALGORITHM = SignatureAlgorithm.HS256;
    public final static String USER_NAME = "U_NAME";
    public final static String USER_ID   = "U_ID";
    public final static String USER_TYPE = "U_TYPE";
    /**
     * 创建一个JWT凭据
     * @param id                 :id
     * @param claims             扩展数据
     * @param audience           接受者
     * @param subject            主题
     * @param issuer             签发者
     * @param issuedDate         签发时间
     * @param notBeforeDate      失效时间
     * @param expireDate         过期时间
     * @param secretKey          密钥字符串
     * @param signatureAlgorithm 加密方式
     * @return
     */
    public static String create(String id, Map<String,Object> claims,String audience, String subject, String issuer, Date issuedDate, Date notBeforeDate, Date expireDate, String secretKey,SignatureAlgorithm signatureAlgorithm){

        JwtBuilder builder = Jwts.builder()
                .setId(id)
                .setAudience(audience)
                .setSubject(subject)
                .setIssuer(issuer)
                .setIssuedAt(issuedDate)
                .setNotBefore(notBeforeDate)
                .setExpiration(expireDate)
                .signWith(signatureAlgorithm,secretKey);

        builder.addClaims(claims);
        return builder.compact();
    }
    /**
     * 创建一个JWT凭据
     * @param id                 :id
     * @param claims             扩展数据
     * @param audience           接受者
     * @param subject            主题
     * @param issuer             签发者
     * @param issuedDate         签发时间
     * @param notBeforeDate      失效时间
     * @param expireDate         过期时间
     * @param key                密钥
     * @param signatureAlgorithm 加密方式
     * @return
     */
    public static String create(String id, Map<String,Object> claims,String audience, String subject, String issuer, Date issuedDate, Date notBeforeDate, Date expireDate, Key key,SignatureAlgorithm signatureAlgorithm){

        JwtBuilder builder = Jwts.builder()
                .setId(id)
                .setAudience(audience)
                .setSubject(subject)
                .setIssuer(issuer)
                .setIssuedAt(issuedDate)
                .setNotBefore(notBeforeDate)
                .setExpiration(expireDate)
                .signWith(signatureAlgorithm,key);

        builder.addClaims(claims);
        return builder.compact();
    }
    /**
     * 创建一个JWT凭据
     * @param id            :id
     * @param claims        扩展数据
     * @param audience      接受者
     * @param subject       主题
     * @param issuer        签发者
     * @param issuedDate    签发时间
     * @param notBeforeDate 失效时间
     * @param expireDate    过期时间
     * @param secretKey     密钥
     * @return
     */
    public static String create(String id, Map<String,Object> claims,String audience, String subject, String issuer, Date issuedDate, Date notBeforeDate, Date expireDate, String secretKey) {
        SignatureAlgorithm signatureAlgorithm = DEFAULT_SIGN_ALGORITHM;
        // 判断分别处理RS和HS加密方式
        if (signatureAlgorithm.toString().startsWith("RS")) {
            try {
                PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(secretKey));
                KeyFactory keyFactory = KeyFactory.getInstance("RSA");
                PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
                return create(id, claims, audience, subject, issuer, issuedDate, notBeforeDate, expireDate, privateKey, signatureAlgorithm);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return create(id, claims, audience, subject, issuer, issuedDate, notBeforeDate, expireDate, secretKey, signatureAlgorithm);
        }
        return null;
    }

    /**
     * 创建一个JWT凭据
     * @param userId        用户id
     * @param userName      用户名
     * @param userType      用户类型
     * @param expireDate    过期时间
     * @param secretKey     密钥
     * @return
     */
    public static String create(String userId, String userName, UserType userType, Date expireDate, String secretKey){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put(USER_NAME,userName);
        map.put(USER_ID,userId);
        map.put(USER_TYPE, userType);
        return create(userId,map,userName,"warden-token","warden",new Date(),null,expireDate,secretKey);
    }

    /**
     * 创建一个JWT凭据
     * @param userId        用户id
     * @param userName      用户名
     * @param expireDate    过期时间
     * @param secretKey     密钥
     * @return
     */
    public static String create(String userId, String userName,Date expireDate,String secretKey){
        return create(userId,userName,UserType.NORMAL,expireDate,secretKey);
    }

    /**
     * 创建一个JWT凭据
     * @param userId        用户id
     * @param userName      用户名
     * @param expireDate    过期时间
     * @return
     */
    public static String create(String userId, String userName, Date expireDate){
        String key = getKeyString(SignType.ENCRYPT);
        return create(userId,userName,UserType.NORMAL,expireDate,key);
    }

    /**
     * 创建一个JWT凭据
     * @param jwtUser       用户信息
     * @param expireDate    过期时间
     * @return
     */
    public static String create(JwtUser jwtUser, Date expireDate){
        String key = getKeyString(SignType.ENCRYPT);
        return create(jwtUser.getUserId(),jwtUser.getUsername(),jwtUser.getType(),expireDate, key);
    }

    /**
     * 创建一个JWT凭据
     * @param jwtUser       用户信息
     * @return
     */
    public static String create(JwtUser jwtUser){
        Date expireDate = DateUtils.addDays(new Date(),7);
        return create(jwtUser,expireDate);
    }

    /**
     * 获取JWT凭据内容
     * @param jwt         JWT凭据
     * @param secretKey   密钥
     * @return
     * @throws Exception
     */
    public static Claims parse(String jwt, String secretKey) throws Exception{
        return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(jwt).getBody();
    }

    /**
     * 获取JWT凭据内容
     * @param jwt         JWT凭据
     * @param key         密钥
     * @return
     * @throws Exception
     */
    public static Claims parse(String jwt, Key key) throws Exception{
        return Jwts.parser().setSigningKey(key).parseClaimsJws(jwt).getBody();
    }

    /**
     * 获取JWT凭据内容
     * @param jwt         JWT凭据
     * @return
     * @throws Exception
     */
    public static Claims parse(String jwt) throws Exception{
        String key = AesUitl.DEFAULT_KEY;
        if(DEFAULT_SIGN_ALGORITHM.toString().startsWith("RS")){
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(RsaUtil.DEFAULT_PUBLIC_KEY));
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
            return parse(jwt, publicKey);
        }
        return parse(jwt,key);
    }

    /**
     * 校验JWT凭据有效性
     * @param jwt          JWT凭据
     * @param secretKey    密钥字符串
     * @return
     */
    public static Boolean signed(String jwt, String secretKey){
        return Jwts.parser().setSigningKey(secretKey).isSigned(jwt);
    }

    /**
     * 校验JWT凭据有效性
     * @param jwt          JWT凭据
     * @param key          密钥
     * @return
     */
    public static Boolean signed(String jwt, Key key){
        return Jwts.parser().setSigningKey(key).isSigned(jwt);
    }

    /**
     * 校验JWT凭据有效性
     * @param jwt          JWT凭据
     * @return
     */
    public static Boolean signed(String jwt){
        String key = AesUitl.DEFAULT_KEY;
        if(DEFAULT_SIGN_ALGORITHM.toString().startsWith("RS")){
            try {
                X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(RsaUtil.DEFAULT_PUBLIC_KEY));
                KeyFactory keyFactory = KeyFactory.getInstance("RSA");
                PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
                signed(jwt,publicKey);
            }
            catch (Exception e){
                e.printStackTrace();
                return false;
            }
        }
        return signed(jwt,key);
    }

    /**
     * 获取当前Jwt工具默认密钥
     * @param signType
     * @return
     */
    public static String getKeyString(SignType signType){
        if(DEFAULT_SIGN_ALGORITHM.toString().startsWith("RS")){
            return signType.equals(SignType.DECRYPT) ? RsaUtil.DEFAULT_PUBLIC_KEY : RsaUtil.DEFAULT_PRIVATE_KEY;
        }
        return AesUitl.DEFAULT_KEY;
    }
}
