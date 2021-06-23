package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.MenuService;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
@Log4j2
public class MenuController {

    private final MenuService menuService;
    private final RestaurantService restaurantService;

    //메뉴 등록
    @PostMapping("/menu_insert")
    public String menuInsert(Menu menu, RedirectAttributes ra){
        log.info("/admin/menu_insert POST요청: " + menu);
        menuService.menuInsert(menu);
        ra.addFlashAttribute("insert_result", menu.getMenuName());
        return "redirect:/admin/menu_insert";
    }

    //음식점 검색 팝업창
    @GetMapping("/rest_pop")
    public void restPop(Criteria cri, Model model){
        log.info("/admin/rest_pop GET요청");

        cri.setAmount(5);

        List restList = restaurantService.restList(cri);

        if(!restList.isEmpty()){
            model.addAttribute("restList",restList);
        }else {
            model.addAttribute("restListChk","empty");
        }

        model.addAttribute("pageInfo", new PageMaker(cri, restaurantService.restGetTotal(cri)));
    }
}
