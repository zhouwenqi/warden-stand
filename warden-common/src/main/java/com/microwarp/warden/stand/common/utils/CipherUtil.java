package com.microwarp.warden.stand.common.utils;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.StringUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.Security;

/**
 * Cipher - util
 * Created by microwarp.com on 2023/6/29.
 * @author zhouwenqi
 * @version 1.0.0
 */
public class CipherUtil {
    public static final String AESCBCNoPadding       = "AES/CBC/NoPadding";
    public static final String AESCBCPKCS5Padding    = "AES/CBC/PKCS5Padding";
    public static final String AESCBCPKCS7Padding    = "AES/CBC/PKCS7Padding";
    public static final String AESECBNoPadding       = "AES/ECB/NoPadding";
    public static final String AESECBPKCS5Padding    = "AES/ECB/PKCS5Padding";
    public static final String AESECBPKCS7Padding    = "AES/ECB/PKCS7Padding";
    public static final String DESCBCNoPadding       = "DES/CBC/NoPadding";
    public static final String DESCBCPKCS5Padding    = "DES/CBC/PKCS5Padding";
    public static final String DESCBCPKCS7Padding    = "DES/CBC/PKCS7Padding";
    public static final String DESECBNoPadding       = "DES/ECB/NoPadding";
    public static final String DESECBPKCS5Padding    = "DES/ECB/PKCS5Padding";
    public static final String DESECBPKCS7Padding    = "DES/ECB/PKCS7Padding";
    public static final String DESedeCBCNoPadding    = "DESede/CBC/NoPadding";
    public static final String DESedeCBCPKCS5Padding = "DESede/CBC/PKCS5Padding";
    public static final String RSAECBPKCS1Padding    = "RSA/ECB/PKCS1Padding";
    public static final String RSAECBOAEPWithSHA_1AndMGF1Padding      = "RSA/ECB/OAEPWithSHA-1AndMGF1Padding";
    public static final String RSAECBOAEPWithSHA_256AndMGF1Padding    = "RSA/ECB/OAEPWithSHA-256AndMGF1Padding";

    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    public static byte[] generateKey(String specType){
        try{
            KeyGenerator keyGenerator = KeyGenerator.getInstance(specType);
            keyGenerator.init(new SecureRandom());
            SecretKey secretKey = keyGenerator.generateKey();
            return secretKey.getEncoded();
        }catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return null;
    }

    public static String generateHexKey(String specType){
        byte[] keyBytes = generateKey(specType);
        return null != keyBytes ? Hex.encodeHexString(keyBytes) : null;
    }

    public static String generateDigestKey(String key, String digestType){
        if(StringUtils.isBlank(digestType)){
            digestType = "MD5";
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(digestType);
            byte[] data = messageDigest.digest(key.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < data.length; i++) {
                String part = Integer.toHexString(data[i] & 0xFF);
                if (part.length() == 1) {
                    part = "0" + part;
                }
                sb.append(part);
            }
            return sb.toString();

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }


    public static byte[] encrypt(byte[] keyBytes, byte[] ivBytes,byte[] data, String cipherStr, String specType) throws Exception {
        Cipher cipher = Cipher.getInstance(cipherStr);
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes,specType);
        if(null != ivBytes){
            IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);
            cipher.init(Cipher.ENCRYPT_MODE,secretKeySpec,ivParameterSpec);
        }else{
            cipher.init(Cipher.ENCRYPT_MODE,secretKeySpec);
        }
        return cipher.doFinal(data);
    }

    public static byte[] decrpyt(byte[] keyBytes,byte[] ivBytes,byte[] data,String cipherStr, String specType) throws Exception{
        Cipher cipher = Cipher.getInstance(cipherStr);
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, specType);
        if(null != ivBytes){
            IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);
            cipher.init(Cipher.DECRYPT_MODE,secretKeySpec,ivParameterSpec);
        }else{
            cipher.init(Cipher.DECRYPT_MODE,secretKeySpec);
        }
        return cipher.doFinal(data);
    }
}
