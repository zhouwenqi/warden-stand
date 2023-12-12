package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.vo.GoogleVerifyRequest;
import com.microwarp.warden.stand.common.core.enums.*;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.GoogleAuthUtil;
import com.microwarp.warden.stand.common.utils.QrCodeUtil;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysconfig.dto.SysConfigDTO;
import com.microwarp.warden.stand.facade.sysconfig.service.SysConfigService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDetailsDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserBlipService;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.apache.commons.crypto.utils.IoUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;

/**
 * controller - google验证器
 * @author zhouwenqi
 */
@Controller
@RequestMapping("/googleauth")
public class GoogleAuthController extends BaseController {
    @Autowired
    private SysUserBlipService sysUserBlipService;
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private SysUserService sysUserService;

    /**
     * 直接获取密钥(secretKey)
     * @return 密钥
     */
    @GetMapping("secretKey")
    @ResponseBody
    public ResultModel getSecretKey(){
        String secretKey = GoogleAuthUtil.getSecretKey();
        ResultModel resultModel = ResultModel.success();
        resultModel.addData("secretKey",secretKey);
        return resultModel;
    }

    /**
     * 获取google验证二维码图片流
     * @param response
     * @throws Exception
     */
    @GetMapping("qrcode")
    public void qrcode(HttpServletResponse response) throws Exception {
        SysConfigDTO sysConfigDTO = sysConfigService.findCurrent();
        AgainVerifyTypeEnum againVerifyType = sysConfigDTO.getAgainVerify();
        if(null == againVerifyType || againVerifyType.equals(AgainVerifyTypeEnum.NONE)) {
            return;
        }
        response.setHeader("Cache-Control","no-store");
        response.setContentType("image/png");

        SysUserDetailsDTO user = getSecruityUser().getSysUser();
        String secretKey = user.getSecretKey();
        if(StringUtils.isBlank(secretKey)){
            secretKey = sysUserService.refreshSecretKey(user.getId());
            user.setSecretKey(secretKey);
        }

        String qrcodeContent = GoogleAuthUtil.getQrCodeContent(secretKey,user.getUid(),"warden-stand");
        ServletOutputStream outputStream = response.getOutputStream();
        QrCodeUtil.writeToStream(qrcodeContent,outputStream,300,300);
        IoUtils.closeQuietly(outputStream);
    }

    /**
     * 获取google验证二维码base64
     * @return
     */
    @GetMapping("base64")
    @ResponseBody
    public ResultModel base64(){
        SysConfigDTO sysConfigDTO = sysConfigService.findCurrent();
        AgainVerifyTypeEnum againVerifyType = sysConfigDTO.getAgainVerify();
        ResultModel resultModel = ResultModel.success();
        if(null == againVerifyType || againVerifyType.equals(AgainVerifyTypeEnum.NONE)) {
            resultModel.addData("imgData",null);
            return resultModel;
        }
        SysUserDetailsDTO user = getSecruityUser().getSysUser();
        String secretKey = user.getSecretKey();
        if(StringUtils.isBlank(secretKey)){
            secretKey = sysUserService.refreshSecretKey(user.getId());
            user.setSecretKey(secretKey);
        }
        try {
            String qrcodeContent = GoogleAuthUtil.getQrCodeContent(secretKey,user.getUid(),"warden-stand");
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            BufferedImage bufferedImage = QrCodeUtil.toBufferedImage(qrcodeContent, 300, 300);
            ImageIO.write(bufferedImage, "png", outputStream);
            resultModel.addData("imgData", Base64.getEncoder().encodeToString(outputStream.toByteArray()));
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return resultModel;
    }

    /**
     * 校验二次验证
     * @param request 校验请求
     * @return
     */
    @PostMapping("verify")
    @ResponseBody
    public ResultModel verify(@RequestBody @Validated GoogleVerifyRequest request){
        SysUserDetailsDTO user = getSecruityUser().getSysUser();
        String secretKey = user.getSecretKey();
        long code = Long.parseLong(request.getCode());
        if(GoogleAuthUtil.check(secretKey,code,System.currentTimeMillis())){
            String ip = WebUtil.getIpAddr();
            sysUserBlipService.delete(user.getId(),ip);
            // 写入日志
            writeLog("系统用户二次验证:["+ user.getUid()+"]", ActionTypeEnum.AGAIN_VERIFY, ModuleTypeEnum.SYS_USER,user.getId());
        }else{
            throw new WardenParamterErrorException("验证码错误");
        }
        return ResultModel.success();
    }
}
