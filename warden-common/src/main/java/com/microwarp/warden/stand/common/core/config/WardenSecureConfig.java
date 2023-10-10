package com.microwarp.warden.stand.common.core.config;

import com.microwarp.warden.stand.common.utils.AesUtil;
import com.microwarp.warden.stand.common.utils.DesUitl;
import com.microwarp.warden.stand.common.utils.JwtUtil;
import com.microwarp.warden.stand.common.utils.RsaUtil;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Warden - 安全配置
 * @author zhouwenqi
 * @version 1.0.0
 */
@Configuration
@ConfigurationProperties(prefix = "warden.secure")
public class WardenSecureConfig {
    /** Rsa公钥 */
    private String rsaPublicKey;
    /** Rsa私钥 */
    private String rsaPrivateKey;
    /** Aes密钥 */
    private String aesKey;
    /** Des密钥 */
    private String desKey;
    /** Des张量 */
    private String desIv;

    private String jwtSignature = "aes";

    public String getRsaPublicKey() {
        return rsaPublicKey;
    }

    public void setRsaPublicKey(String rsaPublicKey) {
        this.rsaPublicKey = rsaPublicKey;
        RsaUtil.DEFAULT_PUBLIC_KEY = rsaPublicKey;
    }

    public String getRsaPrivateKey() {
        return rsaPrivateKey;
    }

    public void setRsaPrivateKey(String rsaPrivateKey) {
        this.rsaPrivateKey = rsaPrivateKey;
        RsaUtil.DEFAULT_PRIVATE_KEY = rsaPrivateKey;
    }

    public String getAesKey() {
        return aesKey;
    }

    public void setAesKey(String aesKey) {
        this.aesKey = aesKey;
        AesUtil.DEFAULT_KEY = aesKey;
    }

    public String getDesKey() {
        return desKey;
    }

    public void setDesKey(String desKey) {
        this.desKey = desKey;
        DesUitl.DEFAULT_KEY = desKey;
    }

    public String getDesIv() {
        return desIv;
    }

    public void setDesIv(String desIv) {
        this.desIv = desIv;
        DesUitl.DEFAULT_IV = desIv;
    }

    public String getJwtSignature() {
        return jwtSignature;
    }

    public void setJwtSignature(String jwtSignature) {
        this.jwtSignature = jwtSignature;
        switch (jwtSignature.toLowerCase()){
            case "aes":
                JwtUtil.DEFAULT_SIGN_ALGORITHM = SignatureAlgorithm.HS256;
                break;
            case "rsa":
                JwtUtil.DEFAULT_SIGN_ALGORITHM = SignatureAlgorithm.RS256;
                break;
        }
    }
}
