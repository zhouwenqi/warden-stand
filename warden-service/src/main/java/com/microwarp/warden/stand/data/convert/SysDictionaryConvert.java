package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysDictionary;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysDictionary
 * (dto - entity)
 *
 * 文献参考：https://mapstruct.org
 * @author zhouwenqi
 */
@Mapper
public interface SysDictionaryConvert {
    SysDictionaryConvert Instance = Mappers.getMapper(SysDictionaryConvert.class);
    SysDictionary sysDictionaryDtoToSysDictionary(SysDictionaryDTO sysDictionaryDTO);
    SysDictionaryDTO sysDictionaryToSysDictionaryDTO(SysDictionary sysDictionary);
    List<SysDictionaryDTO> sysDictionarysToSysDictionarysDTO(List<SysDictionary> sysDictionaries);
}
