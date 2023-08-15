package com.microwarp.warden.stand.common.security;

/**
 * Rsa - 钥匙串
 * Created by microwarp.com on 2023/6/29.
 * @author zhouwenqi
 * @version 1.0.0
 */
public class RSAKeyPair implements IKeyPair{
    private String publicKey;
    private String privateKey;

    public RSAKeyPair(){

    }
    public RSAKeyPair(String publicKey,String privaiteKey){
        this.publicKey = publicKey;
        this.privateKey = privaiteKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }
}
