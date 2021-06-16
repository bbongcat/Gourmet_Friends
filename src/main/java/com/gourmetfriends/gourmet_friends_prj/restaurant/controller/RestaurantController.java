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
@RequestMapping("/admin/*")
@RequiredArgsConstructor
@Log4j2
public class RestaurantController {

    private final RestaurantService restaurantService;

    //음식점 등록
    @PostMapping("/rest_insert")
    public String restInsert(Restaurant restaurant, RedirectAttributes ra){
        log.info("/admin/rest_insert POST요청: " + restaurant);
        restaurantService.restRegister(restaurant);

        ra.addFlashAttribute("insert_result",restaurant.getRestName());

        return "redirect:/admin/rest_manage";
    }
}
