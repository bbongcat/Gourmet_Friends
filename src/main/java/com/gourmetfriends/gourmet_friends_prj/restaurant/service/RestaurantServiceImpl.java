package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Category;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Menu;
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
    public Restaurant restGetDetail(Long restNo) {
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

    @Override
    public int restDelete(Long restNo) {
        return restaurantMapper.restDelete(restNo);
    }

    @Override
    public List<Restaurant> restCateList(int cateCode, int tier){

        int cateParent = 0;

        if(tier == 1){
            cateParent = cateCode;
            return restaurantMapper.restCateList1(cateCode,cateParent);
        }else if(tier == 2){
            cateParent = cateCode;
            return restaurantMapper.restCateList2(cateCode,cateParent);
        }else {
            return restaurantMapper.restCateList3(cateCode);
        }
    }


}
