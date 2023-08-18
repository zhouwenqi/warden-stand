package com.microwarp.warden.stand.admin.authentication;

import com.microwarp.warden.stand.common.utils.WebUtil;
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
    private SysUserLockService sysUserLockService;
    public SecurityUser loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUserDetailsDTO sysUserDetailsDTO = sysUserService.findDetailsByUid(username);
        String ip = WebUtil.getIpAddr();
        if(null != sysUserDetailsDTO){
            SecurityUser securityUser = new SecurityUser(sysUserDetailsDTO);
            securityUser.setAccountNonLocked(!sysUserLockService.isLocked(sysUserDetailsDTO.getId(),ip));
            return securityUser;
        }else{
            logger.error("用户不存在{0}",username);
            throw new UsernameNotFoundException("用户不存在");
        }
    }
}
