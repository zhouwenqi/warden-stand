package com.microwarp.warden.stand.facade.sysnotice.service;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.sysnotice.dto.SysNoticeDTO;

/**
 * service - 系统公告
 */
public interface SysNoticeService {
    /**
     * 查询公告信息
     * @param id 公告ID
     * @return
     */
    SysNoticeDTO findById(Long id);

    /**
     * 创建系统公告
     * @param sysNoticeDTO 公告内容
     * @return
     */
    SysNoticeDTO create(SysNoticeDTO sysNoticeDTO);

    /**
     * 更新系统公告
     * @param sysNoticeDTO 公告内容
     */
    void update(SysNoticeDTO sysNoticeDTO);

    /**
     * 删除系统公告
     * @param id 公告ID
     */
    void delete(Long ... id);

    /**
     * 分页查询系统公告
     * @param iSearchPageable 查询条件
     * @return
     */
    ResultPage<SysNoticeDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable);
}
