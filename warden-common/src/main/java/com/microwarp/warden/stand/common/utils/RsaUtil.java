package com.microwarp.warden.stand.common.utils;
import com.microwarp.warden.stand.common.security.IKeyPair;
import com.microwarp.warden.stand.common.security.RSAKeyPair;
import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * RSA - util
 * Created by microwarp.com on 2023/6/29.
 * @author zhouwenqi
 * @version 1.0.0
 */
public class RsaUtil {
    public static String DEFAULT_PRIVATE_KEY;
    public static String DEFAULT_PUBLIC_KEY;
    public static void  init(IKeyPair iKeyPair){
        DEFAULT_PRIVATE_KEY = iKeyPair.getPrivateKey();
        DEFAULT_PUBLIC_KEY = iKeyPair.getPublicKey();
    }
    /**
     *
     * @param keySize 钥匙大小
     * @param algorithm 算法
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static RSAKeyPair generateKeyPair(int keySize, String algorithm) throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(algorithm);
        keyPairGenerator.initialize(keySize);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        RSAPublicKey rsaPublicKey = (RSAPublicKey)keyPair.getPublic();
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey)keyPair.getPrivate();
        String publicKeyString = Base64.encodeBase64String(rsaPublicKey.getEncoded());
        String privateKeyString = Base64.encodeBase64String(rsaPrivateKey.getEncoded());
        return new RSAKeyPair(publicKeyString,privateKeyString);
    }

    /**
     * 生成一个RSA钥匙串(默认大小:1024，算法：RSA)
     * @return RSA钥匙串
     * @throws NoSuchAlgorithmException
     */
    public static RSAKeyPair generateKeyPair() throws NoSuchAlgorithmException {
        return generateKeyPair(1024,"RSA");
    }

    /**
     * 私钥加密(默认私钥)
     * @param content 需要被加密的内容
     * @return 加密后的内容
     * @throws Exception
     */
    public static String privateKeyEncrypt(String content) throws Exception {
        return privateKeyEncrypt(DEFAULT_PRIVATE_KEY,content);
    }

    /**
     * 私钥加密
     * @param key 私钥串
     * @param content 需要被加密的内容
     * @return 加密后的内容
     * @throws Exception
     */
    public static String privateKeyEncrypt(String key,String content) throws Exception {
        byte[] data = privateKeyEncryptData(key,content);
        return Base64.encodeBase64String(data);
    }

    /**
     * 私钥加密(默认私钥)
     * @param content 需要被加密的内容
     * @return 加密后的内容(url安全)
     * @throws Exception
     */
    public static String privateKeyEncryptURL(String content) throws Exception {
        return privateKeyEncryptURL(DEFAULT_PRIVATE_KEY,content);
    }

    /**
     * 私钥加密
     * @param key 私钥串
     * @param content 需要被加密的内容
     * @return 加密后的内容(url安全)
     * @throws Exception
     */
    public static String privateKeyEncryptURL(String key,String content) throws Exception {
        byte[] data = privateKeyEncryptData(key,content);
        return Base64.encodeBase64URLSafeString(data);
    }

    /**
     * 私钥加密(默认私钥)
     * @param content 需要被加密的内容
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] privateKeyEncryptData(String content) throws Exception {
        return privateKeyEncryptData(DEFAULT_PRIVATE_KEY,content);
    }

    /**
     * 私钥加密
     * @param key 私钥串
     * @param content 需要被加密的内容
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] privateKeyEncryptData(String key,String content) throws Exception {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(key));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE,privateKey);
        return cipher.doFinal(content.getBytes());
    }

    /**
     * 私钥解密(默认私钥)
     * @param content 加密内容
     * @return 解密后的内容
     * @throws Exception
     */
    public static String privateKeyDecrypt(String content) throws Exception {
        return privateKeyDecrypt(DEFAULT_PRIVATE_KEY,content);
    }

    /**
     * 私钥解密
     * @param key 私钥串
     * @param content 加密内容
     * @return 解密后的内容
     * @throws Exception
     */
    public static String privateKeyDecrypt(String key,String content) throws Exception {
        byte[] data = Base64.decodeBase64(content);
        byte[] result = privateKeyDecryptData(key,data);
        return new String(result);
    }

    /**
     * 私钥解密(默认私钥)
     * @param data 加密数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] privateKeyDecryptData(byte[] data) throws Exception {
        return privateKeyDecryptData(DEFAULT_PRIVATE_KEY,data);
    }

    /**
     * 私钥解密
     * @param key 私钥串
     * @param data 加密数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] privateKeyDecryptData(String key, byte[] data) throws Exception {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(key));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE,privateKey);
        return cipher.doFinal(data);
    }

    /**
     * 公钥加密(默认公钥)
     * @param context 需要被加密的内容
     * @return 加密后的内容
     * @throws Exception
     */
    public static String publicKeyEncrypt(String context) throws Exception {
        return publicKeyEncrypt(DEFAULT_PUBLIC_KEY,context);
    }

    /**
     * 公钥加密
     * @param key 公钥串
     * @param context 需要被加密的内容
     * @return 加密后的内容
     * @throws Exception
     */
    public static String publicKeyEncrypt(String key, String context) throws Exception {
        byte[] data = publicKeyEncryptData(key,context);
        return Base64.encodeBase64String(data);
    }

    /**
     * 公钥加密(默认公钥)
     * @param context 需要被加密的内容
     * @return 加密后的内容(url安全)
     * @throws Exception
     */
    public static String publicKeyEncryptURL(String context) throws Exception {
        return publicKeyEncryptURL(DEFAULT_PUBLIC_KEY,context);
    }

    /**
     * 公钥加密
     * @param key 公钥串
     * @param context 需要被加密的内容
     * @return 加密后的内容(url安全)
     * @throws Exception
     */
    public static String publicKeyEncryptURL(String key, String context) throws Exception {
        byte[] data = publicKeyEncryptData(key,context);
        return Base64.encodeBase64URLSafeString(data);
    }

    /**
     * 公钥加密(默认公钥)
     * @param context 需要被加密的内容
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] publicKeyEncryptData(String context) throws Exception {
        return publicKeyEncryptData(DEFAULT_PUBLIC_KEY,context);
    }

    /**
     * 公钥加密
     * @param key 公钥串
     * @param context 需要被加密的内容
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] publicKeyEncryptData(String key, String context) throws Exception {
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(key));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE,publicKey);
        return cipher.doFinal(context.getBytes());
    }

    /**
     * 公钥解密(默认公钥)
     * @param context 加密内容
     * @return 解密后的内容
     * @throws Exception
     */
    public static String publicKeyDecrypt(String context) throws Exception {
        return publicKeyDecrypt(DEFAULT_PUBLIC_KEY,context);
    }

    /**
     * 公钥解密
     * @param key 公钥串
     * @param context 加密内容
     * @return 解密后的内容
     * @throws Exception
     */
    public static String publicKeyDecrypt(String key, String context) throws Exception {
        byte[] data = Base64.decodeBase64(context);
        byte[] result = publicKeyDecryptData(key,data);
        return new String(result);
    }

    /**
     * 公钥解密(默认公钥)
     * @param data 加密数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] publicKeyDecryptData(byte[] data) throws Exception {
        return publicKeyDecryptData(DEFAULT_PUBLIC_KEY,data);
    }

    /**
     * 公钥解密
     * @param key 公钥串
     * @param data 加密数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] publicKeyDecryptData(String key, byte[] data) throws Exception {
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(key));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        return cipher.doFinal(data);
    }
}
