package com.microwarp.warden.stand.admin.config;

import com.microwarp.warden.stand.common.security.RSAKeyPair;
import com.microwarp.warden.stand.common.utils.AesUtil;
import com.microwarp.warden.stand.common.utils.RsaUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

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
    /** 用户头像存放本地路径 */
    private String faceUploadDir;
    /** 头像访问映射路径 */
    private String faceUri;

    public Boolean getAutoGenerateKeyAes() {
        return autoGenerateKeyAes;
    }

    public void setAutoGenerateKeyAes(Boolean autoGenerateKeyAes) {
        this.autoGenerateKeyAes = autoGenerateKeyAes;
        if(autoGenerateKeyAes && StringUtils.isBlank(AesUtil.DEFAULT_KEY)){
            AesUtil.DEFAULT_KEY = AesUtil.generateKey();
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

    public static Logger getLogger() {
        return logger;
    }

    public String getFaceUploadDir() {
        return faceUploadDir;
    }

    public void setFaceUploadDir(String faceUploadDir) {
        this.faceUploadDir = faceUploadDir;
    }

    public String getFaceUri() {
        return faceUri;
    }

    public void setFaceUri(String faceUri) {
        this.faceUri = faceUri;
    }
}
