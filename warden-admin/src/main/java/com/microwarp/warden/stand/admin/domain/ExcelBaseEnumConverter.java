package com.microwarp.warden.stand.admin.domain;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import com.microwarp.warden.stand.common.core.enums.BaseEnum;

/**
 * easyexcel 枚举转换
 */
public class ExcelBaseEnumConverter implements Converter<BaseEnum> {
    @Override
    public Class supportJavaTypeKey(){
        return BaseEnum.class;
    }
    @Override
    public CellDataTypeEnum supportExcelTypeKey(){
        return CellDataTypeEnum.STRING;
    }
    @Override
    public BaseEnum convertToJavaData(ReadCellData cellData, ExcelContentProperty contentProperty, GlobalConfiguration configuration){
        String value = cellData.getStringValue();
        return BaseEnum.tagOfEnum(BaseEnum.class,value);
    }
    @Override
    public WriteCellData convertToExcelData(BaseEnum baseEnum, ExcelContentProperty contentProperty, GlobalConfiguration configuration){
        return new WriteCellData(baseEnum.getTag());
    }
}
