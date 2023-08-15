package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResponseResult;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * security 没有凭据入口
 * @author zhouwenqi
 *
 */
public class WardenAuthenticationEntryPoint implements AuthenticationEntryPoint {
    private static final Logger logger = LoggerFactory.getLogger(WardenAuthenticationEntryPoint.class);
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException,ServletException {
        logger.error("entry-point:{}",exception.getMessage());
        ResultModel resultModel = new ResultModel(ResultCode.REQUIRE_TOKEN);
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }
}
