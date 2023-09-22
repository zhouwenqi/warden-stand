package com.microwarp.warden.stand.admin.domain.mapstruct;
import com.microwarp.warden.stand.admin.domain.vo.SysNoticeCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysNoticeUpdateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysNoticeVO;
import com.microwarp.warden.stand.facade.sysnotice.dto.SysNoticeDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;


/**
 * 对象复制 - SysNotice
 * (vo 和 dto)
 * @author zhouwenqi
 */
@Mapper
public interface SysNoticeMapstruct {
    SysNoticeMapstruct Instance = Mappers.getMapper(SysNoticeMapstruct.class);

    SysNoticeVO sysNoticeDtoToSysNoticeVO(SysNoticeDTO sysNoticeDTO);

    List<SysNoticeVO> sysNoticeDTOsToSysNoticeVOs(List<SysNoticeDTO> sysNoticeDTOS);

    SysNoticeDTO sysNoticeCreateRequestToSysNoticeDTO(SysNoticeCreateRequest sysNoticeCreateRequest);

    SysNoticeDTO sysNoticeUpdateRequestToSysNoticeDTO(SysNoticeUpdateRequest sysNoticeUpdateRequest);
}
