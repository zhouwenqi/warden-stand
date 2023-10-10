package com.microwarp.warden.stand.common.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * 判断当前response状态码包装类型
 * @author zhouwenqi
 */
public class ResultUtil {
    public static boolean ResponseForeverOk = false;
    public static boolean isForeverOk(String packageType) {
        boolean foreverOk = ResponseForeverOk;
        if (!StringUtils.isBlank(packageType)) {
            foreverOk = packageType.toLowerCase().equals("ok");
        }
        return foreverOk;
    }
}
