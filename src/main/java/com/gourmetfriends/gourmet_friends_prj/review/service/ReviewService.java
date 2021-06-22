package com.gourmetfriends.gourmet_friends_prj.review.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;

import java.util.List;

public interface ReviewService {

    //리뷰 등록 과정
    void revRegister(Review review);

    //리뷰 상세 조회
    Review revGet(Long revBno);

    //리뷰 수정 과정
    boolean revModify(Review review);

    //리뷰 삭제 과정
    boolean revRemove(Long revBno);

    //리뷰 전체 조회
    List<Review> revGetList(Criteria cri);

    //총 리뷰 수 조회
    int revGetTotal(Criteria cri);

    //리뷰 검색조회 과정
    List<Review> revSearchList(Criteria cri);
}
