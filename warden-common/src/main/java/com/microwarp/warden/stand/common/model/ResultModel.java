package com.microwarp.warden.stand.common.model;

import com.microwarp.warden.stand.common.utils.JsonUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * warden统一返回数据模型
 * @author zhouwenqi
 */
public class ResultModel implements IResultModel {
    /**
     * 返回状态码
     */
    private int code;
    /**
     * 返回消息
     */
    private String msg;
    /**
     * 返回数据
     */
    private Map<String,Object> data;

    public static ResultModel success(){
        return new ResultModel(ResultCode.SUCCESS);
    }

    public static ResultModel success(String message){
        return new ResultModel(ResultCode.SUCCESS,message);
    }

    public ResultModel(){
        this.code = ResultCode.SUCCESS.getCode();
        this.msg = ResultCode.SUCCESS.getMessage();
    }

    public ResultModel(int code,String msg){
        this.code = code;
        this.msg = msg;
    }

    public ResultModel(ResultCode code, String msg){
        this.code = code.getCode();
        this.msg = msg;
    }

    public ResultModel(ResultCode code){
        this.code = code.getCode();
        this.msg = code.getMessage();
    }

    public ResultModel(IResultModel iResultModel){
        this.code = iResultModel.getCode();
        this.msg = iResultModel.getMsg();
        this.data = iResultModel.getData();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setCode(ResultCode resultCode){
        this.code = resultCode.getCode();
        this.msg = resultCode.getMessage();
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    /**
     * 追加返回数据
     * @param data 追加数据
     */
    public ResultModel addData(Map<String,Object> data){
        if(null == data){
            return null;
        }
        if(null == this.data) this.data = new HashMap<String, Object>();
        this.data.putAll(data);
        return this;
    }

    /**
     * 追回一组返回数据
     * @param key 键
     * @param object 数据对象
     */
    public ResultModel addData(String key,Object object){
        if(null == object){
            return null;
        }
        if(null == this.data) this.data = new HashMap<String, Object>();
        this.data.put(key,object);
        return this;
    }

    @Override
    public String toString() {
        return "{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + JsonUtil.objectToJson(data) +
                '}';
    }
}
