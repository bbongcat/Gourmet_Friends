package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Category;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Restaurant;
import com.gourmetfriends.gourmet_friends_prj.restaurant.mapper.RestaurantMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {

    private final RestaurantMapper restaurantMapper;

    @Override
    public void restInsert(Restaurant restaurant) {

        restaurantMapper.restInsert(restaurant);
    }

    @Override
    public List<Restaurant> restList(Criteria cri) {
        return restaurantMapper.restList(cri);
    }

    @Override
    public int restGetTotal(Criteria cri) {
        return restaurantMapper.restGetTotal(cri);
    }

    @Override
    public Restaurant restGetDetail(int restNo) {
        return restaurantMapper.restGetDetail((restNo));
    }

    @Override
    public int restModify(Restaurant restaurant) {
        return restaurantMapper.restModify(restaurant);
    }

    @Override
    public List<Category> cateList() {
        return restaurantMapper.cateList();
    }
}
