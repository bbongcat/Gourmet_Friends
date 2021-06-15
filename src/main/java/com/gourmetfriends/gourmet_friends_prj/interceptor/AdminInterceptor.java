package com.gourmetfriends.gourmet_friends_prj.interceptor;

import com.gourmetfriends.gourmet_friends_prj.user.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user == null || user.getUserAuth().equals("ADMIN")){//관리자 계정이 아닌 경우
            response.sendRedirect("/main");//메인 페이지로 리다이렉트

            return false;
        }
        return true;//관리자 계정 로그인인 경우
    }
}
