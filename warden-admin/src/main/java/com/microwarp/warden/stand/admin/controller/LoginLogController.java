package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysLoginLogMapstruct;
import com.microwarp.warden.stand.admin.service.ExcelExportService;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
    @DeleteMapping("/logionLog/{id}")
    @PreAuthorize("hasAuthority('login:log:delete')")
    public ResultModel loginLogDelete(@PathVariable Long[] id){
        if(null != id && id.length > 0){
            sysLoginLogService.delete(id);
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
    public ResultModel search(SearchPageable<SysLoginLogSearchDTO> searchPageable){
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
    }
}
