package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.utils.SpringUtil;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import org.apache.commons.lang3.StringUtils;
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
     * 保存缓存
     * @param cacheName 缓存名
     * @param key 键名
     * @param object 保存对象
     */
    public void save(String cacheName, String key, Object object){
        Cache cache = getCache(cacheName);
        if(null == cache){
            return;
        }
        cache.put(key,object);
    }

    /**
     * 批量移除指定key的缓存
     * @param cacheName 缓存名
     * @param key 键名
     */
    @Override
    public void batchRemove(String cacheName, String... key) {
        batchRemove(new String[]{cacheName},key);
    }

    /**
     * 批量移除指定key的缓存
     * @param cacheNames 缓存名列表
     * @param keys 键名列表
     */
    public void batchRemove(String[] cacheNames, String[] keys) {
        if(null == cacheNames || cacheNames.length < 1){
            return;
        }
        for(String name:cacheNames){
            Cache cache = getCache(name);
            if(null == cache){
                continue;
            }
            // 没传key将全部清空
            if(null == keys || keys.length <1){
                cache.clear();
                continue;
            }
            try {
                for (String k : keys) {
                    if(StringUtils.isBlank(k)){
                        continue;
                    }
                    if (cache.containsKey(k)) {
                        cache.remove(k);
                    }
                }
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
