package com.microwarp.warden.stand.admin.domain.mapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysConfigVO;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;


/**
 * 对象复制 - SysConfig
 * (vo 和 dto)
 * @author zhouwenqi
 */
@Mapper
public interface SysConfigMapstruct {
    SysConfigMapstruct Instance = Mappers.getMapper(SysConfigMapstruct.class);
    SysConfigDTO sysConfigVOtoSysConfigDTO(SysConfigVO sysConfigVO);
    SysConfigVO sysConfigDTOtoSysConfigVO(SysConfigDTO sysConfigDTO);
}
