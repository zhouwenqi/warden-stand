package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysUserLock;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserLockDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 对象复制 - SysUserLock
 * (dto - entity)
 *
 * 文献参考：https://mapstruct.org
 * @author zhouwenqi
 */
@Mapper
public interface SysUserLockConvert {
    SysUserLockConvert Instance = Mappers.getMapper(SysUserLockConvert.class);
    SysUserLockDTO sysUserLockToSysUserLockDTO(SysUserLock sysUserLock);
}
