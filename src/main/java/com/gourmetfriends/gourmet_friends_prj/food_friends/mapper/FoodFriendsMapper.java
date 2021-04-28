package com.gourmetfriends.gourmet_friends_prj.food_friends.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.food_friends.domain.FoodFriends;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FoodFriendsMapper {

    //글 전체 목록 조회
    List<FoodFriends> getList();

    //글 목록 조회(페이징 처리)
    List<FoodFriends> getListWithPaging(Criteria cri);

    //총 게시물 수 조회
    int getTotalCount();

    //제목으로 검색 가능
    List<FoodFriends> getListByTitle(Criteria cri);

    //제목으로 검색 게시물 조회
    int getTotalCountByTitle(Criteria cri);

    //검색 처리 통합 조회
    List<FoodFriends> getSearchList(Criteria cri);
    int getSearchTotal(Criteria cri);

    //글 상세 조회
    FoodFriends findByBno(long ffBno);

    //글 쓰기 기능
    void write(FoodFriends foodFriends);

    //글 수정 기능
    int update(FoodFriends foodFriends);

    //글 삭제 기능
    int delete(Long ffBno);

    //게시판 댓글 수 증가
    void increaseFfReplyCnt(Long ffBno);


}
