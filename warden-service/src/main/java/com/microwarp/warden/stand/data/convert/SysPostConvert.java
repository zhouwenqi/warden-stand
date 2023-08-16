package com.microwarp.warden.stand.data.convert;

import com.microwarp.warden.stand.data.entity.SysPost;
import com.microwarp.warden.stand.facade.syspost.dto.SysPostDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 对象复制 - SysPost
 * (dto - entity)
 * @author zhouwenqi
 */
@Mapper
public interface SysPostConvert {
    SysPostConvert Instance = Mappers.getMapper(SysPostConvert.class);
    SysPostDTO sysPostToSysPostDTO(SysPost sysPost);
    List<SysPostDTO> sysPostToSysPostsDTO(List<SysPost> sysPosts);
    SysPost sysPostDtoToSysPost(SysPostDTO sysPostDTO);

}
