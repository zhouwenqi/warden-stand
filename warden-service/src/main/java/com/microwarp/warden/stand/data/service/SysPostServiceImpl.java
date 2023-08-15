package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.utils.StringUtil;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysPostConvert;
import com.microwarp.warden.stand.data.dao.SysPostDao;
import com.microwarp.warden.stand.data.dao.SysUserDao;
import com.microwarp.warden.stand.data.entity.SysPost;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import com.microwarp.warden.stand.facade.syspost.service.SysPostService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * service - 岗位
 * @author zhouwenqi
 */
@Service
public class SysPostServiceImpl implements SysPostService {
    @Resource
    private SysPostDao sysPostDao;
    @Resource
    private SysUserDao sysUserDao;

    /**
     * 查询岗位信息
     * @param id 岗位id
     * @return
     */
    public SysPostDTO findById(Long id){
        return  sysPostDao.findById(id);
    }

    /**
     * 创建岗位信息
     * @param sysPostDTO 岗位信息
     * @return
     */
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
    }

    /**
     * 删除岗位信息
     * @param id 岗位id
     */
    @Transactional
    public void delete(Long... id){
        if(null == id || id.length < 1){
            return;
        }
        sysPostDao.removeBatchByIds(Arrays.asList(id));
        sysUserDao.clearPostId(id);
    }

    /**
     * 分页查询岗位信息
     * @param iSearchPageable 查询参数
     * @return
     */
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
        Page<SysPost> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysPostDao.page(page,queryWrapper);
        ResultPage<SysPostDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysPostConvert.Instance.sysPostToSysPostsDTO(page.getRecords()));
        resultPage.setPageInfo(pageInfo);
        return resultPage;
    }

}