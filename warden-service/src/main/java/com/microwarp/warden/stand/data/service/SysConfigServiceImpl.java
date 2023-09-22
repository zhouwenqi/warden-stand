package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.data.convert.SysConfigConvert;
import com.microwarp.warden.stand.data.dao.SysConfigDao;
import com.microwarp.warden.stand.data.entity.SysConfig;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import org.mapstruct.ap.internal.model.assignment.UpdateWrapper;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * service - 配置 - impl
 * @author zhouwenqi
 */
@Service
public class SysConfigServiceImpl implements SysConfigService {
    @Resource
    private SysConfigDao sysConfigDao;
    /**
     * 获取当前系统配置
     * @return 系统配置
     */
    @Override
    @Cacheable(value = CacheConstants.CACHE_CONFIG_CURRENT, key="'current'", unless = "#result eq null")
    public SysConfigDTO findCurrent(){
        QueryWrapper<SysConfig> queryWrapper = new QueryWrapper<>();
        SysConfig sysConfig = sysConfigDao.getOne(queryWrapper);
        if(null == sysConfig){
            sysConfig = new SysConfig();
            sysConfig.setAllowManyToken(false);
            sysConfig.setEnabledRegister(false);
        }
        return SysConfigConvert.Instance.sysConfigToSysConfigDTO(sysConfig);
    }

    /**
     * 更新系统配置
     * @param sysConfigDTO 系统配置
     */
    @Override
    @Transactional
    @CacheEvict(value = CacheConstants.CACHE_CONFIG_CURRENT, key="'current'")
    public void update(SysConfigDTO sysConfigDTO){
        SysConfig sysConfig = SysConfigConvert.Instance.sysConfigDTOtoSysConfig(sysConfigDTO);
        sysConfigDao.update(sysConfig,null);
    }
}
