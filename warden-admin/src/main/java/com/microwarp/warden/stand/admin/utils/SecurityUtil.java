package com.microwarp.warden.stand.admin.utils;

import com.microwarp.warden.stand.admin.authentication.WardenAuthentication;
import com.microwarp.warden.stand.common.core.constant.SecurityConstants;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Security - util
 */
public class SecurityUtil {
    /**
     * 获取当前security认证系统用户
     * @return
     */
    public static SysUserDetailsDTO getCurrentSysUser(){
        WardenAuthentication wardenAuthentication = getAuthentication();
        return null != wardenAuthentication ? wardenAuthentication.getCredentials() : null;
    }

    /**
     * 获取当前security认证
     * @return
     */
    public static WardenAuthentication getAuthentication(){
        return (WardenAuthentication) SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * 获取当前security认证权限列表
     * @return
     */
    public static Collection<GrantedAuthority> getAuthoritys(){
        WardenAuthentication wardenAuthentication = getAuthentication();
        return null != wardenAuthentication ? wardenAuthentication.getAuthorities() : new ArrayList<>();
    }

    /**
     * 获取当前security认证权限值数组
     * @return
     */
    public static String[] getAuthorityArray(Collection<GrantedAuthority> authoritys){
        if(null == authoritys){
            return new String[0];
        }
        String[] arr = new String[authoritys.size()];
        Set<String> list = authoritys.stream().map(s -> s.getAuthority()).collect(Collectors.toSet());
        return list.toArray(arr);
    }

    /**
     * 获取当前security认证权限值数组
     * @return
     */
    public static String[] getAuthorityArray(){
        return getAuthorityArray(getAuthoritys());
    }

    /**
     * 权限匹配(只需匹配一个)
     * @param authoritys 权限值列表
     * @param hasAuthoritys 需要匹配的权限值列表
     * @return
     */
    public static boolean hasAnyAuthority(Set<String> authoritys, List<String> hasAuthoritys){
        if(null == authoritys || authoritys.size() < 1 || hasAuthoritys.size() < 1){
            return false;
        }
        Set<String> list = new HashSet<>(authoritys);
        for(String authority:hasAuthoritys){
            if(list.contains(authority)){
                return true;
            }
        }
        return false;
    }

    /**
     * 权限匹配(只需匹配一个)
     * @param authoritys 权限值列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAnyAuthority(Set<String> authoritys, String... authority){
        List<String> list = Arrays.asList(authority);
        return hasAnyAuthority(authoritys,list);
    }

    /**
     * 权限匹配(只需匹配一个)
     * @param authoritys 权限列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAnyAuthority(Collection<GrantedAuthority> authoritys, String... authority){
        Set<String> list = authoritys.stream().map(s -> s.getAuthority()).collect(Collectors.toSet());
        return hasAnyAuthority(list,authority);
    }

    /**
     * 当前权限匹配(只需匹配一个)
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAnyAuthority(String... authority){
        return hasAnyAuthority(getAuthoritys(),authority);
    }

    /**
     * 权限匹配(只需匹配一个)
     * @param permissions 权限数据列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAnyAuthority(List<SysPermissionDTO> permissions, String... authority){
        Set<String> list = permissions.stream().map(s -> s.getValue()).collect(Collectors.toSet());
        return hasAnyAuthority(list,authority);
    }

    /**
     * 权限匹配
     * @param authoritys 权限值列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAuthority(Set<String> authoritys, String... authority){
        if(null == authoritys || authoritys.size() < 1 || authority.length < 1){
            return false;
        }
        Set<String> list = new HashSet<>(Arrays.asList(authority));
        int ex = 0;
        for(String auth:list){
            if(authoritys.contains(auth)){
                ex ++;
            }
        }

        return ex == list.size();
    }

    /**
     * 当前权限匹配
     * @param authoritys 权限列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAuthority(Collection<GrantedAuthority> authoritys, String... authority){
        Set<String> list = authoritys.stream().map(s -> s.getAuthority()).collect(Collectors.toSet());
        return hasAuthority(list,authority);
    }

    /**
     * 权限匹配
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAuthority(String... authority){
        return hasAuthority(getAuthoritys(),authority);
    }

    /**
     * 权限匹配
     * @param permissions 权限数据列表
     * @param authority 需要匹配的权限值数组
     * @return
     */
    public static boolean hasAuthority(List<SysPermissionDTO> permissions, String... authority){
        Set<String> list = permissions.stream().map(s -> s.getValue()).collect(Collectors.toSet());
        return hasAuthority(list,authority);
    }

    /**
     * 根据用户id判断是否是当前授权用户
     * @param userId 用户id
     * @return
     */
    public static boolean isCurrentUser(Long userId){
        SysUserDetailsDTO sysUserDetailsDTO = getCurrentSysUser();
        if(null != sysUserDetailsDTO){
            return sysUserDetailsDTO.getId() == userId;
        }
        return false;
    }

    /**
     * 判断当前是否拥有超级管理员角色
     * @return
     */
    public static boolean inAdmin(){
        return WebUtil.getRequest().isUserInRole(SecurityConstants.ADMIN_DEFAULT_VALUE);
    }

    /**
     * 判断当前是否拥有超级管理员角色
     * @return
     */
    public static boolean inRoot(){
        return WebUtil.getRequest().isUserInRole(SecurityConstants.ROOT_DEFAULT_VALUE);
    }

    /**
     * 判断当前用户是否管理员或超级管理员
     * @return
     */
    public static boolean anyAdminOrRoot(){
        return inAdmin() || inRoot();
    }

    /**
     * 判断用户是否当前用户或拥有超级管理员角色
     * @param userId 用户id
     * @return
     */
    public static boolean anyInRoot(Long userId){
        return isCurrentUser(userId) || inRoot();
    }

    /**
     * 判断用户是否当前用户或拥有管理员或超级管理员角色
     * @param userId 用户id
     * @return
     */
    public static boolean anyInAdmonOrRoot(Long userId){
        return isCurrentUser(userId) || inRoot() || inAdmin();
    }
}
