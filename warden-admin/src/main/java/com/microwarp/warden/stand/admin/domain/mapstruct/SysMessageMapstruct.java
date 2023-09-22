package com.microwarp.warden.stand.admin.domain.mapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysMessageVO;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;


/**
 * 对象复制 - SysMessage
 * (vo 和 dto)
 * @author zhouwenqi
 */
@Mapper
public interface SysMessageMapstruct {
    SysMessageMapstruct Instance = Mappers.getMapper(SysMessageMapstruct.class);
    SysMessageVO sysMessageDtoToSysMessageVO(SysMessageDTO sysMessageDTO);
    List<SysMessageVO> sysMessageDTOsToSysMessageVOs(List<SysMessageDTO> sysMessageDTOS);
}
