package com.gourmetfriends.gourmet_friends_prj.review.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString
public class Review {

    private int revBno;//리뷰 번호
    private String user_id;;//회원 ID
    private String revContent;//
    private int restNo;//음식점 코드 번호
    private int revStar;//리뷰 평점
    private String report;//리뷰 신고
    private String reportCnt;//리뷰 신고 수

    private List<String> revPhoto; //리뷰 사진
    private int revReplyCnt;//리뷰 댓글 수
}
