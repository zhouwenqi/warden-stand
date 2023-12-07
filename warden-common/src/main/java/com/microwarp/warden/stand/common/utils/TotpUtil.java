package com.microwarp.warden.stand.common.utils;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigInteger;
import java.security.GeneralSecurityException;

/**
 * util - totp
 * @author zhouwenqi
 */
public class TotpUtil {
    private static final int[] DIGITS_ARRS={1,10,100,1000,10000,100000,1000000,10000000,100000000};
    private static byte[] hmacSha(String crypto, byte[] keyBytes,byte[] text){
        try{
            Mac mac = Mac.getInstance(crypto);
            SecretKey macKey = new SecretKeySpec(keyBytes,"RAW");
            mac.init(macKey);
            return mac.doFinal(text);
        }
        catch (GeneralSecurityException e){
            e.printStackTrace();
        }
        return null;
    }

    public static byte[] hexStringToBytes(String text){
        byte[] bytes = new BigInteger("10"+text,16).toByteArray();
        byte[] resultBytes = new byte[bytes.length-1];
        System.arraycopy(bytes,1,resultBytes,0,resultBytes.length);
        return resultBytes;
    }

    public static String generateTotp(String key,String time,String returnDigits,String crypto){
        int codeDigits = Integer.decode(returnDigits);
        String result = null;
        while(time.length() < 16){
            time = "0"+time;
        }
        byte[] msgBytes = hexStringToBytes(time);
        byte[] keyBytes = hexStringToBytes(key);
        byte[] bytes = hmacSha(crypto,keyBytes,msgBytes);
        int offset = bytes[bytes.length - 1] & 0xf;
        int binary = ((bytes[offset] & 0x7f) << 24) | ((bytes[offset+1] & 0xff) << 16) | ((bytes[offset+2] & 0xff) << 8) | (bytes[offset+3] & 0xff);
        int otp = binary % DIGITS_ARRS[codeDigits];
        result = Integer.toString(otp);
        while(result.length() < codeDigits){
            result = "0" + result;
        }
        return result;
    }
}
