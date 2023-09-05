package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.common.core.interceptor.WardenBodyInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
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
    public WardenBodyInterceptor wardenBodyInterceptor(){
        return new WardenBodyInterceptor();
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
//        registry.addInterceptor(wardenBodyInterceptor()).addPathPatterns("/**");
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
