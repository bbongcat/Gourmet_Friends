package com.gourmetfriends.gourmet_friends_prj.user.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
@Log4j2
public class AdminController {

    //관리자 메인 페이지 접속
    @GetMapping("/manager")
    public String adminManager(){
        log.info("/admin/manager 관리자 페이지 이동");
        return "admin/manager";
    }

    //메뉴 관리 페이지 접속

    //메뉴 등록 페이지 접속

    //음식점 등록 페이지 접속

    //음식점 관리 페이지 접속 


}
