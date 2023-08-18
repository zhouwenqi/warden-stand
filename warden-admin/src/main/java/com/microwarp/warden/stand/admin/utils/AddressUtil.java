package com.microwarp.warden.stand.admin.utils;

import com.microwarp.warden.stand.admin.domain.pojo.Address;
import com.microwarp.warden.stand.common.utils.JsonUtil;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * address - util
 * @author zhouwenqi
 */
public class AddressUtil {

    /**
     * 通过IP地址在线获取完整的地址信息
     * @param ip IP地址
     * @return
     */
    public static Address getAddress(String ip){
        String url = "http://whois.pconline.com.cn/ipJson.jsp?json=true&ip="+ip;
        RestTemplate restTemplate = new RestTemplate();
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(3 * 1000);
        factory.setReadTimeout(5 * 1000);
        restTemplate.setRequestFactory(factory);
        Address address = null;
        try {
            String result = restTemplate.getForObject(url, String.class);
            address = JsonUtil.jsonToObject(result,Address.class);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return address;
    }

    /**
     * 通过IP地址在线获取省份和城市信息
     * @param ip
     * @return
     */
    public static String getLocation(String ip){
        Address address = getAddress(ip);
        if(null == address){
            return null;
        }
        return address.getPro()+"-"+address.getCity();
    }
}
