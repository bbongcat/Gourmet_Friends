package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Rest;

import java.util.List;

public interface RestService {

    // 음식점 등록
    void regRest(Rest rest);

    // 음식점 조회
    Rest getRest(Long restNo);

    // 음식점 수정
    boolean modRest(Rest rest);

    // 음식점 삭제
    boolean delRest(Long restNo);

    // 음식점 전체 조회 과정
    List<Rest> getRestList(Criteria cri);

    int getRestTotal(Criteria cri);

    // 음식점 검색 조회 과정
    List<Rest> searchList(Criteria cri);
}
