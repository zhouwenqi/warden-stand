package com.microwarp.warden.stand.data.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ISearchPageable;
import com.microwarp.warden.stand.common.core.pageing.PageInfo;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.data.convert.PageConvert;
import com.microwarp.warden.stand.data.convert.SysDictionaryConvert;
import com.microwarp.warden.stand.data.dao.SysDictionaryDao;
import com.microwarp.warden.stand.data.dao.SysDictionaryDataDao;
import com.microwarp.warden.stand.data.entity.SysDictionary;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;
import com.microwarp.warden.stand.facade.sysdictionary.service.SysDictionaryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * service - 字典
 * @author zhouwenqi
 */
@Service
public class SysDictionaryServiceImpl implements SysDictionaryService {
    @Resource
    private SysDictionaryDao sysDictionaryDao;
    @Resource
    private SysDictionaryDataDao sysDictionaryDataDao;
    @Resource
    private ICacheService iCacheService;



    /**
     * 查询字典信息
     * @param id 字典id
     * @return
     */
    public SysDictionaryDTO findById(Long id){
        return sysDictionaryDao.findById(id);
    }

    /**
     * 查询字典信息
     * @param code 字典编码
     * @return
     */
    public SysDictionaryDTO findByCode(String code){
        return sysDictionaryDao.findByCode(code);
    }

    /**
     * 创建字典
     * @param sysDictionaryDTO 字典信息
     * @return
     */
    @Transactional
    public SysDictionaryDTO create(SysDictionaryDTO sysDictionaryDTO){
        QueryWrapper<SysDictionary> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("code",sysDictionaryDTO.getCode());
        if(sysDictionaryDao.count(queryWrapper) > 0){
            throw new WardenParamterErrorException("字典编码不能重复");
        }
        SysDictionary sysDictionary = SysDictionaryConvert.Instance.sysDictionaryDtoToSysDictionary(sysDictionaryDTO);
        sysDictionaryDao.save(sysDictionary);
        return findById(sysDictionary.getId());
    }

    /**
     * 更新字典
     * @param sysDictionaryDTO 字典信息
     */
    @Transactional
    public void update(SysDictionaryDTO sysDictionaryDTO){
        if(null == sysDictionaryDTO.getId()){
            return;
        }
        SysDictionary dictionary = sysDictionaryDao.getById(sysDictionaryDTO.getId());
        if(null == dictionary){
            throw new WardenParamterErrorException("字典不存在");
        }
        QueryWrapper<SysDictionary> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(sysDictionaryDTO.getCode())){
            queryWrapper.eq("code",sysDictionaryDTO.getCode());
            queryWrapper.ne("id",sysDictionaryDTO.getId());
            if(sysDictionaryDao.count(queryWrapper) > 0){
                throw new WardenParamterErrorException("字典编码不能重复");
            }
            // 手动删除缓存
            iCacheService.batchRemove(CacheConstants.CACHE_DICT_DATAS, dictionary.getCode());
        }

        SysDictionary sysDictionary = SysDictionaryConvert.Instance.sysDictionaryDtoToSysDictionary(sysDictionaryDTO);
        sysDictionaryDao.updateById(sysDictionary);
    }

    /**
     * 删除字典信息
     * @param id 字典id
     */
    @Transactional
    public void delete(Long...id){
        if(null == id || id.length < 1){
            return;
        }
        sysDictionaryDao.removeBatchByIds(Arrays.asList(id));
        sysDictionaryDataDao.deleteByDictId(id);
        // 手动删除缓存
        String[] dictCodes = sysDictionaryDao.findDCodeByIds(id);
        if(dictCodes.length> 0){
            iCacheService.batchRemove(CacheConstants.CACHE_DICT_DATAS, dictCodes);
        }
    }

    /**
     * 分页查询字典信息
     * @param iSearchPageable 查询参数
     * @return
     */
    public ResultPage<SysDictionaryDTO> findPage(ISearchPageable<BasicSearchDTO> iSearchPageable){
        QueryWrapper<SysDictionary> queryWrapper = new QueryWrapper<>();
        if(StringUtils.isNotBlank(iSearchPageable.getSearchValue())) {
            queryWrapper.and(wrapper -> wrapper
                    .like("name", iSearchPageable.getSearchValue())
                    .or()
                    .like("code", iSearchPageable.getSearchValue())
                    .or()
                    .like("description", iSearchPageable.getSearchValue())
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
        Page<SysDictionary> page = new Page<>(pageInfo.getCurrent(),pageInfo.getPageSize());
        page.setOrders(PageConvert.Instance.sortFieldsToOrderItems(iSearchPageable.getSorts()));
        sysDictionaryDao.page(page,queryWrapper);
        ResultPage<SysDictionaryDTO> resultPage = new ResultPage<>();
        resultPage.setList(SysDictionaryConvert.Instance.sysDictionarysToSysDictionaryDTOs(page.getRecords()));
        pageInfo = PageConvert.Instance.pageToPageInfo(page);
        resultPage.setPageInfo(pageInfo);

        return resultPage;
    }
}
