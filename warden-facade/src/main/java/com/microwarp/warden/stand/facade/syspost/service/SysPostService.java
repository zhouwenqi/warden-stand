package com.microwarp.warden.stand.facade.syspost.service;

import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;

/**
 * service - 岗位
 * @author zhouwenqi
 */
public interface SysPostService {

    /**
     * 查询岗位信息
     * @param id 岗位id
     * @return
     */
    SysPostDTO findById(Long id);
    /**
     * 创建岗位信息
     * @param sysPostDTO 岗位信息
     * @return
     */
    SysPostDTO create(SysPostDTO sysPostDTO);
    /**
     * 更新岗位信息
     * @param sysPostDTO 岗位信息
     */
    void update(SysPostDTO sysPostDTO);
    /**
     * 删除岗位信息
     * @param id 岗位id
     */
    void delete(Long... id);
    /**
     * 分页查询岗位信息
     * @param iSearchPageable 查询参数
     * @return
     */
    ResultPage<SysPostDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable);
}
