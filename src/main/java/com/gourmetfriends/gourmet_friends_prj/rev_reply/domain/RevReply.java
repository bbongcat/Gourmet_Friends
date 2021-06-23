package com.gourmetfriends.gourmet_friends_prj.rev_reply.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter @ToString
public class RevReply {
    private Long revRno;//리뷰 댓글 번호
    private Long revBno;//원본 리뷰 번호
    private String userId;//회원 ID
    private String revReply;//리뷰 댓글 내용
    private Date revDate;//리뷰 댓글 시간
}
