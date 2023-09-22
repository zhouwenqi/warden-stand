package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.*;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysRoleConvert;
import com.microwarp.warden.stand.data.dao.SysPermissionDao;
import com.microwarp.warden.stand.data.dao.SysRoleDao;
import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;

/**
 * service - 系统角色 - impl
 * @author zhouwenqi
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements SysRoleService {
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private  SysPermissionDao sysPermissionDao;
    @Resource
    private SysUserService sysUserService;

    /**
     * 查询所有角色
     * @return
     */
    @Override
    public List<SysRoleDTO> findAll(){
        return sysRoleDao.findAll();
    }
    /**
     * 查询系统角色信息
     * @param id 角色id
     * @return
     */
    @Override
    public SysRoleDTO findById(Long id){
        SysRole sysRole = sysRoleDao.getById(id);
        return null != sysRole ? SysRoleConvert.Instance.sysRoleToSysRoleDTO(sysRole) : null;
    }

    /**
     * 查询角色列表
     * @param ids 角色id
     * @return
     */
    @Override
    public List<SysRoleDTO> findByIds(Long...ids){
        return sysRoleDao.findByIds(ids);
    }

    /**
     * 查询系统角色详情
     * @param id 角色id
     * @return 角色详情
     */
    @Override
    public SysRoleDetailsDTO findDetailsById(Long id){
        SysRoleDTO sysRoleDTO = findById(id);
        if(null == sysRoleDTO){
            return null;
        }
        SysRoleDetailsDTO sysRoleDetailsDTO = SysRoleConvert.Instance.sysRoleDtoToSysRoleDetailsDTO(sysRoleDTO);
        sysRoleDetailsDTO.setPermissions(new HashSet<>(sysPermissionDao.findByRoleIds(sysRoleDetailsDTO.getId())));
        return sysRoleDetailsDTO;
    }

    /**
     * 删除角色信息
     * @param id
     */
    @Transactional
    @Override
    public void delete(Long... id){
         // 先删除角色与权限关系信息
         sysPermissionDao.deletePermissionByRoleIds(id);
         // 先删除角色与用户关系信息，和角色信息
         sysRoleDao.deleteByIds(id);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 创建系统角色
     * @param sysRoleDTO 角色信息
     * @return 角色信息
     */
    @Transactional
    @Override
    public SysRoleDTO create(SysRoleDTO sysRoleDTO) {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("value",sysRoleDTO.getValue());
        if(sysRoleDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("角色值不能重复");
        }
        SysRole sysRole = SysRoleConvert.Instance.sysRoleDtoToSysSysRole(sysRoleDTO);
        sysRoleDao.save(sysRole);
        return findById(sysRole.getId());
    }

    /**
     * 更新角色信息
     * @param sysRoleDTO 角色信息
     */
    @Transactional
    @Override
    public void update(SysRoleDTO sysRoleDTO){
        if(null == sysRoleDTO.getId()){
            return;
        }
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.ne("id",sysRoleDTO.getId());
        queryWrapper.eq("value",sysRoleDTO.getValue());
        if(sysRoleDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("角色值不能重复");
        }
        SysRole sysRole = SysRoleConvert.Instance.sysRoleDtoToSysSysRole(sysRoleDTO);
        sysRoleDao.updateById(sysRole);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 角色拖拽排序
     * @param baseSortDTO 排序参数
     */
    @Transactional
    @Override
    public void dragAndSort(BaseSortDTO baseSortDTO){
        if(null != baseSortDTO.getIds() && baseSortDTO.getIds().length > 0){
            int i = 0;
            for(Long id:baseSortDTO.getIds()){
                UpdateWrapper<SysRole> updateWrapper = new UpdateWrapper<>();
                updateWrapper.set("orders",i);
                updateWrapper.eq("id",id);
                sysRoleDao.update(updateWrapper);
                i ++;
            }
        }
    }


    /**
     * 设置系统用户角色信息
     * @param userId 用户id
     * @param roleIds 角色id
     */
    @Override
    @Transactional
    public void saveUserRoles(Long userId, Long... roleIds) {
        sysRoleDao.saveUserRoles(userId, roleIds);
        // 清除用户缓存
        sysUserService.clearCache(userId);
    }

    /**
     * 查询角色列表
     * @param values 角色值
     * @return
     */
    @Override
    public List<SysRoleDTO> findByValues(String...values){
        return sysRoleDao.findByValues(values);
    }

    /**
     * 分页查询角色列表
     * @param iSearchPageable 查询条件
     * @return
     */
    @Override
    public ResultPage<SysRoleDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("value", iSearchPageable.getSearchValue())
                    .or()
                    .like("description", iSearchPageable.getSearchValue())
            );
        }
        if(null != iSearchPageable.getFilters()){
            useBaseFilter(queryWrapper,iSearchPageable.getFilters());
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysRole> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysRoleDao.page(page,queryWrapper);
        ResultPage<SysRoleDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysRoleConvert.Instance.sysRolesToSysRoleDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
