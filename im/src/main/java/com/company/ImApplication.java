package com.company;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.company.bean.PageBean;

@SpringBootApplication
@MapperScan("com.company.dao")
public class ImApplication implements CommandLineRunner{
	
	@Autowired
	PageBean bean;

	public static void main(String[] args) {
		SpringApplication.run(ImApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println(bean);
		System.out.println(bean.getPageCount());
	}

}
