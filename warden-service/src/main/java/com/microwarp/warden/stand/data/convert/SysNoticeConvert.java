package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysNotice;
import com.microwarp.warden.stand.facade.sysnotice.dto.SysNoticeDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysNotice
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysNoticeConvert {
    SysNoticeConvert Instance = Mappers.getMapper(SysNoticeConvert.class);
    SysNoticeDTO sysNoticeToSysNoticeDTO(SysNotice sysNotice);
    SysNotice sysNoticeDtoToSysNotice(SysNoticeDTO sysNoticeDTO);
    List<SysNoticeDTO> sysNoticesToSysNoticeDTOs(List<SysNotice> sysNotices);
}
