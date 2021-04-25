package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.mapper.FoodFriendsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FoodFriendsServiceImpl implements FoodFriendsService{

    private final FoodFriendsMapper foodFriendsMapper;

    @Override
    public void register(FoodFriends foodFriends) {
        foodFriendsMapper.write(foodFriends);
    }

    @Override
    public FoodFriends get(Long ffBno) {
        return foodFriendsMapper.findByBno(ffBno);
    }

    @Override
    public boolean modify(FoodFriends foodFriends) {
        return foodFriendsMapper.update(foodFriends) == 1;
    }

    @Override
    public boolean remove(Long ffBno) {
        return foodFriendsMapper.delete(ffBno) == 1;
    }

    @Override
    public List<FoodFriends> getList(Criteria cri) {
        return foodFriendsMapper.getListWithPaging(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return foodFriendsMapper.getSearchTotal(cri);
    }

    @Override
    public List<FoodFriends> searchList(Criteria cri) {
        return foodFriendsMapper.getSearchList(cri);
    }
}