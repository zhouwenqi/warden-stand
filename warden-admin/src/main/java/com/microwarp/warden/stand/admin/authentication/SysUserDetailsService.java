package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.exception.WardenRequireAuthorizedException;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserLockService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * security - user-service
 * @author zhouwenqi
 */
@Service
public class SysUserDetailsService implements UserDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(SysUserDetailsService.class);
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysPermissionService sysPermissionService;
    @Autowired
    private SysUserLockService sysUserLockService;
    public SecurityUser loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsByUid(username);
        String ip = WebUtil.getIpAddr();
        if(null != sysUserDetailsDTO){
            // “保留超管用户” 或 “超管角色”
            Set<String> roleValues = sysUserDetailsDTO.getRoles().stream().map(SysRoleDTO::getValue).collect(Collectors.toSet());
            if(sysUserDetailsDTO.getUid().equals(SecurityConstants.RESERVE_ROOT_USER_NAME) || SecurityUtil.hasAnyAuthority(roleValues, SecurityConstants.ROLE_ROOT_VALUE)){
                sysUserDetailsDTO.setPermissions(new HashSet<>(sysPermissionService.findAll()));
            }
            SecurityUser securityUser = new SecurityUser(sysUserDetailsDTO);
            securityUser.setAccountNonLocked(!sysUserLockService.isLocked(sysUserDetailsDTO.getId(),ip));
            return securityUser;
        }else{
            logger.error("用户不存在{0}",username);
            throw new UsernameNotFoundException("用户不存在");
        }
    }
}
