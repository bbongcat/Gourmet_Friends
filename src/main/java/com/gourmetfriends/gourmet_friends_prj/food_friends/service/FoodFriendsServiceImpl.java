package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.CateNotice;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import com.gourmetfriends.gourmet_friends_prj.food_friends.mapper.FoodFriendsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, List<FoodFriends>> searchList(Criteria cri) {
        List<FoodFriends> searchList = foodFriendsMapper.getSearchList(cri);
        List<FoodFriends> noticeList = new ArrayList<>();
        List<FoodFriends> commonList = new ArrayList<>();
        for (FoodFriends ff : searchList) {
            if (ff.getCateNotice() == CateNotice.SPECIFIC) {
                noticeList.add(ff);
            } else {
                commonList.add(ff);
            }
        }
        Map<String, List<FoodFriends>> searchDataMap = new HashMap<>();
        searchDataMap.put("commonList", commonList);
        searchDataMap.put("noticeList", noticeList);

        return searchDataMap;
    }
}