package com.jswl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@MapperScan(basePackages = "com.jswl.dao.mapper")
public class CrmApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CrmApiApplication.class, args);
    }
}
