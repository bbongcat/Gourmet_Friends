package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.mapper.RestaurantMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {

    private final RestaurantMapper restaurantMapper;

    @Override
    public void restRegister(Restaurant restaurant) {

        restaurantMapper.restInsert(restaurant);
    }
}
