package com.microwarp.warden.stand.admin.aspect;

import com.microwarp.warden.stand.common.core.annotation.CacheBatchEvict;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import org.apache.xmlbeans.impl.jam.mutable.MElement;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2023/8/22.
 */
@Aspect
@Component
public class CacheRemoveAspect {
    @Resource
    private  ICacheService iCacheService;
    @Pointcut("@annotation(com.microwarp.warden.stand.common.core.annotation.CacheBatchEvict)")
    public void pointcut(){

    }

    @Around("pointcut()")
    public Object proceed(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
        try {
            CacheBatchEvict cacheBatchEvict = methodSignature.getMethod().getAnnotation(CacheBatchEvict.class);
            String cacheName = cacheBatchEvict.value();
            iCacheService.batchRemove(cacheName, cacheBatchEvict.key());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return joinPoint.proceed();
    }
}
