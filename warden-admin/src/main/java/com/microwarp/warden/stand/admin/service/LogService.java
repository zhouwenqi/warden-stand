package com.microwarp.warden.stand.admin.service;

import com.microwarp.warden.stand.admin.utils.AddressUtil;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.service.SysOperationLogService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * service - 日志
 * @author zhouwenqi
 */
@Service
public class LogService {
    private static final Logger logger = LoggerFactory.getLogger(LogService.class);
    @Autowired
    private SysOperationLogService sysOperationLogService;

    /**
     * 写入操作日志
     * @param sysOperationLogDTO 操作日志DTO对象
     */
    public void write(SysOperationLogDTO sysOperationLogDTO){
        sysOperationLogService.add(sysOperationLogDTO);
    }

    /**
     * 写入操作日志(同步)
     * @param user 用户信息
     * @param logContent 日志信息
     * @param ip IP地址
     * @param actionType 动作类型
     * @param appTerminal 终端类型
     * @param platformType 平台类型
     * @param moduleType 模块
     * @param mateId 模块关联ID
     */
    public void write(SysUserDetailsDTO user, String logContent, String ip, ActionTypeEnum actionType, AppTerminalEnum appTerminal, PlatformTypeEnum platformType, ModuleTypeEnum moduleType,Long mateId) {
        if (null != user.getId()) {
            try {
                SysOperationLogDTO sysOperationLogDTO = new SysOperationLogDTO();
                sysOperationLogDTO.setUserId(user.getId());
                sysOperationLogDTO.setUid(user.getUid());
                sysOperationLogDTO.setIp(ip);
                sysOperationLogDTO.setLocation(AddressUtil.getLocation(ip));
                sysOperationLogDTO.setActionType(actionType);
                sysOperationLogDTO.setAppTerminalType(appTerminal);
                sysOperationLogDTO.setPlatformType(platformType);
                sysOperationLogDTO.setModuleType(moduleType);
                sysOperationLogDTO.setContent(logContent);
                sysOperationLogDTO.setMateId(mateId);
                write(sysOperationLogDTO);
            } catch (Exception e) {
                logger.warn("写入操作日志失败", e.getMessage());
            }
        }
    }

    /**
     * 写入操作日志(异步)
     * @param user 用户信息
     * @param logContent 日志信息
     * @param ip IP地址
     * @param actionType 动作类型
     * @param appTerminal 终端类型
     * @param platformType 平台类型
     * @param moduleType 模块
     * @param mateId 模块关联ID
     */
    @Async("taskExecutor")
    public void syncWrite(SysUserDetailsDTO user, String logContent, String ip, ActionTypeEnum actionType, AppTerminalEnum appTerminal, PlatformTypeEnum platformType, ModuleTypeEnum moduleType,Long mateId){
        write(user,logContent,ip,actionType,appTerminal,platformType,moduleType,mateId);
    }

    /**
     * 后台异步写入操作日志
     * @param logContent 日志内容
     * @param actionType 操作类型
     * @param moduleType 模块类型
     * @param mateId 模块关联ID
     */
    @Async("taskExecutor")
    public void syncPcBackWrite(String logContent, ActionTypeEnum actionType, ModuleTypeEnum moduleType, Long... mateId){
        String ip = WebUtil.getIpAddr();
        if(null != mateId && mateId.length>0){
            for(Long id:mateId){
                if(null== id){
                    continue;
                }
                SysUserDetailsDTO sysUserDetailsDTO = SecurityUtil.getCurrentSysUser();
                write(sysUserDetailsDTO,logContent,ip,actionType,AppTerminalEnum.PC_WEB,PlatformTypeEnum.BACKSTAGE,moduleType,id);
            }
        }
    }
}
