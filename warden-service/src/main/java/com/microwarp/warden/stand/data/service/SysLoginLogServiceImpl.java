package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysLoginLogConvert;
import com.microwarp.warden.stand.data.dao.SysLoginLogDao;
import com.microwarp.warden.stand.data.entity.SysLoginLog;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * service - 登录日志 - impl
 * @author zhouwenqi
 */
@Service
public class SysLoginLogServiceImpl extends BaseServiceImpl<SysLoginLog> implements SysLoginLogService {
    @Resource
    private SysLoginLogDao sysLoginLogDao;

    /**
     * 查询登录日志信息
     * @param id 日志id
     * @return
     */
    public SysLoginLogDTO findById(Long id){
        return sysLoginLogDao.findById(id);
    }

    /**
     * 添加登录日志信息
     * @param sysLoginLogDTO 日志信息
     */
    public void add(SysLoginLogDTO sysLoginLogDTO){
        SysLoginLog sysLoginLog = SysLoginLogConvert.Instance.sysLoginLogDtoToSysLoginLog(sysLoginLogDTO);
        sysLoginLogDao.save(sysLoginLog);
    }

    /**
     * 删除登录日志
     * @param id 日志id
     */
    public void delete(Long... id){
        sysLoginLogDao.delete(id);
    }

    /**
     * 清空登录日志
     */
    public void clearAll(){
        sysLoginLogDao.clearAll();
    }

    /**
     * 分页查询登录日志
     * @param iSearchPageable 查询条件
     * @return
     */
    public ResultPage<SysLoginLogDTO> findPage(ISearchPageable<SysLoginLogSearchDTO> iSearchPageable){
        QueryWrapper<SysLoginLog> queryWrapper = new QueryWrapper<>();
        String searchKey = iSearchPageable.getSearchKey();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            switch (searchKey) {
                case "ip":
                    queryWrapper.and(wrapper -> wrapper.like("ip", iSearchPageable.getSearchValue()));
                    break;
                case "location":
                    queryWrapper.and(wrapper -> wrapper.like("location", iSearchPageable.getSearchValue()));
                    break;
                case "content":
                    queryWrapper.and(wrapper -> wrapper.like("content", iSearchPageable.getSearchValue()));
                    break;
            }
        }
        if(null != iSearchPageable.getFilters()){
            SysLoginLogSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getUserId()) {
                queryWrapper.and(true, wrapper -> wrapper.eq("user_id", searchDTO.getUserId()));
            }

            if(null != searchDTO.getStatus()) {
                queryWrapper.and(true, wrapper -> wrapper.eq("status", searchDTO.getStatus().getCode()));
            }
            useBaseFilter(queryWrapper,searchDTO);
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysLoginLog> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysLoginLogDao.page(page,queryWrapper);
        ResultPage<SysLoginLogDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysLoginLogConvert.Instance.sysLoginLogsToSysLoginLogsDTO(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
