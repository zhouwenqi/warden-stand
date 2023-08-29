package com.microwarp.warden.stand.admin.domain.mapstruct;

import com.microwarp.warden.stand.admin.domain.vo.SysPostCreateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPostUpdateRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysPostVO;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysPost
 * (vo 和 dto)
 *
 * @author zhouwenqi
 */
@Mapper
public interface SysPostMapstruct {
    SysPostMapstruct Instance = Mappers.getMapper(SysPostMapstruct.class);
    SysPostVO sysPostDtoToSysPostVO(SysPostDTO sysPostDTO);
    List<SysPostVO> sysPostsDtoToSysPostsVO(List<SysPostDTO> sysPostsDTO);
    SysPostDTO sysPostCreateRequestToSysPostDTO(SysPostCreateRequest sysPostRequest);
    SysPostDTO sysPostUpdateRequestToSysPostDTO(SysPostUpdateRequest sysPostRequest);
}
