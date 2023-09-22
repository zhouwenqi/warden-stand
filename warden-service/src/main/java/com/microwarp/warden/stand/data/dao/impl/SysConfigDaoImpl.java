package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.dao.SysConfigDao;
import com.microwarp.warden.stand.data.entity.SysConfig;
import com.microwarp.warden.stand.data.mapper.SysConfigMapper;
import org.springframework.stereotype.Repository;

/**
 * dao - 配置 - impl
 * @author zhouwenqi
 */
@Repository
public class SysConfigDaoImpl extends ServiceImpl<SysConfigMapper,SysConfig> implements SysConfigDao {
}
