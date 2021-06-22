package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.MenuService;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/restaurant")
@RequiredArgsConstructor
@Log4j2
public class RestaurantController {

    private final RestaurantService restaurantService;
    private final MenuService menuService;

    @GetMapping("/main")
    public void mainPage(){
        log.info("메인페이지 접속");
    }

    @GetMapping("/rest_list")
    public void restList(@RequestParam("c") String cateCode, @RequestParam("l") Long tier, Model model){
        log.info("/restaurant/rest_list GET요청");

       List<Restaurant> restCateList = restaurantService.restCateList(cateCode, tier);

       model.addAttribute("restCateList",restCateList);
    }
    
}
