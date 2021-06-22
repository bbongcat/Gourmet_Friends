package com.gourmetfriends.gourmet_friends_prj.review.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import com.gourmetfriends.gourmet_friends_prj.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/review/*")
@Log4j2
public class ReviewController {

    private final ReviewService reviewService;

    //리뷰 게시물 목록 요청 처리
    @GetMapping("/rev_list")
    public String revList(Criteria cri, Model model){
        log.info("/review/rev_list GET요청: " + cri);
        List<Review> reviewList = reviewService.revSearchList(cri);
        System.out.println("reviewList = " + reviewList);
        model.addAttribute("rev_list",reviewList);
        model.addAttribute("pageInfo", new PageMaker(cri,reviewService.revGetTotal(cri)));

        return "review/rev_list";
    }

    //리뷰 등록 화면 요청 처리
    @GetMapping("/rev_register")
    public String revRegister(){
        log.info("/review/rev_register GET요청");
        return "review/rev_register";
    }

    //리뷰 데이터베이스 저장 요청
    @PostMapping("/rev_register")
    public String revRegister(Review review, RedirectAttributes ra){
        log.info("/review/rev_register POST요청: " + review);
        reviewService.revRegister(review);
        ra.addFlashAttribute("msg","regSuccess");
        return "redirect:/review/rev_list";
    }

    //리뷰 상세보기 요청
    @GetMapping("/rev_get")
    public String revGet(Long revBno, @ModelAttribute("pageInfo") Criteria cri, Model model){
        log.info("/review/rev_get GET요청!: " + revBno);
        model.addAttribute("review",reviewService.revGet(revBno));
        return "review/rev_get";
    }

    //리뷰 상세 조회시 첨부파일명 불러오는 비동기 요청
    @GetMapping("/photo/{revBno}")
    @ResponseBody
    public ResponseEntity<List<String>> getPhoto(@PathVariable Long revBno){
        try {
            List<String> revPhoto = reviewService.getRevPhoto(revBno);
            return new ResponseEntity<>(revPhoto, HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //리뷰 수정 요청
    @PostMapping("/rev_modify")
    public String revModify(Review review,RedirectAttributes ra){
        log.info("/review/rev_modify POST요청: " + review);
        boolean revModify = reviewService.revModify(review);
        if (revModify){
            ra.addFlashAttribute("msg","modSuccess");
        }
        return "redirect:/review/rev_list";
    }

    //리뷰 삭제 요청
    @PostMapping("/rev_remove")
    public String revDelete(Long revBno, RedirectAttributes ra){
        log.info("/review/rev_remove POST요청: " + revBno);
        boolean revRemove = reviewService.revRemove(revBno);
        if(revRemove){
            ra.addFlashAttribute("msg","delSuccess");
        }
        return "redirect:/review/rev_list";
    }
}
