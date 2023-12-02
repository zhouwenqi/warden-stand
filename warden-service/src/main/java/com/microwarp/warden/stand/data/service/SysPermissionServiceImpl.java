package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.core.pageing.*;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysPermissionConvert;
import com.microwarp.warden.stand.data.dao.SysPermissionDao;
import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.data.entity.SysPermission;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionTreeDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
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
 * service - 系统权限 - impl
 * @author zhouwenqi
 */
@Service
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermission> implements SysPermissionService {
    @Resource
    private SysPermissionDao sysPermissionDao;
    @Resource
    private SysUserService sysUserService;

    /**
     * 查询所有权限
     * @return 权限信息
     */
    @Override
    public List<SysPermissionDTO> findAll(){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("orders");
        List<SysPermission> list = sysPermissionDao.list(queryWrapper);
        if(null == list || list.size() < 1)
        {
            return new ArrayList<>();
        }
        return SysPermissionConvert.Instance.sysPermissionsToSysPermissionDTOs(list);
    }

    /**
     * 查询权限信息
     * @param id 权限id
     * @return 权限信息
     */
    @Override
    public SysPermissionDTO findById(Long id){
        SysPermissionDTO sysPermissionDTO = sysPermissionDao.findById(id);
        recursionParent(sysPermissionDTO);
        return sysPermissionDTO;
    }

    /**
     * 查询权限信息(含子级权限列表)
     * @param id 权限ID
     * @return 权限信息
     */
    public SysPermissionTreeDTO findChildrenById(Long id){
        SysPermission sysPermission = sysPermissionDao.getById(id);
        if(null == sysPermission){
            return null;
        }
        SysPermissionTreeDTO sysPermissionTreeDTO = SysPermissionConvert.Instance.sysPermissionToSysPermissionTreeDTO(sysPermission);
        sysPermissionTreeDTO.setChildren(sysPermissionDao.findByParentId(sysPermission.getParentId()));
        return  sysPermissionTreeDTO;
    }
    /**
     * 创建权限
     * @param sysPermissionDTO 权限内容
     * @return 权限信息
     */
    @Override
    @Transactional
    public SysPermissionDTO create(SysPermissionDTO sysPermissionDTO){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("value",sysPermissionDTO.getValue());
        if(sysPermissionDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("权限值不能重复");
        }
        SysPermission sysPermission = SysPermissionConvert.Instance.sysPermissionDtoToSysPermission(sysPermissionDTO);
        sysPermissionDao.save(sysPermission);
        return findById(sysPermission.getId());
    }

    /**
     * 更新权限信息
     * @param sysPermissionDTO 权限信息
     */
    @Override
    @Transactional
    @CacheEvict(value = CacheConstants.CACHE_PERMISSION_TREE, allEntries = true)
    public void update(SysPermissionDTO sysPermissionDTO){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.ne("id",sysPermissionDTO.getId());
        queryWrapper.eq("value",sysPermissionDTO.getValue());
        if(sysPermissionDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("权限值不能重复");
        }
        SysPermission sysPermission = SysPermissionConvert.Instance.sysPermissionDtoToSysPermission(sysPermissionDTO);
        sysPermissionDao.updateById(sysPermission);

        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 删除权限信息
     * @param id 权限id
     */
    @Override
    @Transactional
    @CacheEvict(value = CacheConstants.CACHE_PERMISSION_TREE, allEntries = true)
    public void delete(Long... id){
        if(null == id || id.length < 1){
            return;
        }
        List<Long> ids = new ArrayList<>();
        recursionIds(Arrays.asList(id),ids);
        sysPermissionDao.delete(ids.toArray(new Long[ids.size()]));
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 保存角色权限关联信息
     * @param roleId 角色id
     * @param permissionIds 权限id
     */
    @Override
    @Transactional
    public void saveRolePermission(Long roleId,Long... permissionIds){
        sysPermissionDao.saveRolePermission(roleId, permissionIds);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 权限拖拽排序
     * @param baseSortDTO 排序参数
     */
    @Override
    @Transactional
    @CacheEvict(value = CacheConstants.CACHE_PERMISSION_TREE, allEntries = true)
    public void dragAndSort(BaseSortDTO baseSortDTO){
        if(null != baseSortDTO.getParentId() && null != baseSortDTO.getDragId()){
            SysPermission sysPermission = new SysPermission();
            sysPermission.setParentId(baseSortDTO.getParentId());
            sysPermission.setId(baseSortDTO.getDragId());
            sysPermissionDao.updateById(sysPermission);
            // 清除用户缓存
            sysUserService.clearAll();
        }
        if(null != baseSortDTO.getIds() && baseSortDTO.getIds().length > 0){
            int i = 0;
            for(Long id:baseSortDTO.getIds()){
                UpdateWrapper<SysPermission> updateWrapper = new UpdateWrapper<>();
                updateWrapper.set("orders",i);
                updateWrapper.eq("id",id);
                sysPermissionDao.update(updateWrapper);
                i ++;
            }
        }
    }

    /**
     * 递归查询父级权限信息
     * @param sysPermissionDTO 权限信息
     */
    private void recursionParent(SysPermissionDTO sysPermissionDTO){
        if(null != sysPermissionDTO.getParentId() && sysPermissionDTO.getParentId() > 0){
            sysPermissionDTO.setParentPermission(findById(sysPermissionDTO.getParentId()));
            if(null != sysPermissionDTO.getParentPermission()){
                recursionParent(sysPermissionDTO.getParentPermission());
            }
        }
    }

    /**
     * 递归获取下级权限列表
     * @param list 权限列表
     */
    private void recursionChildren(List<SysPermissionTreeDTO> list){
        if(null == list || list.size() < 1){
            return;
        }
        for(SysPermissionTreeDTO sysPermissionTreeDTO:list){
            List<SysPermissionTreeDTO> sysPermissionTreeDTOS = sysPermissionDao.findByParentId(sysPermissionTreeDTO.getId());
            sysPermissionTreeDTO.setChildren(sysPermissionTreeDTOS.size() < 1 ? null : sysPermissionTreeDTOS);
            recursionChildren(sysPermissionTreeDTO.getChildren());
        }
    }

    /**
     * 递归获取所有权限ID
     * @param ids 下级权限ID列表
     * @param permissionIds 权限ID平铺列表
     */
    @Override
    public void recursionIds(List<Long> ids,List<Long> permissionIds){
        if(ids != null && ids.size() > 0){
            permissionIds.addAll(ids);
            for (Long id:ids){
                QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
                queryWrapper.select("id");
                queryWrapper.eq("parent_id",id);
                List<SysPermission> sysPermissions = sysPermissionDao.list(queryWrapper);
                if(null != sysPermissions && sysPermissions.size()>0){
                    recursionIds(sysPermissions.stream().map(SysPermission::getId).collect(Collectors.toList()),permissionIds);
                }
            }
        }
    }

    /**
     * 根据权限id查询权限列表
     * @param ids 权限值
     * @return 权限列表
     */
    @Override
    public List<SysPermissionDTO> findByIds(Long... ids){
        return sysPermissionDao.findByIds(ids);
    }

    /**
     * 获取所有权限树
     * @return 权限树
     */
    @Override
    @Cacheable(value = CacheConstants.CACHE_PERMISSION_TREE, key="'tree'", unless = "#result.size() < 1")
    public List<SysPermissionTreeDTO> findTrees(){
        List<SysPermissionTreeDTO> root = sysPermissionDao.findByParentId(0L);
        recursionChildren(root);
        return root;
    }

    /**
     * 分页查询权限信息
     * @param iSearchPageable 查询条件
     * @return 权限列表
     */
    @Override
    public ResultPage<SysPermissionDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("value", iSearchPageable.getSearchValue())
            );
        }

        if(null != iSearchPageable.getFilters()){
            useBaseFilter(queryWrapper,iSearchPageable.getFilters());

        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysPermission> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysPermissionDao.page(page,queryWrapper);
        ResultPage<SysPermissionDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysPermissionConvert.Instance.sysPermissionsToSysPermissionDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
