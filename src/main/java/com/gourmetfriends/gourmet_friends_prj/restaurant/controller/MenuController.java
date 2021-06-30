package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
@RequiredArgsConstructor
@Log4j2
public class MenuController {

    private final MenuService menuService;

    @GetMapping("/main")
    public void mainPage(){
        log.info("메인페이지 접속");
    }

    @GetMapping("/restaurant/menu_list")
    public void restMenuList(Long restNo, Model model){
        log.info("/restaurant/menu_list GET요청");

        List<Menu> restMenuList = menuService.restMenuList(restNo);

        model.addAttribute("restMenuList", restMenuList);
    }



}
