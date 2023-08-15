package com.microwarp.warden.stand.data.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * config - 写操作数据库自动填充
 * @author zhouwenqi
 * @version 1.0.0
 */
@Component
public class AutoFullHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject){
        this.strictInsertFill(metaObject,"createDate",Date.class,new Date());
        this.strictInsertFill(metaObject,"updateDate",Date.class,new Date());
        this.strictInsertFill(metaObject,"orders",Integer.class,0);
        this.strictInsertFill(metaObject,"disabled",Boolean.class, false);
    }
    @Override
    public void updateFill(MetaObject metaObject){
        this.strictUpdateFill(metaObject,"updateDate",Date.class,new Date());
    }
}
