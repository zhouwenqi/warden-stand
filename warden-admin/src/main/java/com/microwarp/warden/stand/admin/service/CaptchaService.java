package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.common.core.cache.ICaptchaService;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.utils.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * service - captcha
 * @author zhouwenqi
 */
@Service
public class CaptchaService implements ICaptchaService {
    private static final Logger logger = LoggerFactory.getLogger(CaptchaService.class);
    @Autowired
    private EhcacheService ehcacheService;
    /**
     * 保存验证码信息
     * @param code 验证码
     */
    public void save(String code){
        String guestId = WebUtil.getGuestId();
        if(StringUtils.isBlank(guestId)){
            throw new WardenRequireParamterException("缺少Guest-Id参数");
        }
        ehcacheService.save(CacheConstants.CACHE_CAPTCHA,guestId,code);
    }

    /**
     * 校验验证码信息
     * @param code 验证码
     * @return
     */
    public boolean verify(String code){
        String guestId = WebUtil.getGuestId();
        if(StringUtils.isBlank(guestId)){
            logger.warn("验证码校验失败：没有传Guest-Id");
            return false;
        }
        Object codeObject = ehcacheService.get(CacheConstants.CACHE_CAPTCHA,guestId);
        if(null == codeObject){
            return false;
        }
        return codeObject.toString().toLowerCase().equals(code.toLowerCase());
    }
}
