package com.gourmetfriends.gourmet_friends_prj.food_friends.service;

import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;

import java.util.List;

public interface FoodFriendsService {

    //게시글 등록 과정
    void register(FoodFriends foodFriends);

    //게시글 상세 조회
    FoodFriends get(Long ffBoardNo);

    //게시글 수정 과정
    boolean modify(FoodFriends foodFriends);

    //게시글 삭제 과정
    boolean remove(Long ffBoardNo);

    //게시글 전체 조회

    //총 게시글 수 조회

    //게시물 검색 조회 과정
}
