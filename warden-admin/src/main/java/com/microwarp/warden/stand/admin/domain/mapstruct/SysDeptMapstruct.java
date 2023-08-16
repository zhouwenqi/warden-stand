package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.SysDeptRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysDeptVO;
import com.microwarp.warden.stand.facade.sysdept.dto.SysDeptDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysDept
 * (vo 和 dto)
 * @author zhouwenqi
 */
@Mapper
public interface SysDeptMapstruct {
    SysDeptMapstruct Instance = Mappers.getMapper(SysDeptMapstruct.class);
    SysDeptVO sysDeptDtoToSysDeptVO(SysDeptDTO sysDeptDTO);
    List<SysDeptVO> sysDeptsDtoToSysDeptsVO(List<SysDeptDTO> sysDeptsDTO);
    SysDeptDTO sysDeptRequestToSysDeptDTO(SysDeptRequest sysDeptRequest);
}
