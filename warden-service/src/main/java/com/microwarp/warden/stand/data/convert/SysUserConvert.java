package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysUser
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysUserConvert {
    SysUserConvert Instance = Mappers.getMapper(SysUserConvert.class);
    SysUserDTO sysUserToSysUserDTO(SysUser sysUser);
    SysUser sysUserDtoToSysUser(SysUserDTO sysUserDTO);
    List<SysUserDTO> sysUsersToSysUserDTOs(List<SysUser> sysUsers);
    SysUserDetailsDTO sysUserDtoToUserDetailsDTO(SysUserDTO sysUserDTO);
}