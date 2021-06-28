package com.gourmetfriends.gourmet_friends_prj.review.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Review {

    private Long revBno;//리뷰 번호
    private String userId;;//회원 ID
    private String revContent;//리뷰 내용
    private Long restNo;//음식점 코드 번호
    private String restName;//음식점 이름
    private Long revStar;//리뷰 평점
    private String reportCnt;//리뷰 신고 수
    private int revReplyCnt;//리뷰 댓글 수
    private String reviewImg; //리뷰 메인 이미지
    private String reviewThumbImg; //리뷰 썸네일 이미지
 }
