package com.gourmetfriends.gourmet_friends_prj.food_friends.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.service.FoodFriendsService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FoodFriendsMapperTest {

    @Autowired FoodFriendsMapper foodFriendsMapper;

    @Autowired FoodFriendsService foodFriendsService;

    @Test
    @DisplayName("데이터베이스 저장에 성공해야한다.")
    void writeTest(){
        FoodFriends foodFriends = new FoodFriends();
        foodFriends.setTitle("짱구는 못말려");
        foodFriends.setContent("짱구는 못말리는 내용입니다");
        foodFriends.setUserId("ccc456");

        foodFriendsMapper.write(foodFriends);

        assertTrue(foodFriendsMapper.getList().get(0).getFfBno() == 10);
    }

    @Test
    @DisplayName("테스트 게시물 100개를 추가해야 한다.")
    void bulkInsert(){
        for(int i = 1; i <= 100; i++){
            FoodFriends foodFriends = new FoodFriends();
            foodFriends.setTitle("테스트 제목" + i);
            foodFriends.setContent("테스트" + i +"번째 내용입니다.");
            foodFriends.setUserId("user" + i);

            foodFriendsMapper.write(foodFriends);
        }
    }

    @Test
    @DisplayName("페이지 정보대로 목록이 조회되어야 한다.")
    void pagingTest(){
        Criteria cri = new Criteria(1,10,1);
        List<FoodFriends> foodFriendsList = foodFriendsMapper.getListWithPaging(cri);

        for(FoodFriends foodFriends : foodFriendsList){
            System.out.println(foodFriends);
        }
    }

}