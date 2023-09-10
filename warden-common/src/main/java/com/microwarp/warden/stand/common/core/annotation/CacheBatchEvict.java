package com.microwarp.warden.stand.common.core.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * annotation - 批量删除缓存
 * @author zhouwenqi
 */
@Target({ java.lang.annotation.ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface CacheBatchEvict {
    String value();
    String[] key();
}
