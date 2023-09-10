package com.microwarp.warden.stand.admin.service;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.microwarp.warden.stand.admin.domain.excel.SysLoginLogExcel;
import com.microwarp.warden.stand.admin.domain.excel.SysPermissionExcel;
import com.microwarp.warden.stand.admin.domain.excel.SysUserExcel;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysLoginLogMapstruct;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysPermissionMapstruct;
import com.microwarp.warden.stand.admin.domain.mapstruct.SysUserMapstruct;
import com.microwarp.warden.stand.common.core.pageing.BasicSearchDTO;
import com.microwarp.warden.stand.common.core.pageing.ResultPage;
import com.microwarp.warden.stand.common.core.pageing.SearchPageable;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogDTO;
import com.microwarp.warden.stand.facade.sysloginlog.dto.SysLoginLogSearchDTO;
import com.microwarp.warden.stand.facade.sysloginlog.service.SysLoginLogService;
import com.microwarp.warden.stand.facade.syspermission.dto.SysPermissionDTO;
import com.microwarp.warden.stand.facade.syspermission.service.SysPermissionService;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserDTO;
import com.microwarp.warden.stand.facade.sysuser.dto.SysUserSearchDTO;
import com.microwarp.warden.stand.facade.sysuser.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * service - 导出excel
 * 统一异常拦截已经在 AdminExceptionController 处理了
 */
@Service
public class ExcelExportService {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysPermissionService sysPermissionService;
    @Autowired
    private SysLoginLogService sysLoginLogService;

    /**
     * 设置输出头并返回工作薄名称
     * @param fileName 文件名(不带扩展名)
     * @param response 输出对象
     * @return 完整工作薄名称
     * @throws IOException
     */
    private String useResponse(String fileName, HttpServletResponse response) throws IOException{
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        String excelName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment;filename=" + excelName + ".xlsx");
        response.setHeader("Access-Control-Expose-Headers","Content-disposition");
        return excelName;
    }

    /**
     * 导出系统用户数据
     * @param fileName 文件名(工作薄名称)
     * @param sheetName 表名(工作表名称)
     * @param response 输出对象
     * @param searchPageable 查询条件
     * @throws IOException
     */
    public void sysUserPageData(String fileName, String sheetName, HttpServletResponse response, SearchPageable<SysUserSearchDTO> searchPageable) throws IOException{
        useResponse(fileName, response);
        ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream(), SysUserExcel.class).autoCloseStream(false).build();
        WriteSheet writeSheet = EasyExcel.writerSheet(sheetName).build();
        ResultPage<SysUserDTO> page = sysUserService.findPage(searchPageable);
        for(int i=1;i<=page.getPageInfo().getPageCount();i++){
            if(i > 1){
                searchPageable.getPageInfo().setCurrent(i);
                page = sysUserService.findPage(searchPageable);
            }
            List<SysUserExcel> list = SysUserMapstruct.Instance.sysUsersDtoToSysUsersExcel(page.getList());
            excelWriter.write(list,writeSheet);
        }
        excelWriter.finish();
        excelWriter.close();
    }

    /**
     * 导出系统权限数据
     * @param fileName 文件名(工作薄名称)
     * @param sheetName 表名(工作表名称)
     * @param response 输出对象
     * @param searchPageable 查询条件
     * @throws IOException
     */
    public void sysPermissionPageData(String fileName, String sheetName, HttpServletResponse response, SearchPageable<BasicSearchDTO> searchPageable) throws IOException{
        useResponse(fileName, response);
        ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream(), SysPermissionExcel.class).autoCloseStream(false).build();
        WriteSheet writeSheet = EasyExcel.writerSheet(sheetName).build();
        ResultPage<SysPermissionDTO> page = sysPermissionService.findPage(searchPageable);
        for(int i=1;i<=page.getPageInfo().getPageCount();i++){
            if(i > 1){
                searchPageable.getPageInfo().setCurrent(i);
                page = sysPermissionService.findPage(searchPageable);
            }
            List<SysPermissionExcel> list = SysPermissionMapstruct.Instance.sysPermissionDtosToSysPermissionExcels(page.getList());
            excelWriter.write(list,writeSheet);
        }
        excelWriter.finish();
        excelWriter.close();
    }

    /**
     * 导出登录日志数据
     * @param fileName 文件名(工作薄名称)
     * @param sheetName 表名(工作表名称)
     * @param response 输出对象
     * @param searchPageable 查询条件
     * @throws IOException
     */
    public void sysLoginLogPageData(String fileName, String sheetName,  HttpServletResponse response, SearchPageable<SysLoginLogSearchDTO> searchPageable) throws IOException{
        useResponse(fileName, response);
        ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream(), SysLoginLogExcel.class).autoCloseStream(false).build();
        WriteSheet writeSheet = EasyExcel.writerSheet(sheetName).build();
        ResultPage<SysLoginLogDTO> page = sysLoginLogService.findPage(searchPageable);
        for(int i=1;i<=page.getPageInfo().getPageCount();i++){
            if(i > 1){
                searchPageable.getPageInfo().setCurrent(i);
                page = sysLoginLogService.findPage(searchPageable);
            }
            List<SysLoginLogExcel> list = SysLoginLogMapstruct.Instance.sysLoginLogDtosToSysLoginLogExcels(page.getList());
            excelWriter.write(list,writeSheet);
        }
        excelWriter.finish();
        excelWriter.close();
    }
}
