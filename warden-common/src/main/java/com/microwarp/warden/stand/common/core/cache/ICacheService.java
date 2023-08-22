package com.microwarp.warden.stand.common.core.cache;

/**
 * service - cache
 *
 */
public interface ICacheService {
    /**
     * 批量移除指定key的缓存
     * @param name 缓存名
     * @param key 键名
     */
    void batchRemove(String name, String... key);
}
