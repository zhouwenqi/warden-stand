package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.vo.GlobalConfigVO;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * controller - 配置信息
 * @author zhouwenqi
 */
@RestController
@RequestMapping("/config")
public class ConfigController {
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;

    /**
     * 获取全局开放配置
     * @return
     */
    @GetMapping("global")
    public ResultModel global(){
        ResultModel resultModel = ResultModel.success();
        GlobalConfigVO globalConfigVO = new GlobalConfigVO();
        globalConfigVO.setEnableRegister(wardenGlobalConfig.getEnableRegister());
        globalConfigVO.setResponseForeverOk(wardenGlobalConfig.getResponseForeverOk());
        globalConfigVO.setTokenEffectiveHour(wardenGlobalConfig.getTokenEffectiveHour());
        globalConfigVO.setDefaultPageSize(HttpConstants.DEFAULT_PAGE_SIZE);
        globalConfigVO.setCaptchaType(wardenGlobalConfig.getCaptchaType());
        globalConfigVO.setEnableCaptcha(wardenGlobalConfig.getEnableCaptcha());
        String guestId = WebUtil.getGuestId();
        globalConfigVO.setGuestId(guestId);
        resultModel.addData("config",globalConfigVO);
        return resultModel;
    }
}
