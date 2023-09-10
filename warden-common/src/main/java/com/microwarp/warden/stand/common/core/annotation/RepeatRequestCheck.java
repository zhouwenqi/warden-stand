package com.microwarp.warden.stand.common.core.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * annotation - 重复提交数据检查
 * Created by Administrator on 6/9/2023.
 */
@Target({ java.lang.annotation.ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface RepeatRequestCheck {
    /** 此时间间隔内禁止提交重复数据（单位：毫秒）*/
    int interval() default 5000;
    /** 隔离用户校验 */
    boolean userSeparate() default true;
}
