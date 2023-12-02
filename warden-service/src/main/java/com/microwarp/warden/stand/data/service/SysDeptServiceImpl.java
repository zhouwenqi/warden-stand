package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.core.pageing.BaseSortDTO;
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
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;
import com.microwarp.warden.stand.facade.sysdept.service.SysDeptService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * service - 部门 - impl
 * @author zhouwenqi
 */
@Service
public class SysDeptServiceImpl implements SysDeptService {
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysUserService sysUserService;

    /**
     * 查询部门信息(含上级部门信息)
     * @param id 部门id
     * @return 部门信息
     */
    @Override
    public SysDeptDTO findById(Long id){
        SysDeptDTO sysDeptDTO = sysDeptDao.findById(id);
        recursionParent(sysDeptDTO);
        return sysDeptDTO;
    }

    /**
     * 获取部门信息(含子部门列表)
     * @param id 部门id
     * @return 商门信息
     */
    @Override
    public SysDeptTreeDTO findChildrenById(Long id){
        SysDept sysDept = sysDeptDao.getById(id);
        if(null == sysDept){
            return null;
        }
        SysDeptTreeDTO sysDeptTreeDTO = SysDeptConvert.Instance.sysDeptToSysDeptTreeDTO(sysDept);
        sysDeptTreeDTO.setChildren(sysDeptDao.findByParentId(sysDept.getParentId()));
        return sysDeptTreeDTO;
    }

    /**
     * 创建部门
     * @param sysDeptDTO 部门信息
     * @return 部门信息
     */
    @Override
    @Transactional
    @CacheEvict(value = CacheConstants.CACHE_DEPT_TREE, allEntries = true)
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
    @Transactional
    @Override
    @CacheEvict(value = CacheConstants.CACHE_DEPT_TREE, allEntries = true)
    public void update(SysDeptDTO sysDeptDTO){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",sysDeptDTO.getName());
        queryWrapper.ne("id",sysDeptDTO.getId());
        if(sysDeptDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("部门名称不能重复");
        }
        SysDept sysDept = SysDeptConvert.Instance.sysDeptDtoToSysDept(sysDeptDTO);
        sysDeptDao.updateById(sysDept);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 部门拖曳和排序
     * @param baseSortDTO 排序数据
     */
    @Transactional
    @Override
    @CacheEvict(value = CacheConstants.CACHE_DEPT_TREE, allEntries = true)
    public void dragAndSort(BaseSortDTO baseSortDTO){
        if(null != baseSortDTO.getParentId() && null != baseSortDTO.getDragId()){
            SysDept sysDept = new SysDept();
            sysDept.setParentId(baseSortDTO.getParentId());
            sysDept.setId(baseSortDTO.getDragId());
            sysDeptDao.updateById(sysDept);
            // 清除用户缓存
            sysUserService.clearAll();
        }
        if(null != baseSortDTO.getIds() && baseSortDTO.getIds().length > 0){
            int i = 0;
            for(Long id:baseSortDTO.getIds()){
                UpdateWrapper<SysDept> updateWrapper = new UpdateWrapper<>();
                updateWrapper.set("orders",i);
                updateWrapper.eq("id",id);
                sysDeptDao.update(updateWrapper);
                i ++;
            }
        }
    }

    /**
     * 删除部门信息
     * @param id 部门id
     */
    @Transactional
    @Override
    @CacheEvict(value = CacheConstants.CACHE_DEPT_TREE, allEntries = true)
    public void delete(Long...id){
        if(null == id || id.length < 1){
            return;
        }
        List<Long> ids = new ArrayList<>();
        recursionIds(Arrays.asList(id),ids);
        sysDeptDao.removeBatchByIds(ids);
        sysUserDao.clearDeptId(ids.toArray(new Long[ids.size()]));
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 递归获取父级部门
     * @param sysDeptDTO 当门部门
     */
    private void recursionParent(SysDeptDTO sysDeptDTO){
        if(sysDeptDTO.getParentId() != null && sysDeptDTO.getParentId() > 0){
            sysDeptDTO.setParentDept(findById(sysDeptDTO.getParentId()));
            if(null != sysDeptDTO.getParentDept()) {
                recursionParent(sysDeptDTO.getParentDept());
            }
        }
    }

    /**
     * 递归获取下级部门列表
     * @param list 部门列表
     */
    private void recursionChildren(List<SysDeptTreeDTO> list){
        if(null == list || list.size() < 1){
            return;
        }
        for(SysDeptTreeDTO sysDeptTreeDTO:list){
            List<SysDeptTreeDTO> children = sysDeptDao.findByParentId(sysDeptTreeDTO.getId());
            sysDeptTreeDTO.setChildren(children.size() < 1 ? null : children);
            recursionChildren(sysDeptTreeDTO.getChildren());
        }
    }

    /**
     * 递归获取所有部门ID
     * @param ids 下级部门ID列表
     * @param deptIds 部门ID平铺列表
     */
    @Override
    public void recursionIds(List<Long> ids,List<Long> deptIds){
        if(ids != null && ids.size() > 0){
            deptIds.addAll(ids);
            for (Long id:ids){
                QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
                queryWrapper.select("id");
                queryWrapper.eq("parent_id",id);
                List<SysDept> sysDepts = sysDeptDao.list(queryWrapper);
                if(null != sysDepts && sysDepts.size()>0){
                   recursionIds(sysDepts.stream().map(SysDept::getId).collect(Collectors.toList()),deptIds);
                }
            }
        }
    }

    /**
     * 获取部门树型结构
     * @return 树型数据
     */
    @Override
    @Cacheable(value = CacheConstants.CACHE_DEPT_TREE, key="'tree'", unless = "#result.size() < 1")
    public List<SysDeptTreeDTO> findTrees(){
        List<SysDeptTreeDTO> root = sysDeptDao.findByParentId(0L);
        recursionChildren(root);
        return root;
    }

    /**
     * 分页查询部门信息
     * @param iSearchPageable 查询参数
     * @return 部门列表
     */
    @Override
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
        resultPage.setList(SysDeptConvert.Instance.sysDeptsToSysDeptDTOs(page.getRecords()));
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
