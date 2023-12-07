package com.microwarp.warden.stand.data.dao;

import com.microwarp.warden.stand.data.basic.BaseDao;
import com.microwarp.warden.stand.data.entity.SysPost;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;

/**
 * dao - 岗位
 * @author zhouwenqi
 */
public interface SysPostDao extends BaseDao<SysPost> {
    SysPostDTO findById(Long id);
}
