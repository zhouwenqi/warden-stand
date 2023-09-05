package com.microwarp.warden.stand.admin.utils;

/**
 * util - image
 * @author zhouwenqi
 */
public class ImageUtil {
    public static final String[] IMAGE_EXTENSION = {"png","gif","jpg","jpeg","bmp"};
    public static final String[] IMAGE_TYPE = {"image/jpeg","image/jpg","image/png","image/gif","image/bmp"};
    /**
     * 通过图片byte获取扩展名
     * @param imageByte
     * @return
     */
    public static String getExtendName(byte[] imageByte)
    {
        String strFileExtendName = "";
        if ((imageByte[0] == 71) && (imageByte[1] == 73) && (imageByte[2] == 70) && (imageByte[3] == 56)
                && ((imageByte[4] == 55) || (imageByte[4] == 57)) && (imageByte[5] == 97))
        {
            strFileExtendName = "gif";
        }
        else if ((imageByte[6] == 74) && (imageByte[7] == 70) && (imageByte[8] == 73) && (imageByte[9] == 70))
        {
            strFileExtendName = "jpg";
        }
        else if ((imageByte[0] == 66) && (imageByte[1] == 77))
        {
            strFileExtendName = "bmp";
        }
        else if ((imageByte[1] == 80) && (imageByte[2] == 78) && (imageByte[3] == 71))
        {
            strFileExtendName = "png";
        }
        return strFileExtendName;
    }

    /**
     * 根据图片类型获取扩展名
     * @param imageType 图片类型
     * @return
     */
    public static String getExtendName(String imageType){
        String extendName = "";
        switch (imageType.toLowerCase()){
            case "image/jpeg":
                extendName = "jpeg";
                break;
            case "image/jpg":
                extendName = "jpg";
                break;
            case "image/png":
                extendName = "png";
                break;
            case "image/gif":
                extendName = "gif";
                break;
            case "image/bmp":
                extendName = "bmp";
                break;
        }
        return extendName;

    }
}
