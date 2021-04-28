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
    @DisplayName("데이터베이스에서 게시글 전체를 조회할 수 있어야 한다.")
    void findAllTest(){
        List<FoodFriends> foodFriendsList = foodFriendsMapper.getList();

        assertTrue(foodFriendsList.size() == 105);

        for (FoodFriends foodFriends : foodFriendsList) {
            System.out.println(foodFriends);
        }
    }

    @Test
    @DisplayName("데이터베이스 저장에 성공해야한다.")
    void writeTest(){
        FoodFriends foodFriends = new FoodFriends();
        foodFriends.setTitle("백설공주");
        foodFriends.setContent("백설공주와 일곱난쟁이");
        foodFriends.setUserId("ccc789");

        foodFriendsMapper.write(foodFriends);

        assertTrue(foodFriendsMapper.getList().get(0).getFfBno() == 111);
    }

    @Test
    @DisplayName("글 번호를 전달하면 해당 글 정보를 얻어야한다.")
    void findOneTest(){
        FoodFriends foodFriends = foodFriendsMapper.findByBno(111L);
        System.out.println("foodFriends = " + foodFriends);

        assertTrue(foodFriends.getFfBno() == 111);
    }

    @Test
    @DisplayName("글 내용, 글 제목, 작성자를 수정할 수 있어야 한다.")
    void updateTest(){
        FoodFriends newFoodFriends = new FoodFriends();
        newFoodFriends.setTitle("신데렐라");
        newFoodFriends.setContent("신데렐라가 구두를 잃어버렸어요.");
        newFoodFriends.setUserId("ggg1234");
        newFoodFriends.setFfBno(111L);

        foodFriendsMapper.update(newFoodFriends);

        assertTrue(foodFriendsMapper.findByBno(111L).getUserId().equals("ggg1234"));
    }

    @Test
    @DisplayName("글 번호를 전달하면 해당 글 정보가 삭제되어야 한다.")
    void deleteTest(){
        foodFriendsMapper.delete(111L);

        assertNull(foodFriendsMapper.findByBno(111L));
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

    @Test
    @DisplayName("총 게시물 수가 잘 조회되어야 한다.")
    void totalCountTest(){
        int totalCount = foodFriendsMapper.getTotalCount();

        System.out.println("totalCount = " + totalCount);

        assertTrue(totalCount == 104);
    }

    @Test
    @DisplayName("제목으로 검색 수행")
    void searchByTitleTest() {
        Criteria cri = new Criteria();
        cri.setKeyword("28");

        List<FoodFriends> foodFriendsList = foodFriendsMapper.getListByTitle(cri);
        for (FoodFriends foodFriends : foodFriendsList) {
            System.out.println(foodFriends);
        }
    }
}