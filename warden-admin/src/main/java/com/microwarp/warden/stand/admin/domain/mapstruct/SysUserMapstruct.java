package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.*;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserRequestDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 对象复制 - SysUser
 * (vo 和 dto)
 *
 * 文献参考：https://mapstruct.org/documentation/installation/
 * @author zhouwenqi
 */
@Mapper
public interface SysUserMapstruct {
    SysUserMapstruct Instance = Mappers.getMapper(SysUserMapstruct.class);
    SysUserVO sysUserDtoToSysUserVo(SysUserDTO sysUserDTO);
    SysUserDTO sysUserRegisterRequestToSysUserDTO(SysUserRegisterRequest sysUserRegisterRequest);
    SysUserDTO sysUserUpdateRequestToSysUserDTO(SysUserUpdateRequest sysUserUpdateRequest);
    SysUserDTO sysUserProfileRequestToSysUserDTO(SysUserProfileRequest sysUserProfileRequest);
    SysUserRequestDTO sysUserCreateRequestToSysUserRequestDTO(SysUserCreateRequest sysUserCreateRequest);
    SysUserDetailsVO sysUserDetailsDtoToSysUserDetailsVo(SysUserDetailsDTO sysUserDetailsDTO);
}
