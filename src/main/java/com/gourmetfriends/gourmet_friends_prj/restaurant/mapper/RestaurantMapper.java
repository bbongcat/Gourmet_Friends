package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestaurantMapper {

    //음식점 등록
    void restInsert(Restaurant restaurant);
}
