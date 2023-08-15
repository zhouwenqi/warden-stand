package com.microwarp.warden.stand.common.utils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.StringUtils;

/**
 * AES - util
 * Created by microwarp.com on 2023/6/29.
 * @author zhouwenqi
 * @version 1.0.0
 */
public class AesUitl {
    // 默认密钥
    public static String DEFAULT_KEY = null;
    // 默认向量
    public static String DEFAULT_IV = null;
    // 默认Cipher
    public static String DEFAULT_CIPHER = CipherUtil.AESECBPKCS5Padding;
    public static final String SPEC_TYPE = "AES";

    public static void init(String keyStr,String ivStr){
        DEFAULT_KEY = keyStr;
        DEFAULT_IV = ivStr;
    }

    public static void init(String keyStr,String ivStr,String cipherStr){
        DEFAULT_KEY = keyStr;
        DEFAULT_IV = ivStr;
        DEFAULT_CIPHER = cipherStr;
    }

    /**
     * 生成密钥
     * @return
     */
    public static byte[] generateBytesKey(){
        return CipherUtil.generateKey(SPEC_TYPE);
    }

    /**
     * 生成密钥
     * @return
     */
    public static String generateKey(){
        byte[] keyBytes = generateBytesKey();
        return null != keyBytes ? Hex.encodeHexString(keyBytes) : null;
    }

    /**
     * 哈希生成key
     * @param key 字符串
     * @param digestType 哈希类型
     * @return
     */
    public static String generateHashKey(String key, String digestType){
        return  CipherUtil.generateDigestKey(key,digestType);
    }

    /**
     * 哈希生成key
     * @param key 字符串
     * @return
     */
    public static String generateHashKey(String key){
        return generateHashKey(key,null);
    }

    /**
     * 加密数据
     * @param keyBytes 密钥数据
     * @param ivBytes 向量数据
     * @param data 待加密的数据
     * @param cipherStr 加密方式
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] keyBytes,byte[] ivBytes,byte[] data,String cipherStr) throws Exception {
        return CipherUtil.encrypt(keyBytes,ivBytes,data,cipherStr,SPEC_TYPE);
    }

    /**
     * 加密数据
     * @param keyBytes 密钥数据
     * @param data 待加密的数据
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] keyBytes,byte[] data) throws Exception {
        byte[] ivBytes = StringUtils.isNoneBlank(DEFAULT_IV) ? DEFAULT_IV.getBytes() : null;
        return encrypt(keyBytes,ivBytes,data, DEFAULT_CIPHER);
    }

    /**
     * 加密数据
     * @param data 待加密的数据
     * @return 加密后的数据
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data) throws Exception {
        byte[] keyBytes = DEFAULT_KEY.getBytes();
        return encrypt(keyBytes,data);
    }

    /**
     * 解密数据
     * @param keyBytes 密钥数据
     * @param ivBytes 向量数据
     * @param data 待解密的数据
     * @param cipherStr 解密方式
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] decrpyt(byte[] keyBytes,byte[] ivBytes,byte[] data,String cipherStr) throws Exception{
        return CipherUtil.decrpyt(keyBytes,ivBytes,data,cipherStr,SPEC_TYPE);
    }

    /**
     * 解密数据
     * @param keyBytes 密钥数据
     * @param data 待解密的数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] decrpyt(byte[] keyBytes, byte[] data) throws Exception{
        byte[] ivBytes = StringUtils.isNoneBlank(DEFAULT_IV) ? DEFAULT_IV.getBytes() : null;
        return decrpyt(keyBytes,ivBytes,data,DEFAULT_CIPHER);
    }

    /**
     * 解密数据
     * @param data 待解密的数据
     * @return 解密后的数据
     * @throws Exception
     */
    public static byte[] decrpyt(byte[] data) throws Exception{
        byte[] keyBytes = DEFAULT_KEY.getBytes();
        return decrpyt(keyBytes,data);
    }

    /**
     * 加密后的16进制数据
     * @param key 密钥字符串
     * @param iv 向量字符串
     * @param content 待加密的字符串
     * @param cipherStr 加密方式
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String hexEncrypt(String key,String iv,String content,String cipherStr) throws Exception {
        byte[] keyBytes = key.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(iv) ? iv.getBytes() : null;
        byte[] bytes = encrypt(keyBytes,ivBytes,content.getBytes(),cipherStr);
        return Hex.encodeHexString(bytes);
    }

    /**
     * 加密后的16进制数据
     * @param key 密钥字符串
     * @param content 待加密的字符串
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String hexEncrypt(String key,String content) throws Exception {
        return hexEncrypt(key,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 解密16进制数据
     * @param key 密钥字符串
     * @param iv 向量字符串
     * @param content 待解密的字符串
     * @param cipherStr 解密方式
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String hexDecrypt(String key,String iv,String content,String cipherStr) throws Exception{
        byte[] keyBytes = key.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(iv) ? iv.getBytes() : null;
        byte[] bytes = decrpyt(keyBytes,ivBytes,Hex.decodeHex(content),cipherStr);
        return new String(bytes);
    }

    /**
     * 解密16进制数据
     * @param key 密钥字符串
     * @param content 待解密的字符串
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String hexDecrypt(String key,String content) throws Exception{
        return hexDecrypt(key,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 加密Bas64字符串
     * @param key 密钥字符串
     * @param iv 向量字符串
     * @param content 待加密的字符串
     * @param cipherStr 加密方式
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String base64Encrypt(String key,String iv,String content,String cipherStr) throws Exception {
        byte[] keyBytes = key.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(iv) ? iv.getBytes() : null;
        byte[] bytes = encrypt(keyBytes,ivBytes,content.getBytes(),cipherStr);
        return Base64.encodeBase64URLSafeString(bytes);
    }

    /**
     * 加密Bas64字符串
     * @param key 密钥字符串
     * @param content 待加密的字符串
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String base64Encrypt(String key,String content) throws Exception {
        return base64Encrypt(key,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 解密Bas64字符串
     * @param key 密钥字符串
     * @param iv 向量字符串
     * @param content 待解密的字符串
     * @param cipherStr 解密方式
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String base64Decrypt(String key,String iv,String content,String cipherStr) throws Exception {
        byte[] keyBytes = key.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(iv) ? iv.getBytes() : null;
        byte[] bytes = decrpyt(keyBytes,ivBytes, Base64.decodeBase64(content),cipherStr);
        return new String(bytes);
    }

    /**
     * 解密Bas64字符串
     * @param key 密钥字符串
     * @param content 待解密的字符串
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String base64Decrypt(String key,String content) throws Exception {
        return base64Decrypt(key,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 加密后的16进制数据
     * @param content 待加密的字符串
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String hexEncrypt(String content) throws Exception {
        if(StringUtils.isBlank(content)){
            return null;
        }
        return hexEncrypt(DEFAULT_KEY,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 解密16进制数据
     * @param content 待解密的字符串
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String hexDecrypt(String content) throws Exception{
        return hexDecrypt(DEFAULT_KEY,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 加密Bas64字符串
     * @param content 待加密的字符串
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String base64Encrypt(String content) throws Exception {
        return base64Encrypt(DEFAULT_KEY,DEFAULT_IV,content,DEFAULT_CIPHER);
    }

    /**
     * 加密Bas64字符串(URL安全)
     * @param content 待加密的字符串
     * @return 加密后的字符串
     * @throws Exception
     */
    public static String base64EncryptURLSafe(String content) throws Exception {
        if(StringUtils.isBlank(content)){
            return null;
        }
        byte[] keyBytes = DEFAULT_KEY.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(DEFAULT_IV) ? DEFAULT_IV.getBytes() : null;
        byte[] bytes = encrypt(keyBytes,ivBytes,content.getBytes(),DEFAULT_CIPHER);
        return Base64.encodeBase64URLSafeString(bytes);
    }

    /**
     * 解密Bas64字符串
     * @param content 待解密的字符串
     * @return 解密后的字符串
     * @throws Exception
     */
    public static String base64Decrypt(String content) throws Exception {
        byte[] keyBytes = DEFAULT_KEY.getBytes();
        byte[] ivBytes = StringUtils.isNoneBlank(DEFAULT_IV) ? DEFAULT_IV.getBytes() : null;
        byte[] bytes = decrpyt(keyBytes,ivBytes,Base64.decodeBase64(content),DEFAULT_CIPHER);
        return new String(bytes);
    }
}
