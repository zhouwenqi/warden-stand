package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.admin.authentication.WardenAccessDeninedHandler;
import com.microwarp.warden.stand.admin.authentication.WardenAuthenticationEntryPoint;
import com.microwarp.warden.stand.admin.authentication.WardenAuthenticationTokenFilter;
import com.microwarp.warden.stand.admin.authentication.WardenAuthenticationUserFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import javax.annotation.Resource;
import java.util.Collections;

/**
 * Configuration - Security 装配
 * @author zhouwenqi
 */
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Resource
    private WardenAdminConfig wardenAdminConfig;
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }
    @Bean
    public AuthenticationManager authenticationManager() throws Exception{
        return super.authenticationManager();
    }
    @Bean
    public WardenAuthenticationEntryPoint wardenAuthenticationEntryPoint(){
        return new WardenAuthenticationEntryPoint();
    }
    @Bean
    public WardenAuthenticationTokenFilter wardenAuthenticationTokenFilter(){
        return new WardenAuthenticationTokenFilter();
    }
    @Bean
    public WardenAuthenticationUserFilter wardenAuthenticationUserFilter() throws Exception{
        return new WardenAuthenticationUserFilter();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        httpSecurity
                .httpBasic().disable()
                .csrf().disable()
                .cors().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .authorizeRequests()
                .antMatchers("/logout").permitAll()
                .anyRequest().authenticated();
        httpSecurity.logout().logoutUrl("/login");
        httpSecurity.headers().cacheControl();
        httpSecurity.exceptionHandling().authenticationEntryPoint(wardenAuthenticationEntryPoint())
                .accessDeniedHandler(new WardenAccessDeninedHandler()).and()
                .addFilterBefore(wardenAuthenticationUserFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(wardenAuthenticationTokenFilter(), WardenAuthenticationUserFilter.class);
    }

    /**
     * 排除完全不需要检查和解析token凭据的路由
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        String faceUri = wardenAdminConfig.getFaceUri();
        if(!faceUri.endsWith("/")){
            faceUri+="/";
        }
        web.ignoring()
                .antMatchers(HttpMethod.OPTIONS)
                .antMatchers("/login")
                .antMatchers("/register")
                .antMatchers("/error")
                .antMatchers("/captcha/**")
                .antMatchers("/config/global")
                .antMatchers("/test/**")
                .mvcMatchers(faceUri+"**")
                .antMatchers("/*.ico");
    }
}
