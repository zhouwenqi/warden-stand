package com.microwarp.warden.stand.data.basic;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * service - 基类服务 - impl
 * @author zhouwenqi
 */
public class BaseServiceImpl<T,D extends BaseDao<T>> implements BaseService {
    @Autowired
    protected D dao;
}
