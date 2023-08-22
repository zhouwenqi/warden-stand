package com.microwarp.warden.stand.admin.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2023/8/22.
 */
@Component
public class SpringUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;
    private static MessageSource messageSource;
    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        if(null == applicationContext) {
            applicationContext = context;
        }
        if(null == messageSource){
            messageSource = getBean(MessageSource.class);
        }
    }

    public static <T> T getBean(Class<T> tClass){
        return applicationContext.getBean(tClass);
    }
    public static <T> T getBean(String name, Class<T> type){
        return applicationContext.getBean(name,type);
    }
    public static String getMessage(String code,String... object){
        return messageSource.getMessage(code,object, LocaleContextHolder.getLocale());
    }
}
