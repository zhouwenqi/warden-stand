package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.*;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.utils.StringUtil;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysPostConvert;
import com.microwarp.warden.stand.data.dao.SysPostDao;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysPost;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import com.microwarp.warden.stand.facade.syspost.service.SysPostService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * service - 岗位
 * @author zhouwenqi
 */
@Service
public class SysPostServiceImpl extends BaseServiceImpl<SysPost> implements SysPostService {
    @Resource
    private SysPostDao sysPostDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysUserService sysUserService;

    /**
     * 查询岗位信息
     * @param id 岗位id
     * @return
     */
    @Override
    public SysPostDTO findById(Long id){
        return  sysPostDao.findById(id);
    }

    /**
     * 创建岗位信息
     * @param sysPostDTO 岗位信息
     * @return 岗位信息
     */
    @Override
    @Transactional
    public SysPostDTO create(SysPostDTO sysPostDTO){
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",sysPostDTO.getName());
        if(sysPostDao.count(queryWrapper)>0){
            throw new WardenParamterErrorException("部门名称不能重复");
        }
        // 岗位拼音处理
        if(StringUtils.isNotBlank(sysPostDTO.getName())){
            String[] pinyins = StringUtil.getPinyins(sysPostDTO.getName());
            sysPostDTO.setPinyin(pinyins[0]);
            sysPostDTO.setPy(pinyins[1]);
        }
        SysPost sysPost = SysPostConvert.Instance.sysPostDtoToSysPost(sysPostDTO);
        sysPostDao.save(sysPost);
        return findById(sysPost.getId());
    }

    /**
     * 更新岗位信息
     * @param sysPostDTO 岗位信息
     */
    @Override
    @Transactional
    public void update(SysPostDTO sysPostDTO){
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",sysPostDTO.getName());
        queryWrapper.ne("id",sysPostDTO.getId());
        if(sysPostDao.count(queryWrapper)>0){
            throw new WardenParamterErrorException("部门名称不能重复");
        }
        // 岗位拼音处理
        if(StringUtils.isNotBlank(sysPostDTO.getName())){
            String[] pinyins = StringUtil.getPinyins(sysPostDTO.getName());
            sysPostDTO.setPinyin(pinyins[0]);
            sysPostDTO.setPy(pinyins[1]);
        }
        SysPost sysPost = SysPostConvert.Instance.sysPostDtoToSysPost(sysPostDTO);
        sysPostDao.updateById(sysPost);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 岗位拖拽排序
     * @param baseSortDTO 排序参数
     */
    @Override
    @Transactional
    public void dragAndSort(BaseSortDTO baseSortDTO){
        if(null != baseSortDTO.getIds() && baseSortDTO.getIds().length > 0){
            int i = 0;
            for(Long id:baseSortDTO.getIds()){
                UpdateWrapper<SysPost> updateWrapper = new UpdateWrapper<>();
                updateWrapper.set("orders",i);
                updateWrapper.eq("id",id);
                sysPostDao.update(updateWrapper);
                i ++;
            }
        }
    }

    /**
     * 删除岗位信息
     * @param id 岗位id
     */
    @Override
    @Transactional
    public void delete(Long... id){
        if(null == id || id.length < 1){
            return;
        }
        sysPostDao.removeBatchByIds(Arrays.asList(id));
        sysUserDao.clearPostId(id);
        // 清除用户缓存
        sysUserService.clearAll();
    }

    /**
     * 获取所有岗位信息
     * @return 所有岗位列表
     */
    @Override
    public List<SysPostDTO> findAll(){
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("orders");
        List<SysPost> list = sysPostDao.list(queryWrapper);
        return null == list || list.size() < 1 ? new ArrayList<>() : SysPostConvert.Instance.sysPostsToSysPostsDTOs(list);
    }



    /**
     * 分页查询岗位信息
     * @param iSearchPageable 查询参数
     * @return
     */
    @Override
    public ResultPage<SysPostDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
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
            useBaseFilter(queryWrapper,iSearchPageable.getFilters());
        }
        PageInfo pageInfo = iSearchPageable.getPageInfo();
        Page<SysPost> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysPostDao.page(page,queryWrapper);
        ResultPage<SysPostDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysPostConvert.Instance.sysPostsToSysPostsDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }

}
