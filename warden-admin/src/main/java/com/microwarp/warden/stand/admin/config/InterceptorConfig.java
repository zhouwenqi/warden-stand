package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.common.core.interceptor.RepeatedRequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

/**
 * Configuration - 过滤器注入
 * @author zhouwenqi
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Resource
    private WardenAdminConfig wardenAdminConfig;
    @Bean
    public RepeatedRequestInterceptor repeatedRequestInterceptor(){
        return new RepeatedRequestInterceptor();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry resourceHandlerRegistry){
        String path = wardenAdminConfig.getFaceUploadDir();
        String uri = wardenAdminConfig.getFaceUri();
        if(!path.endsWith("/")){
            path += "/";
        }
        if(!uri.endsWith("/")){
            uri+="/";
        }
        resourceHandlerRegistry.addResourceHandler(uri+"**").addResourceLocations("file:"+path);
    }



    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(repeatedRequestInterceptor()).addPathPatterns("/profile**");
    }
//
//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/**")
//                .allowedOriginPatterns("*")
//                .allowCredentials(true)
//                .allowedMethods("*")
//                .maxAge(3600)
//                .allowedHeaders("*");
//    }
}
