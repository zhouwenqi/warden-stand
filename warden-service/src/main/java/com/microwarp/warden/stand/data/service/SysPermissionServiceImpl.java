package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysPermissionConvert;
import com.microwarp.warden.stand.data.dao.SysPermissionDao;
import com.microwarp.warden.stand.data.entity.SysPermission;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionSearchDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * service - 系统权限 - impl
 * @author zhouwenqi
 */
@Service
public class SysPermissionServiceImpl implements SysPermissionService {
    @Resource
    private SysPermissionDao sysPermissionDao;
    @Resource
    private SysUserService sysUserService;

    /**
     * 查询所有权限
     * @return
     */
    public List<SysPermissionDTO> findAll(){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("orders");
        List<SysPermission> list = sysPermissionDao.list(queryWrapper);
        if(null == list || list.size() < 1)
        {
            return new ArrayList<>();
        }
        return SysPermissionConvert.Instance.sysPermissionsToSysPermissionsDTO(list);
    }

    /**
     * 查询权限信息
     * @param id 权限id
     * @return 权限信息
     */
    public SysPermissionDTO findById(Long id){
        SysPermission sysPermission = sysPermissionDao.getById(id);
        return null == sysPermission ? null : SysPermissionConvert.Instance.sysPermissionToSysPermissionDTO(sysPermission);
    }

    /**
     * 创建权限
     * @param sysPermissionDTO 权限内容
     * @return 权限信息
     */
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
    @Transactional
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
    @Transactional
    public void delete(Long... id){
        sysPermissionDao.delete(id);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 保存角色权限关联信息
     * @param roleId 角色id
     * @param permissionIds 权限id
     */
    @Transactional
    public void saveRolePermission(Long roleId,Long... permissionIds){
        sysPermissionDao.saveRolePermission(roleId, permissionIds);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 根据权限id查询权限列表
     * @param ids 权限值
     * @return
     */
    public List<SysPermissionDTO> findByIds(Long... ids){
        return sysPermissionDao.findByIds(ids);
    }

    /**
     * 分页查询权限信息
     * @param iSearchPageable 查询条件
     * @return
     */
    public ResultPage<SysPermissionDTO> findPage(ISearchPageable<SysPermissionSearchDTO> iSearchPageable){
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("value", iSearchPageable.getSearchValue())
            );
        }

        if(null != iSearchPageable.getFilters()){
            SysPermissionSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getCreateDate() && searchDTO.getCreateDate().length > 0){
                if(searchDTO.getCreateDate().length < 2){
                    queryWrapper.and(true, wrapper -> wrapper.ge("create_date",searchDTO.getCreateDate()[0]));
                }else{
                    queryWrapper.and(true, wrapper -> wrapper.between("create_date",searchDTO.getCreateDate()[0],searchDTO.getCreateDate()[1]));
                }
            }

        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysPermission> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysPermissionDao.page(page,queryWrapper);
        ResultPage<SysPermissionDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysPermissionConvert.Instance.sysPermissionsToSysPermissionsDTO(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
