package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.mapper.FoodFriendsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FoodFriendsServiceImpl implements FoodFriendsService{

    private final FoodFriendsMapper foodFriendsMapper;

    @Override
    public void register(FoodFriends foodFriends) {

    }

    @Override
    public FoodFriends get(Long ffBoardNo) {
        return null;
    }

    @Override
    public boolean modify(FoodFriends foodFriends) {
        return false;
    }

    @Override
    public boolean remove(Long ffBoardNo) {
        return false;
    }
}
