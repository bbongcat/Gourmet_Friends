package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Category;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RestaurantMapper {

    //음식점 등록
    void restInsert(Restaurant restaurant);

    //음식점 목록
    List<Restaurant> restList(Criteria cri);

    //음식점 총 수
    int restGetTotal(Criteria cri);

    //음식점 상세
    Restaurant restGetDetail(int restNo);

    //음식점 수정
    int restModify(Restaurant restaurant);

    //카테고리 리스트
    List<Category> cateList();
}
