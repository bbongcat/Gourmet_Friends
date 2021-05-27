package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.mapper.FoodFriendsMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class FoodFriendsServiceTest {

    @Autowired FoodFriendsService foodFriendsService;
    @Autowired FoodFriendsMapper foodFriendsMapper;

    @Test
    void searchListTest(){

        Criteria cri = new Criteria();
        Map<String, List<FoodFriends>> listMap = foodFriendsService.searchList(cri);

        System.out.println("listMap = " + listMap);
    }


}