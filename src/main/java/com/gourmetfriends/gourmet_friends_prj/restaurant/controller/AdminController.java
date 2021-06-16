package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;
import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
@Log4j2
public class AdminController {

    private final RestaurantService restaurantService;

    //관리자 메인 페이지 접속
    @GetMapping("/manager")
    public String adminManager(){
        log.info("/admin/manager 관리자 페이지 이동");
        return "admin/manager";
    }

    //메뉴 관리 페이지 접속
    @GetMapping("/menu_manage")
    public String menuManage(){
        log.info("/admin/menu_manage 메뉴 관리 페이지 이동");
        return "admin/menu_manage";
    }

    //메뉴 등록 페이지 접속
    @GetMapping("/menu_insert")
    public String menuInsert(){
        log.info("/admin/menu_insert 메뉴 등록 페이지 이동");
        return "admin/menu_insert";
    }

    //음식점 관리 페이지 접속
    @GetMapping("/rest_manage")
    public String restManage(Criteria cri, Model model){
        log.info("/admin/rest_manage 음식점 관리 페이지 이동");
        List restList = restaurantService.restList(cri);

        if(!restList.isEmpty()){
            model.addAttribute("restList",restList);
        }else {
            model.addAttribute("restListChk","empty");
        }

        int total = restaurantService.restGetTotal(cri);

        model.addAttribute("pageInfo", new PageMaker(cri, restaurantService.restGetTotal(cri)));

        return "admin/rest_manage";
    }

    //음식점 등록 페이지 접속
    @GetMapping("/rest_insert")
    public String restInsert(){
        log.info("/admin/rest_insert 음식점 등록 페이지 이동");
        return "admin/rest_insert";
    }


}
