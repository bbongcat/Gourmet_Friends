package com.gourmetfriends.gourmet_friends_prj.restaurant.mapper;

import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Rest;
import org.apache.ibatis.annotations.Mapper;
import org.hibernate.Criteria;

import java.util.List;

@Mapper
public interface RestMapper {

    // 음식점 전체 목록조회
    List<Rest> getRestList();

    // 글 목록조회(페이징 처리)
    List<Rest> getListWithPaging(Criteria cri);

    // 음식점 이름으로 검색
    List<Rest> getListByRestName(Criteria cri);

    // 검색처리 통합 조회
    List<Rest> getSearchList(Criteria cri);

    int getSearchTotalCount(Criteria cri);

    // 음식점 상세 조회
    Rest findByRestNo(int restNo);

    // 음식점 추가 기능
    void restSave(Rest Rest);

    // 음식점 수정 기능
    int restUpdate(Rest Rest);

    // 음식점 삭제 기능
    int restDelete(int restNo);

    // 사진 첨부 기능
    void addPhoto(String restPhoto);
}
