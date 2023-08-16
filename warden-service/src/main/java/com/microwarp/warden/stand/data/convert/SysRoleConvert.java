package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysRole
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysRoleConvert {
    SysRoleConvert Instance = Mappers.getMapper(SysRoleConvert.class);
    SysRoleDTO sysRoleToSysRoleDTO(SysRole sysRole);
    SysRoleDetailsDTO sysRoleDtoToSysRoleDetailsDTO(SysRoleDTO sysRoleDTO);
    SysRole sysRoleDtoToSysSysRole(SysRoleDTO sysRoleDTO);
    List<SysRoleDTO> sysRolesToSysRolesDTO(List<SysRole> sysRoles);
}
