package com.microwarp.warden.stand.data.dao.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.microwarp.warden.stand.data.dao.SysNoticeDao;
import com.microwarp.warden.stand.data.entity.SysNotice;
import com.microwarp.warden.stand.data.mapper.SysNoticeMapper;
import org.springframework.stereotype.Repository;

/**
 * dao - 系统消息 - impl
 */
@Repository
public class SysNoticeDaoImpl extends ServiceImpl<SysNoticeMapper,SysNotice> implements SysNoticeDao {
}
