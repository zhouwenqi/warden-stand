package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysDictionaryData;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDataDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;
import java.util.Set;

/**
 * 对象复制 - SysDictionaryData
 * (dto - entity)
 */
@Mapper
public interface SysDictionaryDataConvert {
    SysDictionaryDataConvert Instance = Mappers.getMapper(SysDictionaryDataConvert.class);
    SysDictionaryData sysDictionaryDataDtoToSysDictionaryData(SysDictionaryDataDTO sysDictionaryDataDTO);
    SysDictionaryDataDTO sysDictionaryDataToSysDictionaryDataDTO(SysDictionaryData sysDictionaryData);
    List<SysDictionaryDataDTO> sysDictionaryDatasToSysDictionaryDatasDTO(List<SysDictionaryData> sysDictionaryDatas);
}
