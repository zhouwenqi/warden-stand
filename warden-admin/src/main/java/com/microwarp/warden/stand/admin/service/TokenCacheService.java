package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.domain.pojo.TokenUser;
import com.microwarp.warden.stand.admin.utils.TokenUtil;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.security.JwtUser;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * service - token缓存
 * @author zhouwenqi
 */
@Service
public class TokenCacheService  {
    @Autowired
    private ICacheService iCacheService;

    public String getCacheKey(JwtUser jwtUser){
        return jwtUser.getType()+":"+jwtUser.getUserId();
    }
    /**
     * 获取缓存中用户的Token列表
     * @param jwtUser 用户信息
     * @return
     */
    public List<String> getTokens(JwtUser jwtUser){
        String key = getCacheKey(jwtUser);
        List<String> list = iCacheService.get(CacheConstants.CACHE_TOKENS,key);
        if(null == list){
            return new ArrayList<>();
        }
        boolean expireItem = checkTokens(list);
        if(expireItem){
            iCacheService.save(CacheConstants.CACHE_TOKENS,key,list);
        }
        return list;
    }

    /**
     * 检查缓存中是否存在此token
     * @param jwtUser 用户信息
     * @param token token凭据
     * @return
     */
    public boolean contains(JwtUser jwtUser, String token){
        List<String> tokens = getTokens(jwtUser);
        return tokens.contains(token);
    }

    /**
     * 获取缓存是否存在此token(自动解析用户信息)
     * @param token token凭据
     * @return
     */
    public boolean contains(String token){
        TokenUser tokenUser = TokenUtil.parse(token);
        if(null == token){
            return false;
        }
        return contains(tokenUser,token);
    }

    /**
     * 设置缓存中用户token列表
     * @param jwtUser 用户信息
     * @param tokens token列表
     */
    public void set(JwtUser jwtUser,List<String> tokens){
        String key = getCacheKey(jwtUser);
        iCacheService.save(CacheConstants.CACHE_TOKENS,key,tokens);
    }

    /**
     * 追加缓存中用户token凭据
     * @param jwtUser 用户信息
     * @param token token凭据
     */
    public void add(JwtUser jwtUser, String token){

        List<String> tokens = getTokens(jwtUser);
        tokens.add(token);
        set(jwtUser,tokens);
    }

    /**
     * 追加缓存中用户token凭据(自动解析用户信息)
     * @param token token凭据
     */
    public void add(String token){
        TokenUser tokenUser = TokenUtil.parse(token);
        if(null == token){
            return;
        }
        List<String> tokens = getTokens(tokenUser);
        tokens.add(token);
        set(tokenUser,tokens);
    }

    /**
     * 检查是否有过期的token
     * 并从列表中移除
     * @param tokens token列表
     * @return
     */
    public boolean checkTokens(List<String> tokens){
        boolean expire = false;
        Iterator<String> iterator = tokens.iterator();
        while (iterator.hasNext()){
            String token = iterator.next();
            JwtUser jwtUser = TokenUtil.parse(token);
            if(null == jwtUser){
                iterator.remove();
                expire = true;
            }
        }
        return expire;
    }

    /**
     * 移除一个token
     * @param jwtUser 用户信息
     * @param token 用户token
     */
    public void remove(JwtUser jwtUser, String token){
        List<String> tokens = getTokens(jwtUser);
        tokens.remove(token);
        set(jwtUser,tokens);
    }

    /**
     * 清除缓存中的token列表
     * @param key 缓存Key
     */
    public void clear(String key){
        iCacheService.batchRemove(CacheConstants.CACHE_TOKENS,key);
    }
    /**
     * 清除缓存中的token列表
     * @param jwtUser 用户信息
     */
    public void clear(JwtUser jwtUser){
        String key = getCacheKey(jwtUser);
        clear(key);
    }

}
