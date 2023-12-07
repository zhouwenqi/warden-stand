package com.microwarp.warden.stand.common.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

/**
 * util - 二维码工具
 * @author zhouwenqi
 */
public class QrCodeUtil {

    private static final Map<EncodeHintType,Object> hints = new HashMap<>();
    static {
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        hints.put(EncodeHintType.MARGIN,2);
    }
    public static BufferedImage toBufferedImage(String content, int width, int height) throws WriterException,IOException {
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE,width,height, hints);
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }
    public static void writeToStream(String content, OutputStream stream,int width, int height) throws WriterException,IOException {
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE,width,height, hints);
        MatrixToImageWriter.writeToStream(bitMatrix,"png",stream);
    }
}
