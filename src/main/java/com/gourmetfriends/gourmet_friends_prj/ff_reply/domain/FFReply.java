package com.gourmetfriends.gourmet_friends_prj.ff_reply.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter @Getter @ToString
public class FFReply {
    private Long ffRno;//밥친구 댓글 게시판 댓글번호
    private Long ffBno;//밥친구 게시판 원본게시글 번호
    private String userId;//회원 ID
    private String ffContent;//밥친구 게시판 댓글 내용
    private Date ffDate; // 밥친구 게시판 댓글 작성시간
}
