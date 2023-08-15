package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.convert.SysPostConvert;
import com.microwarp.warden.stand.data.dao.SysPostDao;
import com.microwarp.warden.stand.data.entity.SysPost;
import com.microwarp.warden.stand.data.mapper.SysPostMapper;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import org.springframework.stereotype.Repository;

/**
 * dao - 岗位 - impl
 * @author zhouwenqi
 */
@Repository
public class SysPostDaoImpl extends ServiceImpl<SysPostMapper,SysPost> implements SysPostDao {
    @Override
    public SysPostDTO findById(Long id){
        SysPost sysPost = getById(id);
        return null != sysPost ? SysPostConvert.Instance.sysPostToSysPostDTO(sysPost) : null;
    }
}
