package com.gourmetfriends.gourmet_friends_prj.food_friends.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter @Getter @ToString
public class FoodFriends {

    private Long ffBoardNo;//밥친구 게시글번호
    private String title; //밥친구 게시판 글 제목
    private String content;//밥친구 게시판 글 내용
    private String userNick;//밥친구 닉네임(작성자)
    private Date regDate;//밥친구 게시판 글 등록 시간
    private Date updateDate;//밥친구 게시판 글 수정 시간
    private String ffNotice;//밥친구 공지사항

}
