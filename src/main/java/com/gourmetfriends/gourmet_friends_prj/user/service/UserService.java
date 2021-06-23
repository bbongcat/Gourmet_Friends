package com.gourmetfriends.gourmet_friends_prj.user.service;

import com.gourmetfriends.gourmet_friends_prj.user.domain.User;

public interface UserService {

    //회원가입 처리
    void signUp(User user);

    //데이터 중복체크
    boolean isDuplicate(String kind, String info);

    //회원 정보 조회 처리
    User getUser(String userId);

    //로그인 처리
    String login(User inputData, User dbData);
}
