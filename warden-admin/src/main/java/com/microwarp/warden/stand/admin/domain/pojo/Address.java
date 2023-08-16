package com.microwarp.warden.stand.admin.domain.pojo;

/**
 * 地址信息
 */
public class Address {
    /** ip */
    private String ip;
    /** 省份 */
    private String pro;
    /** 省份代码 */
    private String proCode;
    /** 城市 */
    private String city;
    /** 城市代码 */
    private String cityCode;
    /** 区域 */
    private String region;
    /** 区域代码 */
    private String regionCode;
    /** 地址 */
    private String addr;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
