package com.gourmetfriends.gourmet_friends_prj.review.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.restaurant.service.RestaurantService;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import com.gourmetfriends.gourmet_friends_prj.review.service.ReviewService;
import com.gourmetfriends.gourmet_friends_prj.utils.UploadFileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class ReviewController {

    private final ReviewService reviewService;
    private final RestaurantService restaurantService;

    private static final String REVIEW_UPLOAD_PATH = "C:\\git-practice\\team_project\\Gourmet_Friends\\src\\main\\resources\\static";

    //리뷰 게시물 목록 요청 처리
    @GetMapping("/review/rev_list")
    public String revList(Criteria cri, Model model){
        log.info("/review/rev_list GET요청: " + cri);
        List<Review> reviewList = reviewService.revSearchList(cri);
        System.out.println("reviewList = " + reviewList);
        model.addAttribute("rev_list",reviewList);
        model.addAttribute("pageInfo", new PageMaker(cri,reviewService.revGetTotal(cri)));

        return "review/rev_list";
    }

    //리뷰 등록 화면 요청 처리
    @GetMapping("/review/rev_register")
    public String revRegister(){
        log.info("/review/rev_register GET요청");
        return "review/rev_register";
    }

    //리뷰 데이터베이스 저장 요청
    @PostMapping("/review/rev_register")
    public String revRegister(Review review, MultipartFile file, RedirectAttributes ra) throws Exception {
        log.info("/review/rev_register POST요청: " + review);

        String imgUploadPath = REVIEW_UPLOAD_PATH + File.separator + "imgUpload";
        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
        String fileName = null;

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

            review.setReviewImg(File.separator  + "imgUpload" + ymdPath + File.separator + fileName);
            review.setReviewThumbImg(File.separator  + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        } else {
            fileName = REVIEW_UPLOAD_PATH + File.separator + "img" + File.separator + "none.png";
            review.setReviewImg(fileName);
            review.setReviewThumbImg(fileName);
        }

        reviewService.revRegister(review);
        ra.addFlashAttribute("msg","regSuccess");
        return "redirect:/review/rev_list";
    }

    //리뷰 상세보기 요청
    @GetMapping("/review/rev_get")
    public String revGet(Long revBno, @ModelAttribute("pageInfo") Criteria cri, Model model){
        log.info("/review/rev_get GET요청!: " + revBno);
        model.addAttribute("review",reviewService.revGet(revBno));
        return "review/rev_get";
    }

    //리뷰 수정 요청
    @PostMapping("/review/rev_modify")
    public String revModify(Review review, MultipartFile file, HttpServletRequest req, RedirectAttributes ra) throws Exception {
        log.info("/review/rev_modify POST요청: " + review);

        if(file.getOriginalFilename() != null && file.getOriginalFilename() != ""){
            new File(REVIEW_UPLOAD_PATH + req.getParameter("reviewImg")).delete();
            new File(REVIEW_UPLOAD_PATH + req.getParameter("reviewThumbImg")).delete();

            String imgUploadPath = REVIEW_UPLOAD_PATH + File.separator + "imgUpload";
            String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
            String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),ymdPath);

            review.setReviewImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
            review.setReviewThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
        }else {
            review.setReviewImg(req.getParameter("reviewImg"));
            review.setReviewThumbImg(req.getParameter("reviewThumbImg"));
        }

        boolean revModify = reviewService.revModify(review);
        if (revModify){
            ra.addFlashAttribute("msg","modSuccess");
        }
        return "redirect:/review/rev_list";
    }

    //리뷰 삭제 요청
    @PostMapping("/review/rev_remove")
    public String revDelete(Long revBno, RedirectAttributes ra){
        log.info("/review/rev_remove POST요청: " + revBno);
        boolean revRemove = reviewService.revRemove(revBno);
        if(revRemove){
            ra.addFlashAttribute("msg","delSuccess");
        }
        return "redirect:/review/rev_list";
    }

    //음식점 검색 팝업창
    @GetMapping("/review/rest_pop")
    public void restPop(Criteria cri, Model model){
        log.info("/review/rest_pop GET요청");

        List restList1 = restaurantService.restList(cri);

        if(!restList1.isEmpty()){
            model.addAttribute("restList",restList1);
        }else {
            model.addAttribute("restListChk","empty");
        }

        int total = restaurantService.restGetTotal(cri);

        model.addAttribute("pageInfo", new PageMaker(cri, restaurantService.restGetTotal(cri)));
    }

}
