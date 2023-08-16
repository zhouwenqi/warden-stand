package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDictionaryVO;
import com.microwarp.warden.stand.facade.sysdictionary.dto.SysDictionaryDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysDictionary
 * (vo 和 dto)
 *
 * @author zhouwenqi
 */
@Mapper
public interface SysDictionaryMapstruct {
    SysDictionaryMapstruct Instance = Mappers.getMapper(SysDictionaryMapstruct.class);
    SysDictionaryVO sysDictionaryDtoToSysDictionaryVO(SysDictionaryDTO sysDictionaryDTO);
    List<SysDictionaryVO> sysDictionarysDtoToSysDictionarysVO(List<SysDictionaryDTO> sysDictionarysDTO);
    SysDictionaryDTO sysDictionaryRequestToSysDictionaryDTO(SysDictionaryRequest sysDictionaryRequest);
}
