package com.microwarp.warden.stand.common.core.cache;

/**
 * service - cache
 *
 */
public interface ICacheService {
    /**
     * 批量移除指定key的缓存
     * @param name 缓存名
     * @param keys 键名
     */
    void batchRemove(String name, String... keys);

    /**
     * 保存缓存内容
     * @param cacheName 缓存名
     * @param key 键名
     * @param t 缓存内容
     */
    <T> void save(String cacheName, String key, T t);

    /**
     * 获取指定的缓存内容
     * @param cacheName 缓存名
     * @param key 键名
     * @return 缓存内容
     */
    <T> T get(String cacheName,String key);
}
