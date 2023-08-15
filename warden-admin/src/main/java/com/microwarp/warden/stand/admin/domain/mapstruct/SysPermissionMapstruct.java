package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.authentication.SecurityAuthority;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionVO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;
import java.util.Set;

/**
 * 对象复制 - SysPermission
 * (vo 和 dto)
 *
 * 文献参考：https://mapstruct.org/documentation/installation/
 * @author zhouwenqi
 */
@Mapper
public interface SysPermissionMapstruct {
    SysPermissionMapstruct Instance = Mappers.getMapper(SysPermissionMapstruct.class);
    @Mapping(target = "authority", source = "value")
    SecurityAuthority toSecurityAuthority(SysPermissionDTO sysPermissionDTO);
    List<SecurityAuthority> toSecurityAuthoritys(Set<SysPermissionDTO> sysPermissionsDTO);
    SysPermissionVO sysPermissionDtoToSysPermissionVO(SysPermissionDTO sysPermissionDTO);
    List<SysPermissionVO> sysPermissionsDtoToSysPermissionsVO(List<SysPermissionDTO> sysPermissionsDTO);
    SysPermissionDTO sysPermissionRequestToSysPermissionDTO(SysPermissionRequest sysPermissionRequest);
}