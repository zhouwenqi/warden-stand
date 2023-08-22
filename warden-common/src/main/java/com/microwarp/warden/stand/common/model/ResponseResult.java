package com.microwarp.warden.stand.common.model;

import com.microwarp.warden.stand.common.utils.JsonUtil;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;

/**
 * warden统一输出数据模型
 * @author zhouwenqi
 */
public class ResponseResult {
    public static void output(ResultModel resultModel, HttpServletResponse response, boolean foreverOk){
        response.reset();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        int statusCode = foreverOk ? HttpStatus.OK.value() : resultModel.getCode();
        response.setStatus(statusCode);
        String data = JsonUtil.objectToJson(resultModel);
        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(data.getBytes("utf-8"));
            outputStream.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void print(ResultModel resultModel, HttpServletResponse response, boolean foreverOk){
        response.reset();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        int statusCode = foreverOk ? HttpStatus.OK.value() : resultModel.getCode();
        response.setStatus(statusCode);
        String data = JsonUtil.objectToJson(resultModel);
        try {
            response.getWriter().println(data);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
