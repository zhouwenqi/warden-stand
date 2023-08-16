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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public ResultModel operationLog(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("日志id不能为空");
        }
        ResultModel resultModel = ResultModel.success();
        SysOperationLogDTO sysOperationLogDTO = sysOperationLogService.findById(id);
        if(null == sysOperationLogDTO){
            throw new WardenParamterErrorException("日志信息不存在");
        }
        resultModel.addData("operationLog", SysOperationLogMapstruct.Instance.sysOperationLogDtoToSysOperationLogVO(sysOperationLogDTO));
        return resultModel;
    }

    /**
     * 分页查询操作日志信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/operationLogs/search")
    public ResultModel search(SearchPageable<SysOperationLogSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysOperationLogDTO> page = sysOperationLogService.findPage(searchPageable);
        resultModel.addData("list", SysOperationLogMapstruct.Instance.sysOperationLogsDtoToSysOperationLogsVO(page.getList()));
        resultModel.addData("pageInfo", page.getPageInfo());
        return resultModel;
    }

}
