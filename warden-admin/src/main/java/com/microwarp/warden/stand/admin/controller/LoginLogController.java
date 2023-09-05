package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysLoginLogMapstruct;
import com.microwarp.warden.stand.admin.service.ExcelExportService;
import com.microwarp.warden.stand.admin.service.LogService;
import com.microwarp.warden.stand.admin.utils.SecurityUtil;
import com.microwarp.warden.stand.common.core.enums.ActionTypeEnum;
import com.microwarp.warden.stand.common.core.enums.AppTerminalEnum;
import com.microwarp.warden.stand.common.core.enums.ModuleTypeEnum;
import com.microwarp.warden.stand.common.core.enums.PlatformTypeEnum;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.common.utils.WebUtil;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

/**
 * controller - 登录日志
 * @author zhouwenqi
 */
@RestController
public class LoginLogController extends BaseController {
    @Autowired
    private SysLoginLogService sysLoginLogService;
    @Autowired
    private ExcelExportService excelExportService;
    @Autowired
    private LogService logService;

    /**
     * 获取登录日志信息
     * @param id 日志id
     * @return
     */
    @GetMapping("/loginLog/{id}")
    @PreAuthorize("hasAuthority('login:log:view')")
    public ResultModel loginLog(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("日志id不能为空");
        }
        ResultModel resultModel = ResultModel.success();
        SysLoginLogDTO sysLoginLogDTO = sysLoginLogService.findById(id);
        if(null == sysLoginLogDTO){
            throw new WardenParamterErrorException("日志信息不存在");
        }
        resultModel.addData("log", SysLoginLogMapstruct.Instance.sysLoginLogDtoToSysLoginLogVO(sysLoginLogDTO));
        return resultModel;
    }


    /**
     * 删除登录日志
     * @param id 日志id
     * @return
     */
    @DeleteMapping("/loginLog/{id}")
    @PreAuthorize("hasAuthority('login:log:delete')")
    public ResultModel loginLogDelete(@PathVariable Long[] id){
        if(null != id && id.length > 0){
            sysLoginLogService.delete(id);
            // 写入日志
            writeLog("删除登录日志:["+ Arrays.toString(id)+"]", ActionTypeEnum.EXPORT, ModuleTypeEnum.LOGIN_LOG,id);
        }
        return ResultModel.success();
    }

    /**
     * 分页查询登录日志信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/loginLogs/search")
    @PreAuthorize("hasAuthority('login:log:view')")
    public ResultModel search(@RequestBody SearchPageable<SysLoginLogSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysLoginLogDTO> page = sysLoginLogService.findPage(searchPageable);
        resultModel.addData("list", SysLoginLogMapstruct.Instance.sysLoginLogsDtoToSysLoginLogsVO(page.getList()));
        resultModel.addData("pageInfo", page.getPageInfo());
        return resultModel;
    }

    /**
     * 导出Excel数据
     * @param searchPageable 查询条件
     * @throws IOException
     */
    @PostMapping("/loginLogs/export")
    @PreAuthorize("hasAuthority('data:export')")
    public void export(@RequestBody SearchPageable<SysLoginLogSearchDTO> searchPageable,HttpServletResponse response) throws IOException{
        String fileName = "登录日志"+System.currentTimeMillis();
        excelExportService.sysLoginLogPageData(fileName, "日志列表", response, searchPageable);

        // 写入日志
        writeLog("导出登录日志数据:"+fileName, ActionTypeEnum.EXPORT, ModuleTypeEnum.LOGIN_LOG,null);
    }
}
