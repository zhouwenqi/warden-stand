package com.microwarp.warden.stand.common.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by Administrator on 2023/7/7.
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
