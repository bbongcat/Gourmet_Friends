package com.gourmetfriends.gourmet_friends_prj.review.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    //글 전체 목록 조회
    List<Review> getList();

    //글 목록 조회(페이징처리)
    List<Review> getListWithPaging(Criteria cri);

    //총 리뷰 수 조회
    int getTotalCount();

    //음식점 코드로 조회
    List<Review> getListByRestNo(Criteria cri);
    //음식점 코드로 검색 게시물 조회
    int getTotalCountByRestNo(Criteria cri);

    //검색 처리 통합 조회(음식점 코드, 회원id)
    List<Review> getSearchList(Criteria cri);
    int getSearchTotal(Criteria cri);

    //글 상세 조회
    Review findByBno(Long revBno);

    //글 상세조회시 첨부파일명들 조회
    List<String> findRevPhoto(Long revBno);

    //글 쓰기 기능
    void write(Review review);

    //사진 첨부 기능
    void addRevPhoto(String revPhoto);

    //글 수정 기능
    int update(Review review);

    //글 삭제 기능
    int delete(Long revBno);

    //리뷰 댓글 수 증가
    void increaseReplyCount(Long revBno);
}
