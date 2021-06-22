package com.gourmetfriends.gourmet_friends_prj.review.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    //글 전체 목록 조회
    List<Review> revGetList();

    //글 목록 조회(페이징처리)
    List<Review> revGetListWithPaging(Criteria cri);

    //총 리뷰 수 조회
    int revGetTotalCount();

    //음식점 코드로 조회
    List<Review> revGetListByRestNo(Criteria cri);
    //음식점 코드로 검색 게시물 조회
    int revGetTotalCountByRestNo(Criteria cri);

    //검색 처리 통합 조회(음식점 코드, 회원id)
    List<Review> revGetSearchList(Criteria cri);
    int revGetSearchTotal(Criteria cri);

    //글 상세 조회
    Review revFindByBno(Long revBno);

    //글 쓰기 기능
    void revWrite(Review review);

    //글 수정 기능
    int revUpdate(Review review);

    //글 삭제 기능
    int revDelete(Long revBno);

    //리뷰 댓글 수 증가
    void revIncreaseReplyCount(Long revBno);

    //리뷰 신고 수 증가
    void revIncreaseReportCount(Long revBno);

}
