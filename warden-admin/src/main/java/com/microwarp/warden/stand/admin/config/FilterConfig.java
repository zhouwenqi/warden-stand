package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.admin.filter.GuestFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;

/**
 * config - filter
 */
@Configuration
public class FilterConfig {
    @Bean
    public FilterRegistrationBean filterRegistrationBean(){
        FilterRegistrationBean<Filter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new GuestFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setName("guestFilter");
        registrationBean.setOrder(1);
        return  registrationBean;
    }
}
