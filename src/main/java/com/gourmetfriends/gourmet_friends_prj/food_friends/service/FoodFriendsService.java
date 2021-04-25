package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;

import java.util.List;

public interface FoodFriendsService {

    //게시글 등록 과정
    void register(FoodFriends foodFriends);

    //게시글 상세 조회
    FoodFriends get(Long ffBno);

    //게시글 수정 과정
    boolean modify(FoodFriends foodFriends);

    //게시글 삭제 과정
    boolean remove(Long ffBno);

    //게시글 전체 조회
    List<FoodFriends> getList(Criteria cri);

    //총 게시글 수 조회
    int getTotal(Criteria cri);

    //게시물 검색 조회 과정
    List<FoodFriends> searchList(Criteria cri);

}