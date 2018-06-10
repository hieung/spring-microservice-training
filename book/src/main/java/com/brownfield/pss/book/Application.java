package com.brownfield.pss.book;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

import com.brownfield.pss.book.repository.InventoryRepository;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
@EnableDiscoveryClient 
@SpringBootApplication
@EnableSwagger2
public class Application implements CommandLineRunner{
	
	private static final Logger logger = LoggerFactory.getLogger(Application.class);
 	
	@Autowired
	InventoryRepository inventoryRepository;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... strings) throws Exception {
		logger.info("Service initialized successfully.");
	}
	
}
