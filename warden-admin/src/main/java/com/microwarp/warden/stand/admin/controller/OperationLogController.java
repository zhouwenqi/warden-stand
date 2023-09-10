package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysOperationLogMapstruct;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.dto.SysOperationLogSearchDTO;
import com.microwarp.warden.stand.facade.sysoperationlog.service.SysOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * controller - 操作日志
 * @author zhouwenqi
 */
@RestController
public class OperationLogController extends BaseController {
    @Autowired
    private SysOperationLogService sysOperationLogService;

    /**
     * 获取操作日志信息
     * @param id 日志id
     * @return
     */
    @GetMapping("/operationLog/{id}")
    @PreAuthorize("hasAuthority('operatoin:log:view')")
    public ResultModel operationLog(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("日志id不能为空");
        }
        ResultModel resultModel = ResultModel.success();
        SysOperationLogDTO sysOperationLogDTO = sysOperationLogService.findById(id);
        if(null == sysOperationLogDTO){
            throw new WardenParamterErrorException("日志信息不存在");
        }
        resultModel.addData("log", SysOperationLogMapstruct.Instance.sysOperationLogDtoToSysOperationLogVO(sysOperationLogDTO));
        return resultModel;
    }

    /**
     * 删除操作日志
     * @param id 日志id
     * @return
     */
    @DeleteMapping("/operationLog/{id}")
    @PreAuthorize("hasAuthority('operation:log:delete')")
    public ResultModel operationLogDelete(@PathVariable Long[] id){
        if(null != id && id.length > 0){
            sysOperationLogService.delete(id);
        }
        return ResultModel.success();
    }

    /**
     * 分页查询操作日志信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/operationLogs/search")
    @PreAuthorize("hasAuthority('operatoin:log:view')")
    public ResultModel search(SearchPageable<SysOperationLogSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysOperationLogDTO> page = sysOperationLogService.findPage(searchPageable);
        resultModel.addData("list", SysOperationLogMapstruct.Instance.sysOperationLogDtosToSysOperationLogVOs(page.getList()));
        resultModel.addData("pageInfo", page.getPageInfo());
        return resultModel;
    }
}
