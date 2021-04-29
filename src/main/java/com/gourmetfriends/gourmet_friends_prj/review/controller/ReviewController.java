package com.gourmetfriends.gourmet_friends_prj.review.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import com.gourmetfriends.gourmet_friends_prj.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        List<Review> reviewList = reviewService.searchList(cri);
        model.addAttribute("rev_list",reviewList);
        model.addAttribute("pageInfo", new PageMaker(cri,reviewService.getTotal(cri)));

        return "review/rev_list";
    }
}
