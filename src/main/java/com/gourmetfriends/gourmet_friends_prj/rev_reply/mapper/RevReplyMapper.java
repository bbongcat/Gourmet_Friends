package com.gourmetfriends.gourmet_friends_prj.rev_reply.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.domain.RevReply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RevReplyMapper {

    //리뷰 댓글 입력
    int revInsert(RevReply revReply);

    //리뷰 댓글 1개 조회
    RevReply revRead(Long revRno);

    //리뷰 댓글 삭제
    int revDelete(Long revRno);

    //리뷰 댓글 수정
    int revUpdate(RevReply revReply);

    //총 리뷰 댓글 수 조회
    int revGetCount(Long revBno);

    //리뷰 댓글 목록 조회
    List<RevReply> revGetList(
            @Param("revBno") Long revBno,
            @Param("cri") Criteria cri
    );
}
