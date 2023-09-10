package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.excel.SysLoginLogExcel;
import com.microwarp.warden.stand.admin.domain.vo.SysLoginLogVO;
import com.microwarp.warden.stand.admin.domain.vo.SysOperationLogVO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysOperationLog
 * (vo 和 dto)
 * @author zhouwenqi
 */
@Mapper
public interface SysLoginLogMapstruct {
    SysLoginLogMapstruct Instance = Mappers.getMapper(SysLoginLogMapstruct.class);
    SysLoginLogVO sysLoginLogDtoToSysLoginLogVO(SysLoginLogDTO sysLoginLogDTO);
    List<SysLoginLogVO> sysLoginLogDtosToSysLoginLogVOs(List<SysLoginLogDTO> sysLoginLogsDTO);
    SysLoginLogExcel sysLoginLogDtoToSysLoginLogExcel(SysLoginLogDTO sysLoginLogDTO);
    List<SysLoginLogExcel> sysLoginLogDtosToSysLoginLogExcels(List<SysLoginLogDTO> sysLoginLogDTOs);
}
