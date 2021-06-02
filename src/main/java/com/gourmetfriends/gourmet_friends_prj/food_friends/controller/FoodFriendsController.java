package com.gourmetfriends.gourmet_friends_prj.food_friends.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.service.FoodFriendsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/food_friends/*")
@Log4j2
public class FoodFriendsController {

    private final FoodFriendsService foodFriendsService;

    //게시물 목록 요청 처리
    @GetMapping("/ff_list")
    public String list(Criteria cri, Model model){
        log.info("/food_friends/ff_list GET요청: " + cri);
        Map<String, List<FoodFriends>> listMap = foodFriendsService.searchList(cri);
        System.out.println("list = " + listMap);
        model.addAttribute("commonList",listMap.get("commonList"));
        model.addAttribute("noticeList",listMap.get("noticeList"));
        model.addAttribute("pageInfo",new PageMaker(cri,foodFriendsService.getTotal(cri)));

        return "food_friends/ff_list";
    }

    //게시글 등록 화면 요청 처리
    @GetMapping("/ff_register")
    public String register(){
        log.info("/food_friends/ff_register GET요청");
        return "food_friends/ff_register";
    }

    //게시글 데이터베이스 저장 요청
    @PostMapping("/ff_register")
    public String register(FoodFriends foodFriends, RedirectAttributes ra){
        log.info("/food_friends/ff_register POST요청: " + foodFriends);
        foodFriendsService.register(foodFriends);
        ra.addFlashAttribute("msg","regSuccess");
        return "redirect:/food_friends/ff_list";
    }

    //게시글 상세보기 요청
    @GetMapping("/ff_get")
    public String get(Long ffBno, @ModelAttribute("pageInfo") Criteria cri,Model model){
        log.info("/food_friends/ff_get GET요청: " + ffBno);
        model.addAttribute("foodFriends",foodFriendsService.get(ffBno));
        return "food_friends/ff_get";
    }

    //게시글 수정 화면 요청
    @PostMapping("/ff_modify")
    public String modify(FoodFriends foodFriends, RedirectAttributes ra){
        log.info("/food_friends/ff_modify POST: " + foodFriends);
        boolean modify = foodFriendsService.modify(foodFriends);
        if(modify){
            ra.addFlashAttribute("msg","modSuccess");
        }
        return "redirect:/food_friends/ff_list";
    }

    //게시글 삭제 요청
    @PostMapping("/ff_remove")
    public String delete(Long ffBno, RedirectAttributes ra){
        log.info("/food_friends/ff_remove POST요청: " + ffBno);
        boolean remove = foodFriendsService.remove(ffBno);
        if(remove){
            ra.addFlashAttribute("msg", "delSuccess");
        }
        return "redirect:/food_friends/ff_list";
    }
}
