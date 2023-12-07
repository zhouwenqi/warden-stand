package com.microwarp.warden.stand.common.utils;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.StringUtils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * google authenticator 验证器工具
 * @author zhouwenqi
 *
 */
public class GoogleAuthUtil {
    // 时间偏移窗口
    private static int WINDOW_OFFSET = 0;
    // 加密方式
    private static final String CRYPTO = "HmacSHA1";

    /**
     * 随机生成独立密钥
     * @return 密钥
     */
    public static String getSecretKey(){
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[10];

        random.nextBytes(bytes);
        Base32 base32 = new Base32();
        return base32.encodeToString(bytes).toUpperCase();
    }

    /**
     * 生成二维码内容
     * @param secretKey 密钥
     * @param account 帐号
     * @param issuer 发行商
     * @return 二维码内容
     */
    public static String getQrCodeContent(String secretKey, String account,String issuer){
        String baseKey = secretKey.replace(" ","").toUpperCase();
        StringBuilder stringBuilder = new StringBuilder("otpauth://totp/");
        if(StringUtils.isNotBlank(issuer)) {
            stringBuilder.append(encode(issuer + ":"));
        }
        stringBuilder.append(encode(account));
        stringBuilder.append("?secret=");
        stringBuilder.append(encode(baseKey));
        if(StringUtils.isNotBlank(issuer)) {
            stringBuilder.append("&issuer=");
            stringBuilder.append(encode(issuer));
        }
        return stringBuilder.toString();
    }

    /**
     * 生成验证码
     * @param secretKey 密钥
     * @return 验证码
     */
    public static String getCode(String secretKey){
        String baseKey = secretKey.replace(" ","").toUpperCase();
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(baseKey);
        String hexKey = Hex.encodeHexString(bytes);
        long time = (System.currentTimeMillis() / 1000) / 30;
        String hexTime = Long.toHexString(time);
        return TotpUtil.generateTotp(hexKey,hexTime,"6",CRYPTO);
    }

    public static boolean check(String secret,long code,long time){
        Base32 base32 = new Base32();
        byte[] decodeKey = base32.decode(secret);
        // 每30秒变一下
        long t = (time / 1000L) / 30L;
        long hash;
        for(int i = -WINDOW_OFFSET;i<=WINDOW_OFFSET;++i){
            try {
                hash = getOffset(decodeKey, t + i);
            }
            catch (Exception e){
                return false;
            }
            if(hash == code){
                return true;
            }
        }
        return false;
    }

    /**
     * 根据时间偏移量计量
     * @param key 密钥
     * @param t 时间
     * @return
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     */
    public static long getOffset(byte[] key,long t) throws NoSuchAlgorithmException,InvalidKeyException {
        byte[] data = new byte[8];
        long value = t;
        for(int i=8;i-->0;value >>>= 8){
            data[i] = (byte)value;
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(key,CRYPTO);
        Mac mac = Mac.getInstance(CRYPTO);
        mac.init(secretKeySpec);
        byte[] bytes = mac.doFinal(data);
        int offset = bytes[20-1] & 0xF;
        long hash = 0;
        for(int i=0;i<4;++i){
            hash <<=8;
            hash |= (bytes[offset + i] & 0xFF);
        }
        hash &= 0x7FFFFFFF;
        hash %= 1000000;
        return hash;
    }


    public static String encode(String content){
        try{
            return URLEncoder.encode(content,"UTF-8").replace("+","%20");
        }catch (UnsupportedEncodingException e){

        }
        return "";
    }
}
