package com.gourmetfriends.gourmet_friends_prj.restaurant.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Rest;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestService;
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

@Controller
@RequiredArgsConstructor
@RequestMapping("/restaurant/*")
@Log4j2
public class RestController {

    private final RestService restService;

    // 목록 요청 처리
    @GetMapping("/list")
    public String list(Criteria cri, Model model) {
        log.info("/restaurant/list GET요청 발생 : " + cri);
        List<Rest> list = restService.searchList(cri);
        model.addAttribute("restList", list);

        model.addAttribute("pageInfo", new PageMaker(cri, restService.getRestTotal(cri)));

        return "restaurant/restList";
    }

    // 음식점 등록 화면 요청 처리
    @GetMapping("/register")
    public String register(){
        log.info("/restaurant/register GET요청");
        return "restaurant/restRegister";
    }

    // 음식점 데이터베이스 저장 요청
    @PostMapping("/register")
    public String register(Rest rest, RedirectAttributes ra){
        log.info("/restaurant/restRegister POST요청: " + rest);
        restService.regRest(rest);
        ra.addFlashAttribute("msg","regSuccess");
        return "redirect:/restaurant/list";
    }

    // 음식점 상세보기 요청
    @GetMapping("/get")
    public String get(Long restNo, @ModelAttribute("pageInfo") Criteria cri, Model model){
        log.info("/restaurant/get GET요청: " + restNo);
        model.addAttribute("restaurant",restService.getRest(restNo));
        return "restaurant/restGet";
    }

    // 음식점 수정 요청 GET
    @GetMapping("/modify")
    public String modify(Long restNo, @ModelAttribute("pageInfo") Criteria cri, Model model) {
        log.info("/restaurant/modify GET요청 : " + restNo);

        Rest rest=restService.getRest(restNo);
        model.addAttribute("restaurant", rest);
        return "restaurant/restModify";
    }

    // 음식점 수정 요청 POST
    @PostMapping("/modify")
    public String modify(Rest rest, RedirectAttributes ra) {
        log.info("/restaurant/modify POST요청 : " + rest);
        boolean modify = restService.modRest(rest);
        if (modify) {
            ra.addFlashAttribute("msg", "modSuccess");
        }
        return "redirect:/restaurant/list";
    }

    // 음식점 삭제 요청 POST
    @PostMapping("/remove")
    public String remove(Long restNo, RedirectAttributes ra) {
        log.info("/restaurant/remove POST요청 : " + restNo);
        boolean remove = restService.delRest(restNo);
        if (remove) {
            ra.addFlashAttribute("msg", "delSuccess");
        }
        return "redirect:/restaurant/list";
    }

}
