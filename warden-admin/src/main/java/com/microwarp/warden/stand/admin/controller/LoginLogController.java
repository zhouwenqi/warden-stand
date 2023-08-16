package com.microwarp.warden.stand.admin.controller;

import com.microwarp.warden.stand.admin.domain.mapstruct.SysLoginLogMapstruct;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.common.exception.WardenParamterErrorException;
import com.microwarp.warden.stand.common.exception.WardenRequireParamterException;
import com.microwarp.warden.stand.common.model.ResultModel;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * controller - 登录日志
 * @author zhouwenqi
 */
@RestController
public class LoginLogController extends BaseController {
    @Autowired
    private SysLoginLogService sysLoginLogService;

    /**
     * 获取登录日志信息
     * @param id 日志id
     * @return
     */
    @GetMapping("/loginLog/{id}")
    public ResultModel loginLog(@PathVariable("id") Long id){
        if(null == id){
            throw new WardenRequireParamterException("日志id不能为空");
        }
        ResultModel resultModel = ResultModel.success();
        SysLoginLogDTO sysLoginLogDTO = sysLoginLogService.findById(id);
        if(null == sysLoginLogDTO){
            throw new WardenParamterErrorException("日志信息不存在");
        }
        resultModel.addData("operationLog", SysLoginLogMapstruct.Instance.sysLoginLogDtoToSysLoginLogVO(sysLoginLogDTO));
        return resultModel;
    }

    /**
     * 分页查询登录日志信息
     * @param searchPageable 查询条件
     * @return
     */
    @PostMapping("/loginLogs/search")
    public ResultModel search(SearchPageable<SysLoginLogSearchDTO> searchPageable){
        ResultModel resultModel = ResultModel.success();
        ResultPage<SysLoginLogDTO> page = sysLoginLogService.findPage(searchPageable);
        resultModel.addData("list", SysLoginLogMapstruct.Instance.sysLoginLogsDtoToSysLoginLogsVO(page.getList()));
        resultModel.addData("pageInfo", page.getPageInfo());
        return resultModel;
    }

}
