package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.authentication.SecurityAuthority;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleDetailsVO;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleUpdateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysRoleVO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;
import java.util.Set;

/**
 * 对象复制 - SysRole
 * (vo 和 dto)
 *
 * @author zhouwenqi
 */
@Mapper
public interface SysRoleMapstruct {
    SysRoleMapstruct Instance = Mappers.getMapper(SysRoleMapstruct.class);
    SysRoleVO sysRoleDtoToSysRoleVO(SysRoleDTO sysRoleDTO);
    SysRoleDTO sysRoleUpdateRequestTosysRoleDTO(SysRoleUpdateRequest sysRoleUpdateRequest);
    SysRoleDTO sysRoleCreateRequestTosysRoleDTO(SysRoleCreateRequest sysRoleCreateRequest);
    SysRoleDetailsVO sysRoleDetailsDtoToSysRoleDetailsVO(SysRoleDetailsDTO sysRoleDetailsDTO);
    @Mapping(target = "authority", source = "value")
    SecurityAuthority toSecurityAuthority(SysRoleDTO sysRoleDTO);
    List<SecurityAuthority> toSecurityAuthoritys(Set<SysRoleDTO> sysRolesDTO);
}
