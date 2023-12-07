package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.authentication.SecurityUser;
import com.microwarp.warden.stand.admin.config.WardenAdminConfig;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.admin.domain.vo.ProfilePasswordRequest;
import com.microwarp.warden.stand.admin.domain.vo.SysUserDetailsVO;
import com.microwarp.warden.stand.admin.domain.vo.SysUserProfileRequest;
import com.microwarp.warden.stand.admin.utils.ImageUtil;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.annotation.RepeatRequestCheck;
import com.microwarp.warden.stand.common.core.cache.ICacheService;
import com.microwarp.warden.stand.common.core.cache.RepeatData;
import com.microwarp.warden.stand.common.core.constant.CacheConstants;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.AesUtil;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserPasswordDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * controller - 个人信息
 * @author zhouwenqi
 */
@RestController
public class ProfileController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Resource
    private WardenAdminConfig wardenAdminConfig;
    /**
     * 获取当前用户信息
     * @return
     */
    @GetMapping("/profile")
    public ResultModel getProfile(){
        ResultModel resultModel = ResultModel.success();
        SysUserDetailsVO sysUserResponseVO = SysUserMapstruct.Instance.sysUserDetailsDtoToSysUserDetailsVo(getSecruityUser().getSysUser());
        sysUserResponseVO.setAuthorities(SecurityUtil.getAuthorityArray());
        resultModel.addData("user",sysUserResponseVO);
        return resultModel;
    }

    /**
     * 更新当前用户信息
     * @return
     */
    @PatchMapping("/profile")
    @RepeatRequestCheck
    public ResultModel putProfile(@RequestBody @Validated SysUserProfileRequest profileRequest){
        ResultModel resultModel = ResultModel.success();
        SysUserDTO sysUserDTO = SysUserMapstruct.Instance.sysUserProfileRequestToSysUserDTO(profileRequest);
        sysUserDTO.setId(getSecruityUser().getSysUser().getId());
        sysUserService.update(sysUserDTO);
        SecurityUser securityUser = getSecruityUser();
        // 写入日志
        writeLog("修改个人资料:"+securityUser.getUsername()+"["+sysUserDTO.getId()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_USER,sysUserDTO.getId());
        return resultModel;
    }

    /**
     * 更新当前用户密码
     * @return
     */
    @PutMapping("/profile/password")
    public ResultModel putProfilePassword(@RequestBody @Validated ProfilePasswordRequest passwordRequest){
        String oldPassword = passwordRequest.getOldPassword();
        SysUserDetailsDTO sysUserDetailsDTO = getSecruityUser().getSysUser();
        if(!bCryptPasswordEncoder.matches(oldPassword,sysUserDetailsDTO.getPwd())){
            throw new WardenRequireParamterException("原始密码错误");
        }
        SysUserPasswordDTO sysUserPasswordDTO = new SysUserPasswordDTO();
        sysUserPasswordDTO.setUserId(sysUserDetailsDTO.getId());
        sysUserPasswordDTO.setNewPassword(bCryptPasswordEncoder.encode(passwordRequest.getNewPassword()));
        sysUserService.updatePassowrd(sysUserPasswordDTO);

        // 写入日志
        writeLog("修改登录密码:"+sysUserDetailsDTO.getUid()+"["+sysUserPasswordDTO.getUserId()+"]", ActionTypeEnum.MODIFY, ModuleTypeEnum.SYS_USER,sysUserPasswordDTO.getUserId());
        return ResultModel.success();
    }

    /**
     * 上传用户头像
     * @param face
     * @return
     */
    @PutMapping("/profile/uploadface")
    public ResultModel uploadFace(@RequestParam("face") MultipartFile face){
        String baseDir = wardenAdminConfig.getFaceUploadDir();
        String baseUri = wardenAdminConfig.getFaceUri();
        if(!baseUri.endsWith("/")){
            baseUri += "/";
        }
        if(!baseDir.endsWith("/")){
            baseDir+="/";
        }
        String facePath = "";
        SysUserDetailsDTO userDetailsDTO = SecurityUtil.getCurrentSysUser();
        String extendName = ImageUtil.getExtendName(face.getContentType());
        if(StringUtils.isBlank(extendName)){
            throw new WardenParamterErrorException("头像文件错误");
        }
        try {
            String faceName = AesUtil.hexEncrypt(userDetailsDTO.getId().toString()) + "." + extendName;
            facePath = baseUri+faceName;
            File file = new File(baseDir + faceName);
            if(!file.exists()){
                file.mkdirs();
            }
            face.transferTo(file);
            SysUserDTO sysUserDTO = new SysUserDTO();
            sysUserDTO.setId(userDetailsDTO.getId());
            sysUserDTO.setFace(facePath);
            sysUserService.update(sysUserDTO);
        }
        catch (Exception e){
            logger.error("上传头像失败:{}",e.getMessage());
            throw new WardenParamterErrorException("上传头像失败");
        }
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("face",facePath);
        return resultModel;
    }
}
