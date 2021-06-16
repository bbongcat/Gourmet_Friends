package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;

import java.util.List;

public interface RestaurantService {

    //음식점 등록
    void restRegister(Restaurant restaurant);

    //음식점 목록
    List<Restaurant> restList(Criteria cri);

    //음식점 총 수
    int restGetTotal(Criteria cri);
}
