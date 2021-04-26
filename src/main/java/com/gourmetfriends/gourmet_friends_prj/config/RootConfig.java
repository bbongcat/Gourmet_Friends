package com.gourmetfriends.gourmet_friends_prj.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

//mysql DataSource 정보
@Configuration
@ComponentScan(basePackages = "com.gourmetfriends.gourmet_friends_prj")
public class RootConfig {

    //DB 접속정보 DataSource 등록
    @Bean
    public DataSource dataSource(){
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
        hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/gourmet_friends?serverTimeZone=Asia/Seoul&characterEncoding=UTF-8");
        hikariConfig.setUsername("gourmet");
        hikariConfig.setPassword("1234");

        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;
    }


}
