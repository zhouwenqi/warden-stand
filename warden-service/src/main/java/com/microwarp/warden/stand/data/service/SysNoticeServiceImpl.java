package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysNoticeConvert;
import com.microwarp.warden.stand.data.dao.SysNoticeDao;
import com.microwarp.warden.stand.data.entity.SysNotice;
import com.microwarp.warden.stand.facade.sysnotice.dto.SysNoticeDTO;
import com.microwarp.warden.stand.facade.sysnotice.service.SysNoticeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * service - 系统公告 - impl
 * @author zhouwenqi
 */
@Service
public class SysNoticeServiceImpl extends BaseServiceImpl<SysNotice> implements SysNoticeService {
    @Resource
    private SysNoticeDao sysNoticeDao;

    /**
     * 查询公告信息
     * @param id 公告ID
     * @return 公告信息
     */
    @Override
    public SysNoticeDTO findById(Long id){
        SysNotice sysNotice = sysNoticeDao.getById(id);
        return null == sysNotice ? null : SysNoticeConvert.Instance.sysNoticeToSysNoticeDTO(sysNotice);
    }

    /**
     * 创建系统公告
     * @param sysNoticeDTO 公告内容
     * @return 公告信息
     */
    @Override
    public SysNoticeDTO create(SysNoticeDTO sysNoticeDTO) {
        SysNotice sysNotice = SysNoticeConvert.Instance.sysNoticeDtoToSysNotice(sysNoticeDTO);
        sysNoticeDao.save(sysNotice);
        return findById(sysNotice.getId());
    }

    /**
     * 更新系统公告
     * @param sysNoticeDTO 公告内容
     */
    @Override
    public void update(SysNoticeDTO sysNoticeDTO){
        SysNotice sysNotice = SysNoticeConvert.Instance.sysNoticeDtoToSysNotice(sysNoticeDTO);
        sysNoticeDao.updateById(sysNotice);
    }

    /**
     * 删除系统公告
     * @param id 公告ID
     */
    @Override
    public void delete(Long ... id){
        if(null != id && id.length > 0){
            sysNoticeDao.removeByIds(Arrays.asList(id));
        }
    }

    /**
     * 分页查询系统公告
     * @param iSearchPageable 查询条件
     * @return 公告列表
     */
    @Override
    public ResultPage<SysNoticeDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysNotice> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("title", iSearchPageable.getSearchValue())
                    .or()
                    .like("content", iSearchPageable.getSearchValue())
            );
        }
        if(null != iSearchPageable.getFilters()){
            useBaseFilter(queryWrapper,iSearchPageable.getFilters());
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysNotice> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysNoticeDao.page(page,queryWrapper);
        ResultPage<SysNoticeDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysNoticeConvert.Instance.sysNoticesToSysNoticeDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
