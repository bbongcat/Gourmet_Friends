package com.gourmetfriends.gourmet_friends_prj.food_friends.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter @Getter @ToString
public class FoodFriends {

    private Long ffBno;//밥친구 게시글번호
    private String userId;//회원 ID
    private String title; //밥친구 게시판 글 제목
    private String content;//밥친구 게시판 글 내용
    private Date regDate;//밥친구 게시판 글 등록 시간
    private Date updateDate;//밥친구 게시판 글 수정 시간
    private String notice;//밥친구 게시판 공지사항

    //밥친구 게시판 일반 글인지 공지사항 글인지 구분하기
    private CateNotice cateNotice;//밥친구 게시판 공지사항 분리
    private Long ffReplyCnt;//밥친구 댓글수

}
