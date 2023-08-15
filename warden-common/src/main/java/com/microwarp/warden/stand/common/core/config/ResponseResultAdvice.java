package com.microwarp.warden.stand.common.core.config;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.exception.WardenRestCodeException;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.JsonUtil;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 控制器返回结果处理
 * @author zhouwenqi
 * @version 1.0.0
 */
@RestControllerAdvice
public class ResponseResultAdvice implements ResponseBodyAdvice<Object> {
    @Resource
    private WardenGlobalConfig wardenGlobalConfig;

    @Override
    public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> converterType){
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter parameter, MediaType mediaType, Class<? extends  HttpMessageConverter<?>> converterType, ServerHttpRequest request, ServerHttpResponse response) {
        if(null == body){
            return ResultModel.success();
        }
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeaders().getFirst(HttpConstants.HEADER_PACKAGE_TYPE));
        ResultModel resultModel = null;
        if(body.getClass().equals(ResultModel.class)) {
            resultModel = (ResultModel) body;
        }else if(body.getClass().equals(HashMap.class)) {
            try{
                Map map = JsonUtil.objectToObject(body,Map.class);
                Object resultObject = map.get(HttpConstants.RESULT_ADVICE_KEY);
                if(null != resultObject){
                    body = resultModel = JsonUtil.objectToObject(resultObject,ResultModel.class);
                }
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }

        if(null == resultModel && wardenGlobalConfig.getResultModelPackage()){
            resultModel = new ResultModel(ResultCode.SUCCESS);
            // 异常中带上数据
            resultModel.addData("body", body);
            return resultModel;
        }
        if(resultModel.getCode() != HttpStatus.OK.value() && !foreverOk){
            // 因为在这里不能输出自定义status，只能抛出异常修改一次
            throw new WardenRestCodeException(resultModel);
        }
        return body;
    }
}
