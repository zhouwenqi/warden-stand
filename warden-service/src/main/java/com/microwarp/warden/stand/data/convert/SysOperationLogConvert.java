package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysOperationLog;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysOperationLog
 * (dto - entity)
 * @author zhouwenqi
 *
 */
@Mapper
public interface SysOperationLogConvert {
    SysOperationLogConvert Instance = Mappers.getMapper(SysOperationLogConvert.class);
    SysOperationLog sysOperationLogDtoToSysOperationLog(SysOperationLogDTO sysOperationLogDTO);
    SysOperationLogDTO sysOperationLogToSysOperationLogDTO(SysOperationLog sysOperationLog);
    List<SysOperationLogDTO> sysOperationLogsToSysOperationLogDTOs(List<SysOperationLog> sysOperationLogs);
}
