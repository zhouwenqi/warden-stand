package com.microwarp.warden.stand.admin.listeners;

import org.ehcache.event.CacheEvent;
import org.ehcache.event.CacheEventListener;
import org.ehcache.event.EventType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 2023/8/22.
 */
public class EhcacheEventListener implements CacheEventListener<Object,Object> {
    private static final Logger logger = LoggerFactory.getLogger(EhcacheEventListener.class);
    @Override
    public void onEvent(CacheEvent cacheEvent){
        if(cacheEvent.getType().equals(EventType.REMOVED)){

        }
        logger.info(" caching event {} {} {} {}",cacheEvent.getType(),cacheEvent.getKey(),cacheEvent.getOldValue(),cacheEvent.getNewValue());
    }
}
