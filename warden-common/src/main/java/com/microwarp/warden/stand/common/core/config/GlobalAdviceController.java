package com.microwarp.warden.stand.common.core.config;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.exception.WardenException;
import com.microwarp.warden.stand.common.exception.WardenRestCodeException;
import com.microwarp.warden.stand.common.model.ResponseResult;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultError;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.yaml.snakeyaml.constructor.DuplicateKeyException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 控制器异常处理
 * @author zhouwenqi
 * @version 1.0.0
 */
@ControllerAdvice
public class GlobalAdviceController {
    @ExceptionHandler(WardenException.class)
    public void wardenExceptionHandler(WardenException exception, HttpServletRequest request, HttpServletResponse response){
        ResultModel resultModel = exception.getResultModel();
        System.out.println("WardenException:"+resultModel.getMsg());
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    /**
     * 需要重置状态码包装
     * @param exception
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(WardenRestCodeException.class)
    public void wardenRestCodeExceptionHandler(WardenRestCodeException exception, HttpServletRequest request, HttpServletResponse response){
        ResultModel resultModel = exception.getResultModel();
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    @ExceptionHandler(Exception.class)
    public void exceptionHandler(Exception exception, HttpServletRequest request, HttpServletResponse response){
        System.out.println("type:"+exception.getClass());
        ResultModel resultModel = new ResultModel(ResultCode.ERROR,exception.getMessage());
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    /**
     * body数据为空异常重新包装
     * @param exception
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public void httpMessageNotReadableExceptionHandler(HttpMessageNotReadableException exception, HttpServletRequest request, HttpServletResponse response){
        ResultModel resultModel = new ResultModel(ResultCode.ERROR_PARAMETER);
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    /**
     * 参数校验异常
     * @param exception
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(BindException.class)
    public void bindExceptionHandler(BindException exception, HttpServletRequest request, HttpServletResponse response){
        ResultError resultError = new ResultError(exception.getFieldErrors());
        ResultModel resultModel = new ResultModel(ResultCode.ERROR_PARAMETER,resultError.defaultMessage());
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        resultModel.addData(HttpConstants.RESULT_VAILD_KEY, resultError.getVaildFields());
        ResponseResult.output(resultModel,response,foreverOk);
    }
}
