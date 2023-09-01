package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.common.security.RSAKeyPair;
import com.microwarp.warden.stand.common.utils.AesUitl;
import com.microwarp.warden.stand.common.utils.RsaUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * config - warden管理后台配置
 * @author zhouwenqi
 */
@Configuration
@ConfigurationProperties(prefix = "warden.admin")
public class WardenAdminConfig {
    private static final Logger logger = LoggerFactory.getLogger(WardenAdminConfig.class);
    /** 如果没有设置AES密钥，将自动生成 */
    private Boolean autoGenerateKeyAes = true;
    /** 如果没有设置RSA公私密钥，将自动生成 */
    private Boolean autoGenerateKeyRsa = true;

    public Boolean getAutoGenerateKeyAes() {
        return autoGenerateKeyAes;
    }

    public void setAutoGenerateKeyAes(Boolean autoGenerateKeyAes) {
        this.autoGenerateKeyAes = autoGenerateKeyAes;
        if(autoGenerateKeyAes && StringUtils.isBlank(AesUitl.DEFAULT_KEY)){
            AesUitl.DEFAULT_KEY = AesUitl.generateKey();
        }
    }

    public Boolean getAutoGenerateKeyRsa() {
        return autoGenerateKeyRsa;
    }

    public void setAutoGenerateKeyRsa(Boolean autoGenerateKeyRsa) {
        this.autoGenerateKeyRsa = autoGenerateKeyRsa;
        if(autoGenerateKeyRsa && (StringUtils.isBlank(RsaUtil.DEFAULT_PUBLIC_KEY) || StringUtils.isBlank(RsaUtil.DEFAULT_PRIVATE_KEY))){
            try {
                RSAKeyPair keyPair = RsaUtil.generateKeyPair();
                RsaUtil.DEFAULT_PUBLIC_KEY = keyPair.getPublicKey();
                RsaUtil.DEFAULT_PRIVATE_KEY = keyPair.getPrivateKey();
            }
            catch (Exception e){
                logger.warn("生成RSA密钥失败:{}",e.getMessage());
            }
        }
    }
}
