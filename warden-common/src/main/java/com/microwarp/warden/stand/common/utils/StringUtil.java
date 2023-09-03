package com.microwarp.warden.stand.common.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;

import java.util.UUID;

/**
 * String - util
 */
public class StringUtil {
    /**
     * 获取汉字拼音内容
     * @param text 汉字内容
     * @return 数组索引0:全拼,1:简拼
     */
    public static String[] getPinyins(String text){
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        format.setVCharType(HanyuPinyinVCharType.WITH_V);
        char[] chars = text.trim().toCharArray();
        StringBuilder qp = new StringBuilder();
        StringBuilder jp = new StringBuilder();
        try{
            for(char c:chars){
                if(Character.toString(c).matches("[\\u4e00-\\u9fa5]")){
                    String str = PinyinHelper.toHanyuPinyinStringArray(c,format)[0];
                    qp.append(str);
                    jp.append(str.charAt(0));
                }else{
                    qp.append(c);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return new String[]{qp.toString(),jp.toString()};
    }

    /**
     * 获取UUID字符串
     * @return
     */
    public static String generateGuestId(){
        String uuid = UUID.randomUUID().toString();
        try {
            return AesUtil.hexEncrypt(uuid);
        }
        catch (Exception e){
            return null;
        }
    }
}
