package com.gourmetfriends.gourmet_friends_prj.ff_reply.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.domain.FFReply;

import java.util.Map;

public interface FFReplyService {

    //댓글 등록 서비스
    int register(FFReply ffReply);

    //댓글 개별 조회 서비스
    FFReply get(Long ffRno);

    //댓글 수정 서비스
    int modify(FFReply ffReply);

    //댓글 삭제 서비스
    int remove(Long ffBno, Long ffRno);

    //댓글 목록 조회 서비스
    Map<String,Object> getList(Long ffBno, Criteria cri);
}
