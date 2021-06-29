package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Category;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;

import java.util.List;

public interface RestaurantService {

    //음식점 등록
    void restInsert(Restaurant restaurant);

    //음식점 목록
    List<Restaurant> restList(Criteria cri);

    //음식점 총 수
    int restGetTotal(Criteria cri);

    //음식점 상세 페이지
    Restaurant restGetDetail(Long restNo);

    //음식점 정보 수정
    int restModify(Restaurant restaurant);

    //카테고리 리스트
    List<Category> cateList();

    //음식점 삭제
    int restDelete(Long restNo);

    //카테고리별 음식점 리스트
    List<Restaurant> restCateList(int cateCode, int tier);
}
