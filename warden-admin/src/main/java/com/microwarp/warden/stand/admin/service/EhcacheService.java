package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.utils.SpringUtil;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import org.springframework.stereotype.Service;

import javax.cache.Cache;
import javax.cache.CacheManager;

/**
 * service - ehcache
 */
@Service
public class EhcacheService implements ICacheService {
    private static CacheManager cacheManager;
    private Cache getCache(String name){
        if(null == cacheManager) {
             cacheManager = SpringUtil.getBean(CacheManager.class);
        }
        return cacheManager.getCache(name);
    }

    /**
     * 批量移除指定key的缓存
     * @param name 缓存名
     * @param key 键名
     */
    @Override
    public void batchRemove(String name,String... key) {
        if(null == key || key.length <1){
            return;
        }
        Cache cache = getCache(name);
        if(null == cache){
            return;
        }
        try {
            for (String k : key) {
                cache.remove(k);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
