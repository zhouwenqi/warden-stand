package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysLoginLog;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysLoginLog
 * (dto - entity)
 * @author zhouwenqi
 *
 */
@Mapper
public interface SysLoginLogConvert {
    SysLoginLogConvert Instance = Mappers.getMapper(SysLoginLogConvert.class);
    SysLoginLog sysLoginLogDtoToSysLoginLog(SysLoginLogDTO sysLoginLogDTO);
    SysLoginLogDTO sysLoginLogToSysLoginLogDTO(SysLoginLog sysLoginLog);
    List<SysLoginLogDTO> sysLoginLogsToSysLoginLogDTOs(List<SysLoginLog> sysLoginLogs);
}
