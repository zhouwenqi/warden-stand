package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResponseResult;
import com.microwarp.warden.stand.common.model.ResultCode;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * security - 没有权限句柄(装配)
 * @author zhouwenqi
 */
public class WardenAccessDeninedHandler implements AccessDeniedHandler {
    private static final Logger logger = LoggerFactory.getLogger(WardenAccessDeninedHandler.class);
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        logger.warn("access denied {}", e.getMessage());
        ResultModel resultModel = new ResultModel(ResultCode.REQUIRE_AUTHORIZED);
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        ResponseResult.output(resultModel,response,foreverOk);
    }
}
