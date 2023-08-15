package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysDeptConvert;
import com.microwarp.warden.stand.data.dao.SysDeptDao;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptSearchDTO;
import com.microwarp.warden.stand.facade.sysdept.service.SysDeptService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * service - 部门
 * @author zhouwenqi
 */
@Service
public class SysDeptServiceImpl implements SysDeptService {
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private SysUserDao sysUserDao;

    /**
     * 查询部门信息
     * @param id 部门id
     * @return
     */
    public SysDeptDTO findById(Long id){
        return sysDeptDao.findById(id);
    }

    /**
     * 创建部门
     * @param sysDeptDTO 部门信息
     * @return
     */
    public SysDeptDTO create(SysDeptDTO sysDeptDTO){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",sysDeptDTO.getName());
        if(sysDeptDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("部门名称不能重复");
        }
        SysDept sysDept = SysDeptConvert.Instance.sysDeptDtoToSysDept(sysDeptDTO);
        sysDeptDao.save(sysDept);
        return findById(sysDept.getId());
    }

    /**
     * 更新部门信息
     * @param sysDeptDTO 部门id
     */
    public void update(SysDeptDTO sysDeptDTO){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",sysDeptDTO.getName());
        queryWrapper.ne("id",sysDeptDTO.getId());
        if(sysDeptDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("部门名称不能重复");
        }
        SysDept sysDept = SysDeptConvert.Instance.sysDeptDtoToSysDept(sysDeptDTO);
        sysDeptDao.updateById(sysDept);
    }

    /**
     * 删除部门信息
     * @param id 部门id
     */
    @Transactional
    public void delete(Long...id){
        if(null == id || id.length < 1){
            return;
        }
        sysDeptDao.removeBatchByIds(Arrays.asList(id));
        sysUserDao.clearDeptId(id);
    }

    /**
     * 分页查询部门信息
     * @param iSearchPageable 查询参数
     * @return
     */
    public ResultPage<SysDeptDTO> findPage(ISearchPageable<SysDeptSearchDTO> iSearchPageable){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("code", iSearchPageable.getSearchValue())
                    .or()
                    .like("description", iSearchPageable.getSearchValue())
                    .or()
                    .likeLeft("py", iSearchPageable.getSearchValue())
                    .or()
                    .likeLeft("pinyin", iSearchPageable.getSearchValue())
            );
        }
        if(null != iSearchPageable.getFilters()){
            SysDeptSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getLeaderId()){
                queryWrapper.and(true, wrapper -> wrapper.eq("leader_id",searchDTO.getLeaderId()));
            }
            if(null != searchDTO.getDisabled()){
                queryWrapper.and(true, wrapper -> wrapper.eq("disabled",searchDTO.getDisabled()));
            }
            if(null != searchDTO.getCreateDate() && searchDTO.getCreateDate().length > 0){
                if(searchDTO.getCreateDate().length < 2){
                    queryWrapper.and(true, wrapper -> wrapper.ge("create_date",searchDTO.getCreateDate()[0]));
                }else{
                    queryWrapper.and(true, wrapper -> wrapper.between("create_date",searchDTO.getCreateDate()[0],searchDTO.getCreateDate()[1]));
                }
            }
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysDept> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysDeptDao.page(page,queryWrapper);
        ResultPage<SysDeptDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysDeptConvert.Instance.sysDeptsToSysDeptsDTO(page.getRecords()));
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
