package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RestaurantMapperTest {

    @Autowired RestaurantMapper restaurantMapper;

    @Test
    void restInsertTest() {

        Restaurant restaurant = new Restaurant();

        restaurant.setRestNo(1L);
        restaurant.setRestPh("01012345678");
        restaurant.setRestName("테스트음식점");
        restaurant.setRestStar(3L);
        restaurant.setRestOaddress("34567");
        restaurant.setRestAddress("대전광역시 대덕구 덕암로300");
        restaurant.setRestDetailaddress("삼광빌라 1층");

        restaurantMapper.restInsert(restaurant);
    }
}