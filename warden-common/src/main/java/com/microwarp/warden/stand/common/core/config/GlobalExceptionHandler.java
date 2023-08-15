package com.microwarp.warden.stand.common.core.config;

import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.JsonUtil;
import com.microwarp.warden.stand.common.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 非控制器异常处理
 * @author zhouwenqi
 */
@AutoConfigureBefore(ErrorMvcAutoConfiguration.class)
@Controller
public class GlobalExceptionHandler extends BasicErrorController {
    @Autowired
    public GlobalExceptionHandler(ErrorAttributes errorAttributes, ServerProperties serverProperties, List<ErrorViewResolver> errorViewResolvers) {
        super(errorAttributes, serverProperties.getError(), errorViewResolvers);
    }

    @Override
    @ResponseBody
    public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        HttpStatus httpStatus = this.getStatus(request);
        boolean foreverOk = ResultUtil.isForeverOk(request.getHeader(HttpConstants.HEADER_PACKAGE_TYPE));
        HttpStatus status = foreverOk ? HttpStatus.OK : httpStatus;
        ResultModel resultModel = new ResultModel(httpStatus.value(),"");
        if (httpStatus != HttpStatus.NO_CONTENT) {
            Map<String, Object> body = this.getErrorAttributes(request, this.getErrorAttributeOptions(request, MediaType.ALL));
            resultModel.setMsg(body.get("error").toString());
        }
        return ResponseEntity.status(status).body(getEntityMap(resultModel));
    }

    private Map<String, Object> getEntityMap(ResultModel resultModel){
        Map<String,Object> map = new HashMap<>();
        map.put(HttpConstants.RESULT_ADVICE_KEY,resultModel);
        return map;
    }
}
