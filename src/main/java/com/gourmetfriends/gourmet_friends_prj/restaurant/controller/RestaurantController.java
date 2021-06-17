package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        restaurantService.restInsert(restaurant);

        ra.addFlashAttribute("insert_result",restaurant.getRestName());

        return "redirect:/admin/rest_manage";
    }

    //음식점 상세 페이지
    @GetMapping("/rest_detail")
    public void restGetInfo(int restNo, Criteria cri, Model model){
        log.info("/admin/rest_detail GET요청");
        model.addAttribute("cri",cri);
        model.addAttribute("restInfo",restaurantService.restGetDetail(restNo));
    }

    //음식점 수정 페이지
    @GetMapping("/rest_modify")
    public void restModify(int restNo, Criteria cri, Model model){
        log.info("/admin/rest_modify GET요청");
        model.addAttribute("cri",cri);
        model.addAttribute("restInfo",restaurantService.restGetDetail(restNo));
    }

    //음식점 정보 수정
    @PostMapping("/rest_modify")
    public String restModify(Restaurant restaurant, RedirectAttributes ra){
        log.info("/admin/rest_modify POST요청: " + restaurant);
        int result = restaurantService.restModify(restaurant);
        ra.addFlashAttribute("modify_result",result);
        return "redirect:/admin/rest_manage";
    }
}
