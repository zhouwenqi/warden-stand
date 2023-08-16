package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysPermission;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysPermission
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysPermissionConvert {
    SysPermissionConvert Instance = Mappers.getMapper(SysPermissionConvert.class);
    SysPermissionDTO sysPermissionToSysPermissionDTO(SysPermission sysPermission);
    SysPermission sysPermissionDtoToSysPermission(SysPermissionDTO sysPermissionDTO);
    List<SysPermissionDTO> sysPermissionsToSysPermissionsDTO(List<SysPermission> sysPermissions);
}
