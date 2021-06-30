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
@RequiredArgsConstructor
@Log4j2
public class RestaurantController {

    private final RestaurantService restaurantService;

    @GetMapping("/restaurant")
    public void mainPage(){
        log.info("메인페이지 접속");
    }

    @GetMapping("/restaurant/rest_list")
    public void restList(@RequestParam("c") int cateCode,
                         @RequestParam("l") int tier, Model model){
        log.info("/restaurant/rest_list GET요청");

       List<Restaurant> restCateList = restaurantService.restCateList(cateCode, tier);

       model.addAttribute("restCateList",restCateList);
    }



}
