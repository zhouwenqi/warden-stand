package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.authentication.SecurityAuthority;
import com.microwarp.warden.stand.admin.domain.excel.SysPermissionExcel;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPermissionUpdateRequest;
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
    SysPermissionDTO sysPermissionCreateRequestToSysPermissionDTO(SysPermissionCreateRequest sysPermissionRequest);
    SysPermissionDTO sysPermissionUpdateRequestToSysPermissionDTO(SysPermissionUpdateRequest sysPermissionRequest);
    SysPermissionExcel sysPermissionDtoToSysPermissionExcel(SysPermissionDTO sysPermissionDTO);
    List<SysPermissionExcel> sysPermissionsDtoToSysPermissionsExcel(List<SysPermissionDTO> sysPermissionsDTO);
}