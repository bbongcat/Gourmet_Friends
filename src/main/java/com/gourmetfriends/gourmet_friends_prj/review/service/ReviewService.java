package com.gourmetfriends.gourmet_friends_prj.review.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.review.domain.Review;

import java.util.List;

public interface ReviewService {

    //리뷰 등록 과정
    void register(Review review);

    //리뷰 상세 조회
    Review get(Long revBno);

    //첨부파일명 조회
    List<String> getRevPhoto(Long revBno);

    //게시글 수정 과정
    boolean modify(Review review);

    //게시글 삭제 과정
    boolean remove(Long revBno);

    //게시글 전체 조회
    List<Review> getList(Criteria cri);

    //총 게시글 수 조회
    int getTotal(Criteria cri);

    //게시물 검색조회 과정
    List<Review> searchList(Criteria cri);
}
