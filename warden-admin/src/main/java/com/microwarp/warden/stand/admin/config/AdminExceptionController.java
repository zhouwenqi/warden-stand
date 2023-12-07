package com.microwarp.warden.stand.admin.config;
import com.alibaba.excel.exception.ExcelWriteDataConvertException;
import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResponseResult;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  Warden异常扩展处理
 *  没拦截住的将走GlobalAdviceController处理
 *  @author zhouwenqi
 */
@Component
@ControllerAdvice
public class AdminExceptionController {
    private static final Logger logger = LoggerFactory.getLogger(AdminExceptionController.class);
    /**
     * Security 没有权限句柄(控制器注解)
     * @param request
     * @param response
     * @param exception
     * @throws IOException
     */
    @ExceptionHandler(value = {AccessDeniedException.class})
    public void accessDeniedException(HttpServletRequest request, HttpServletResponse response, AccessDeniedException exception) throws IOException {
        ResultModel resultModel = new ResultModel(ResultCode.REQUIRE_AUTHORIZED);
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    /**
     * mysql唯一索引触发异常
     * @param exception
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(DuplicateKeyException.class)
    public void duplicateKeyException(DuplicateKeyException exception, HttpServletRequest request, HttpServletResponse response){
        ResultModel resultModel = new ResultModel(ResultCode.ERROR_PARAMETER,"唯一索引内容不能重复");
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }

    /**
     * excel 写异常
     * @param exception
     * @param request
     * @param response
     */
    @ExceptionHandler(ExcelWriteDataConvertException.class)
    public void excelWriteDataConvertException(ExcelWriteDataConvertException exception, HttpServletRequest request, HttpServletResponse response){
        logger.error("excel导出失败 {}",exception.getMessage());
        ResultModel resultModel = new ResultModel(ResultCode.ERROR_PARAMETER,"Excel导出失败");
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.print(resultModel,response,foreverOk);
    }

    /**
     * 帐号异常
     * @param exception
     * @param request
     * @param response
     */
    @ExceptionHandler(UsernameNotFoundException.class)
    public void usernameNotFoundException(UsernameNotFoundException exception, HttpServletRequest request, HttpServletResponse response){
        logger.error("token解析成功，但： {}",exception.getMessage());
        ResultModel resultModel = new ResultModel(ResultCode.ERROR_TOKEN,exception.getMessage());
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.print(resultModel,response,foreverOk);
    }
}
