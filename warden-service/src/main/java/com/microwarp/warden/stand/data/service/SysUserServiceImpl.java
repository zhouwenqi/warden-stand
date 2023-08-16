package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.utils.StringUtil;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysUserConvert;
import com.microwarp.warden.stand.data.dao.*;
import com.microwarp.warden.stand.data.entity.SysUser;
import com.microwarp.warden.stand.facade.sysrole.dto.SysRoleDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.*;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashSet;

/**
 * service - 系统用户 - impl
 * @author zhouwenqi
 */
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUser> implements SysUserService {
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private SysUserLockDao sysUserLockDao;
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private SysPostDao sysPostDao;
    @Resource
    private SysPermissionDao sysPermissionDao;

    @Override
    public SysUserDTO findById(Long id){
        SysUserDTO sysUserDTO = sysUserDao.findById(id);
        if(null == sysUserDTO) {
            return null;
        }
        sysUserDTO.setLocked(sysUserLockDao.isLocked(sysUserDTO.getId()));
        return sysUserDTO;
    }

    /**
     * 查询用户基本信息
     * @param uid  用户名(帐号)
     * @return
     */
    @Override
    public SysUserDTO findByUid(String uid){
        SysUserDTO sysUserDTO = sysUserDao.findByUid(uid);
        if(null == sysUserDTO) {
            return null;
        }
        sysUserDTO.setLocked(sysUserLockDao.isLocked(sysUserDTO.getId()));
        return sysUserDTO;
    }
    @Override
    public SysUserDetailsDTO findDetailsById(Long id){
        SysUserDTO sysUserDTO = findById(id);
        return findDetailsByUserDTO(sysUserDTO);
    }
    /**
     * 查询用户详情
     * @param uid 用户名(帐号)
     * @return
     */
    @Override
    public SysUserDetailsDTO findDetailsByUid(String uid){
        SysUserDTO sysUserDTO = findByUid(uid);
        return findDetailsByUserDTO(sysUserDTO);
    }

    /**
     * 插入系统用户
     * @param sysUserDTO 用户信息
     * @return
     */
    @Override
    @Transactional
    public Long insert(SysUserDTO sysUserDTO){
        if(null != findByUid(sysUserDTO.getUid())){
            throw new WardenRequireParamterException("用户已存在");
        }
        // 真实姓名拼音处理
        if(StringUtils.isNotBlank(sysUserDTO.getRealName())){
            String[] pinyins = StringUtil.getPinyins(sysUserDTO.getRealName());
            sysUserDTO.setPinyin(pinyins[0]);
            sysUserDTO.setPy(pinyins[1]);
        }
        SysUser sysUser = SysUserConvert.Instance.sysUserDtoToSysUser(sysUserDTO);
        sysUserDao.save(sysUser);
        return sysUser.getId();
    }

    /**
     * 创建系统用户
     * @param sysUserRequestDTO 用户信息
     * @return
     */
    @Override
    @Transactional
    public Long create(SysUserRequestDTO sysUserRequestDTO){
        Long userId = insert(sysUserRequestDTO);
        if(null != sysUserRequestDTO.getRoleIds()){
            sysRoleDao.saveUserRoles(userId,sysUserRequestDTO.getRoleIds());
        }
        return userId;
    }

    /**
     * 更新用户信息
     * @param sysUserDTO 用户信息
     */
    public void update(SysUserDTO sysUserDTO){
        // 真实姓名拼音处理
        if(StringUtils.isNotBlank(sysUserDTO.getRealName())){
            String[] pinyins = StringUtil.getPinyins(sysUserDTO.getRealName());
            sysUserDTO.setPinyin(pinyins[0]);
            sysUserDTO.setPy(pinyins[1]);
        }
        SysUser sysUser = SysUserConvert.Instance.sysUserDtoToSysUser(sysUserDTO);
        sysUserDao.updateById(sysUser);
    }

    /**
     * 更新用户密码
     * @param sysUserPasswordDTO 密码参数
     */
    public void updatePassowrd(SysUserPasswordDTO sysUserPasswordDTO){
        if(null == sysUserPasswordDTO.getUserId()){
            throw new WardenRequireParamterException();
        }
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("pwd",sysUserPasswordDTO.getNewPassword());
        updateWrapper.eq("id",sysUserPasswordDTO.getUserId());

        sysUserDao.update(updateWrapper);
    }

    /**
     * 根据DTO用户信息查询用户详情
     * @param sysUserDTO 用户信息
     * @return
     */
    private SysUserDetailsDTO findDetailsByUserDTO(SysUserDTO sysUserDTO){
        if(null == sysUserDTO){
            return null;
        }
        SysUserDetailsDTO sysUserDetailsDTO = SysUserConvert.Instance.sysUserDtoToUserDetailsDTO(sysUserDTO);
        sysUserDetailsDTO.setRoles(sysRoleDao.findByUserId(sysUserDTO.getId()));
        sysUserDetailsDTO.setDept(sysDeptDao.findById(sysUserDTO.getDeptId()));
        sysUserDetailsDTO.setPost(sysPostDao.findById(sysUserDTO.getPostId()));
        Long[] roleIds = sysUserDetailsDTO.getRoles().stream().map(SysRoleDTO::getId).toArray(Long[]::new);
        sysUserDetailsDTO.setPermissions(new HashSet<>(sysPermissionDao.findByRoleIds(roleIds)));
        return sysUserDetailsDTO;
    }

    public ResultPage<SysUserDTO> findPage(ISearchPageable<SysUserSearchDTO> iSearchPageable){
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("uid", iSearchPageable.getSearchValue())
                    .or()
                    .like("real_name", iSearchPageable.getSearchValue())
                    .or()
                    .likeLeft("py", iSearchPageable.getSearchValue())
                    .or()
                    .likeLeft("pinyin", iSearchPageable.getSearchValue())
            );
        }
        if(null != iSearchPageable.getFilters()){
            useBaseFilter(queryWrapper,iSearchPageable.getFilters());
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysUser> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysUserDao.page(page,queryWrapper);
        ResultPage<SysUserDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysUserConvert.Instance.sysUsersToSysUsersDTO(page.getRecords()));
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }

    /**
     * 删除系统用户
     * @param userId 用户id
     */
    @Transactional
    public void delete(Long userId){
        sysUserDao.removeById(userId);
        sysRoleDao.deleteRoleByUserId(userId);
    }
}
