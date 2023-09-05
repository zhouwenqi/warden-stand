package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysOperationLogConvert;
import com.microwarp.warden.stand.data.dao.SysOperationLogDao;
import com.microwarp.warden.stand.data.entity.SysOperationLog;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogSearchDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.service.SysOperationLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * service - 操作日志 - impl
 * @author zhouwenqi
 */
@Service
public class SysOperationLogServiceImpl extends BaseServiceImpl<SysOperationLog> implements SysOperationLogService {
    @Resource
    private SysOperationLogDao sysOperationLogDao;

    /**
     * 查询操作日志信息
     * @param id 日志id
     * @return
     */
    public SysOperationLogDTO findById(Long id){
        return sysOperationLogDao.findById(id);
    }

    /**
     * 添加操作日志信息
     * @param sysOperationLogDTO 日志信息
     */
    public void add(SysOperationLogDTO sysOperationLogDTO){
        SysOperationLog sysOperationLog = SysOperationLogConvert.Instance.sysOperationLogDtoToSysOperationLog(sysOperationLogDTO);
        sysOperationLogDao.save(sysOperationLog);
    }

    /**
     * 删除操作日志
     * @param id 日志id
     */
    public void delete(Long... id){
        sysOperationLogDao.delete(id);
    }

    /**
     * 清空操作日志
     */
    public void clearAll(){
        sysOperationLogDao.clearAll();
    }

    /**
     * 分页查询操作日志
     * @param iSearchPageable 查询条件
     * @return
     */
    public ResultPage<SysOperationLogDTO> findPage(ISearchPageable<SysOperationLogSearchDTO> iSearchPageable){
        QueryWrapper<SysOperationLog> queryWrapper = new QueryWrapper<>();
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
            SysOperationLogSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getUserId()) {
                queryWrapper.and(true, wrapper -> wrapper.eq("user_id", searchDTO.getUserId()));
            }
            if(null != searchDTO.getMateId()) {
                queryWrapper.and(true, wrapper -> wrapper.eq("mate_id", searchDTO.getMateId()));
            }
            if(null != searchDTO.getActionType() && searchDTO.getActionType().length > 0) {
                queryWrapper.and(true, wrapper -> wrapper.in("action_type", Arrays.asList(searchDTO.getActionType())));
            }
            if(null != searchDTO.getModuleType() && searchDTO.getModuleType().length > 0) {
                queryWrapper.and(true, wrapper -> wrapper.eq("module_type", Arrays.asList(searchDTO.getModuleType())));
            }
            useBaseFilter(queryWrapper,searchDTO);
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysOperationLog> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysOperationLogDao.page(page,queryWrapper);
        ResultPage<SysOperationLogDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysOperationLogConvert.Instance.sysOperationLogsToSysOperationLogsDTO(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
