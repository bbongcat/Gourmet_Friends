package com.gourmetfriends.gourmet_friends_prj.user.controller;

import com.gourmetfriends.gourmet_friends_prj.user.domain.User;
import com.gourmetfriends.gourmet_friends_prj.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Log4j2
public class UserController {

    private final UserService userService;

    //회원가입 페이지 화면 열기
    @GetMapping("/user/sign_up")
    public String signUp(){
        return "user/sign_up";
    }

    //데이터(아이디,이메일) 중복체크 비동기 요청 처리
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<Boolean> check(String kind, String info){
        boolean flag = userService.isDuplicate(kind, info);

        return new ResponseEntity<>(flag, HttpStatus.OK);
    }

    //회원가입 요청 처리
    @PostMapping("/user/sign_up")
    public String signUp(User user, RedirectAttributes ra){
        log.info("/user/sign_up POST!: " + user);

        userService.signUp(user);
        ra.addFlashAttribute("msg","joinSuccess");
        return "redirect:/user/login";
    }

    //로그인 화면 요청 처리
    @GetMapping("/user/login")
    public String login(){
        return "user/login";
    }

    //로그인 수행 요청 처리
    @PostMapping("/loginCheck")
    public String loginCheck(User inputUser, Model model, HttpSession session){
        log.info("/loginCheck POST: " + inputUser);

        //회원가입이 되었는지 알아보기 위해 로그인 시도 아이디를 통해 DB에서 회원 정보를 조회
        User dbUser = userService.getUser(inputUser.getUserId());

        //로그인 처리
        String result = userService.login(inputUser, dbUser);
        log.info("로그인 처리 결과: " + result);

        model.addAttribute("result",result);

        if(result.equals("loginSuccess")){
            //로그인 성공 처리
            //세션에 로그인한 유저정보를 기록
            session.setAttribute("loginUser", dbUser);
            return "redirect:/food_friends/ff_list";
        }

        return "user/login_result";
    }

    //로그아웃 요청
    @GetMapping("/user/logout")
    public String logout(HttpSession session){
        log.info("/user/logout GET!");

        User loginUser = (User)session.getAttribute("loginUser");

        if(loginUser != null){
            //로그인 한 사람은 세션을 무효화(전체 데이터 삭제)
            session.invalidate();
            return "redirect:/food_friends/ff_list";
        }
        return "redirect:/user/login";

    }
}
