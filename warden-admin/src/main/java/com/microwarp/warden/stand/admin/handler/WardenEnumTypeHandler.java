package com.microwarp.warden.stand.admin.handler;

import com.microwarp.warden.stand.common.core.enums.BaseEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * warden枚举mybatis转换器
 */
public class WardenEnumTypeHandler<E extends Enum<?> & BaseEnum> extends BaseTypeHandler<BaseEnum> {
    private Class<E> type;
    public WardenEnumTypeHandler(Class<E> type){
        if(null == type){
            throw new IllegalArgumentException("Enum type argument cannot be null");
        }
        this.type = type;
    }
    @Override
    public void setNonNullParameter(PreparedStatement parameter,int i, BaseEnum baseEnum,JdbcType jdbcType) throws SQLException {
        parameter.setInt(i, baseEnum.getCode());
    }
    @Override
    public E getNullableResult(ResultSet resultSet,String columnName) throws SQLException {
        int i = resultSet.getInt(columnName);
        if(resultSet.wasNull()) {
            return null;
        }
        try{
            return BaseEnum.codeOfEnum(type,i);
        }catch (Exception e){
            throw new IllegalArgumentException("Cannot convert " + i + " to "+type.getSimpleName() +" by ordinal value");
        }

    }
    @Override
    public E getNullableResult(ResultSet resultSet,int columnIndex) throws SQLException {
        int i = resultSet.getInt(columnIndex);
        if(resultSet.wasNull()) {
            return null;
        }
        try{
            return BaseEnum.codeOfEnum(type,i);
        }catch (Exception e){
            throw new IllegalArgumentException("Cannot convert " + i + " to "+type.getSimpleName() +" by ordinal value");
        }

    }
    @Override
    public E getNullableResult(CallableStatement callableStatement, int columnIndex) throws SQLException {
        int i = callableStatement.getInt(columnIndex);
        if (callableStatement.wasNull()) {
            return null;
        }
        try {
            return BaseEnum.codeOfEnum(type, i);
        } catch (Exception e) {
            throw new IllegalArgumentException("Cannot convert " + i + " to " + type.getSimpleName() + " by index value");
        }
    }
}
