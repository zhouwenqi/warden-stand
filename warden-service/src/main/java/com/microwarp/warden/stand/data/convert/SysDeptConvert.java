package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysDept;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptTreeDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysDept
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysDeptConvert {
    SysDeptConvert Instance = Mappers.getMapper(SysDeptConvert.class);
    SysDeptDTO sysDeptToSysDeptDTO(SysDept sysDept);
    SysDept sysDeptDtoToSysDept(SysDeptDTO sysDeptDTO);
    SysDeptTreeDTO sysDeptToSysDeptTreeDTO(SysDept sysDept);
    List<SysDeptDTO> sysDeptsToSysDeptDTOs(List<SysDept> sysDepts);
    List<SysDeptTreeDTO> sysDeptsToSysDeptTreeDTOs(List<SysDept> sysDepts);
}
