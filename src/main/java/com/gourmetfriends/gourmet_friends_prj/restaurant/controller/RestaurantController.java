package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/restaurant/*")
@Log4j2
public class RestaurantController {

    private final RestaurantService restaurantService;

    //음식적 등록 화면 요청 처리
    @GetMapping("/rest_register")
    public String restRegister(){
        log.info("/restaurant/rest_register GET요청");
        return "restaurant/rest_register";
    }

    //음식점 데이터베이스 저장 요청
    @PostMapping("/rest_register")
    public String restRegister(Restaurant restaurant, RedirectAttributes ra){
        log.info("/restaurant/rest_register POST요청: " + restaurant);
        restaurantService.restRegister(restaurant);
        ra.addFlashAttribute("register_result",restaurant.getRestName());
        return "redirect:/restaurant/rest_list";
    }
}
