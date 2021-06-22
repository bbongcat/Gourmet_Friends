package com.gourmetfriends.gourmet_friends_prj.review.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString
public class Review {

    private Long revBno;//리뷰 번호
    private String userId;;//회원 ID
    private String revContent;//리뷰 내용
    private Long restNo;//음식점 코드 번호
    private Long revStar;//리뷰 평점
    private String reportCnt;//리뷰 신고 수

    private List<String> revPhotos; //리뷰 사진
    private int revReplyCnt;//리뷰 댓글 수
}
