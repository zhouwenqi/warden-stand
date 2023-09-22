package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysConfig;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 对象复制 - SysConfig
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysConfigConvert {
    SysConfigConvert Instance = Mappers.getMapper(SysConfigConvert.class);
    SysConfigDTO sysConfigToSysConfigDTO(SysConfig sysConfig);
    SysConfig sysConfigDTOtoSysConfig(SysConfigDTO sysConfigDTO);
}
