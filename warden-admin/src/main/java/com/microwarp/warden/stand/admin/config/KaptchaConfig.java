package com.microwarp.warden.stand.admin.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * config - captcha
 * @author zhouwenqi
 */
@Configuration
public class KaptchaConfig {
    @Bean
    public DefaultKaptcha defaultKaptcha(){
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();
        /** 边框 */
        properties.setProperty("kaptcha.border","no");
        /** 边框颜色 */
        properties.setProperty("kaptcha.border.color","black");
        /** 边框线条宽度 */
        properties.setProperty("kaptcha.border.thickness","1");
        /** 图片宽度 */
        properties.setProperty("kaptcha.image.width","120");
        /** 图片高度 */
        properties.setProperty("kaptcha.image.height","60");
        /** 图片实现类 */
        properties.setProperty("kaptcha.producer.impl","com.google.code.kaptcha.impl.DefaultKaptcha");
        /** 文本实现类 */
        properties.setProperty("kaptcha.textproducer.impl","com.google.code.kaptcha.text.impl.DefaultTextCreator");
        /** 验证码生成来源集合 */
        properties.setProperty("kaptcha.textproducer.char.string","0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        /** 验证码长度 */
        properties.setProperty("kaptcha.textproducer.char.length","4");
        /** 验验证文字大小 */
        properties.setProperty("kaptcha.textproducer.font.size", "36");
        /** 验证码内容字体 */
        properties.setProperty("kaptcha.textproducer.font.names","Helvetica Neue,Helvetica,Arial,sans-serif,Apple Color Emoji,Microsoft YaHei,sans-serif,");
        /** 验证码内容颜色 */
        properties.setProperty("kaptcha.textproducer.font.color","30,190,26");
        /** 验证码文字间距 */
        properties.setProperty("kaptcha.textproducer.char.space","4");
        /** 干扰实现类 */
        properties.setProperty("kaptcha.noise.impl","com.google.code.kaptcha.impl.DefaultNoise");
        /** 干扰内容颜色 */
        properties.setProperty("kaptcha.noise.color","59,59,59");
        /** 干扰效果 */
        properties.setProperty("kaptcha.obscurificator.impl","com.google.code.kaptcha.impl.WaterRipple");

        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}
