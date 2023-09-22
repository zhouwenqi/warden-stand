package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysConfigMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.GlobalConfigVO;
import com.microwarp.warden.stand.admin.domain.vo.SysConfigVO;
import com.microwarp.warden.stand.common.core.config.WardenGlobalConfig;
import com.microwarp.warden.stand.common.core.constant.HttpConstants;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * controller - 配置信息
 * @author zhouwenqi
 */
@RestController
@RequestMapping("/config")
public class ConfigController {
    @Autowired
    private WardenGlobalConfig wardenGlobalConfig;
    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 获取系统配置
     * @return
     */
    @GetMapping("system")
    @PreAuthorize("hasAuthority('config:admin')")
    public ResultModel system(){
        ResultModel resultModel = ResultModel.success();
        SysConfigDTO sysConfigDTO = sysConfigService.findCurrent();
        resultModel.addData("config", SysConfigMapstruct.Instance.sysConfigDTOtoSysConfigVO(sysConfigDTO));
        return resultModel;
    }
    /**
     * 获取系统配置
     * @return
     */
    @PatchMapping("system")
    @PreAuthorize("hasAuthority('config:admin')")
    public ResultModel update(@RequestBody SysConfigVO sysConfigVO){
        SysConfigDTO sysConfigDTO = SysConfigMapstruct.Instance.sysConfigVOtoSysConfigDTO(sysConfigVO);
        sysConfigService.update(sysConfigDTO);
        return ResultModel.success();
    }

    /**
     * 获取全局开放配置
     * @return
     */
    @GetMapping("global")
    public ResultModel global(){
        SysConfigDTO sysConfigDTO = sysConfigService.findCurrent();
        ResultModel resultModel = ResultModel.success();
        GlobalConfigVO globalConfigVO = new GlobalConfigVO();
        globalConfigVO.setEnableRegister(sysConfigDTO.getEnabledRegister());
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
