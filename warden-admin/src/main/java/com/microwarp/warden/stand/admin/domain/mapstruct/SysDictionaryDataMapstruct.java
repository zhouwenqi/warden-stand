package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryDataRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryDataVO;
import com.microwarp.warden.stand.common.dictionary.DictionaryItem;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysDictionaryData
 * (vo 和 dto)
 *
 * @author zhouwenqi
 */
@Mapper
public interface SysDictionaryDataMapstruct {
    SysDictionaryDataMapstruct Instance = Mappers.getMapper(SysDictionaryDataMapstruct.class);
    SysDictionaryDataVO sysDictionaryDataDtoToSysDictionaryDataVO(SysDictionaryDataDTO sysDictionaryDataDTO);
    List<SysDictionaryDataVO> sysDictionaryDatasDtoToSysDictionaryDatasVO(List<SysDictionaryDataDTO> sysDictionarysDTO);
    SysDictionaryDataDTO sysDictionaryDataRequestToSysDictionaryDataDTO(SysDictionaryDataRequest sysDictionaryDataRequest);
    DictionaryItem sysDictionaryDataDtoToDictionaryItem(SysDictionaryDataDTO sysDictionaryDataDTO);
    List<DictionaryItem> sysDictionaryDatasDtoToDictionaryItems(List<SysDictionaryDataDTO> sysDictionarysDTO);
}
