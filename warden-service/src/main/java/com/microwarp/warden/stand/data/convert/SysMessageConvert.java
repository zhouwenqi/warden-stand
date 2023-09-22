package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysMessage;
import com.microwarp.warden.stand.facade.sysmessage.dto.SysMessageDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysMessage
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysMessageConvert {
    SysMessageConvert Instance = Mappers.getMapper(SysMessageConvert.class);
    SysMessageDTO sysMessageToSysMessageDTO(SysMessage sysMessage);
    SysMessage sysMessageDtoToSysMessage(SysMessageDTO sysMessageDTO);
    List<SysMessageDTO> sysMessagesToSysMessageDTOs(List<SysMessage> sysMessages);
}
