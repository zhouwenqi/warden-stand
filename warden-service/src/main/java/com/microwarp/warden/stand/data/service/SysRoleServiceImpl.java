package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysRoleConvert;
import com.microwarp.warden.stand.data.dao.SysPermissionDao;
import com.microwarp.warden.stand.data.dao.SysRoleDao;
import com.microwarp.warden.stand.data.entity.SysRole;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDetailsDTO;
import com.microwarp.warden.stand.facade.sysrole.service.SysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
 * service - 系统角色 - impl
 * @author zhouwenqi
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private  SysPermissionDao sysPermissionDao;

    /**
     * 查询系统角色信息
     * @param id 角色id
     * @return
     */
    public SysRoleDTO findById(Long id){
        SysRole sysRole = sysRoleDao.getById(id);
        return null != sysRole ? SysRoleConvert.Instance.sysRoleToSysRoleDTO(sysRole) : null;
    }

    /**
     * 查询角色列表
     * @param ids 角色id
     * @return
     */
    public Set<SysRoleDTO> findByIds(Long...ids){
        return sysRoleDao.findByIds(ids);
    }

    /**
     * 查询系统角色详情
     * @param id 角色id
     * @return 角色详情
     */
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
    public void delete(Long... id){
         // 先删除角色与权限关系信息
         sysPermissionDao.deletePermissionByRoleIds(id);
         // 先删除角色与用户关系信息，和角色信息
         sysRoleDao.deleteByIds(id);
    }

    /**
     * 创建系统角色
     * @param sysRoleDTO 角色信息
     * @return 角色信息
     */
    @Transactional
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
    public void update(SysRoleDTO sysRoleDTO){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.ne("id",sysRoleDTO.getId());
        queryWrapper.eq("value",sysRoleDTO.getValue());
        if(sysRoleDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("角色值不能重复");
        }
        SysRole sysRole = SysRoleConvert.Instance.sysRoleDtoToSysSysRole(sysRoleDTO);
        sysRoleDao.updateById(sysRole);
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
    }

    /**
     * 查询角色列表
     * @param values 角色值
     * @return
     */
    public Set<SysRoleDTO> findByValues(String...values){
        return sysRoleDao.findByValues(values);
    }

    /**
     * 分页查询角色列表
     * @param iSearchPageable 查询条件
     * @return
     */
    public ResultPage<SysRoleDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("value", iSearchPageable.getSearchValue())
                    .or()
                    .likeLeft("description", iSearchPageable.getSearchValue())
            );
        }
        if(null != iSearchPageable.getFilters()){
            BasicSearchDTO searchDTO = iSearchPageable.getFilters();
            if(null != searchDTO.getCreateDate() && searchDTO.getCreateDate().length > 0){
                if(searchDTO.getCreateDate().length < 2){
                    queryWrapper.and(true, wrapper -> wrapper.ge("create_date",searchDTO.getCreateDate()[0]));
                }else{
                    queryWrapper.and(true, wrapper -> wrapper.between("create_date",searchDTO.getCreateDate()[0],searchDTO.getCreateDate()[1]));
                }
            }
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysRole> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysRoleDao.page(page,queryWrapper);
        ResultPage<SysRoleDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysRoleConvert.Instance.sysRolesToSysRolesDTO(page.getRecords()));
        pageInfo.setTotal(page.getTotal());
        pageInfo.setPageCount(page.getPages());
        pageInfo.setCurrent(page.getCurrent());
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }
}
