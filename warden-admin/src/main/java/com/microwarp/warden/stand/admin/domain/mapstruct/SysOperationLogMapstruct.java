package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.SysOperationLogVO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysOperationLog
 * (vo 和 dto)
 *
 * @author zhouwenqi
 */
@Mapper
public interface SysOperationLogMapstruct {
    SysOperationLogMapstruct Instance = Mappers.getMapper(SysOperationLogMapstruct.class);
    SysOperationLogVO sysOperationLogDtoToSysOperationLogVO(SysOperationLogDTO sysOperationLogDTO);
    List<SysOperationLogVO> sysOperationLogsDtoToSysOperationLogsVO(List<SysOperationLogDTO> sysOperationLogsDTO);
}
