package com.microwarp.warden.stand.admin;

import com.microwarp.warden.stand.common.utils.AesUitl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
public class WardenAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(WardenAdminApplication.class, args);
		System.out.println(AesUitl.generateKey());
	}
}
