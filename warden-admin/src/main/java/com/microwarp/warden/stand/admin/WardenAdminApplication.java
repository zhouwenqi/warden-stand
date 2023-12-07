package com.microwarp.warden.stand.admin;

import com.microwarp.warden.stand.common.utils.GoogleAuthUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;



@EnableCaching
@SpringBootApplication
public class WardenAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(WardenAdminApplication.class, args);
		try {
			String secretKey = GoogleAuthUtil.getSecretKey();
			System.out.println("key:"+secretKey);
			String code = GoogleAuthUtil.getCode(secretKey);
			System.out.println("code:"+code);
			boolean verify = GoogleAuthUtil.check(secretKey,Long.parseLong(code),System.currentTimeMillis());
			System.out.println("verify:"+verify);
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}
