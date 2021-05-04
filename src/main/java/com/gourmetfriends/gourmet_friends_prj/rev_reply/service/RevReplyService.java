package com.gourmetfriends.gourmet_friends_prj.rev_reply.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.domain.RevReply;

import java.util.Map;

public interface RevReplyService {

    //리뷰 댓글 등록 서비스
    int revRegister(RevReply revReply);

    //리뷰 댓글 개별 조회 서비스
    RevReply revGet(Long revRno);

    //리뷰 댓글 수정 서비스
    int revModify(RevReply revReply);

    //리뷰 댓글 삭제 서비스
    int revRemove(Long revBno, Long revRno);

    //리뷰 댓글 목록조회 서비스
    Map<String,Object> revGetList(Long revBno, Criteria cri);

}
