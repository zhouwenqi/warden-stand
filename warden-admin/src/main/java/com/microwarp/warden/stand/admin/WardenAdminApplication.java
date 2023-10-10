package com.microwarp.warden.stand.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;



@EnableCaching
@SpringBootApplication
public class WardenAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(WardenAdminApplication.class, args);
	}
}
