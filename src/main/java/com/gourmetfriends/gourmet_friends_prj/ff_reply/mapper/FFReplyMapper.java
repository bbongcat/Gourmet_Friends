package com.gourmetfriends.gourmet_friends_prj.ff_reply.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.domain.FFReply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FFReplyMapper {

    //댓글 입력
    int insert(FFReply ffReply);

    //댓글 1개 조회
    FFReply read(Long ffRno);

    //댓글 삭제
    int delete(Long ffRno);

    //댓글 수정
    int update(FFReply ffReply);

    //총 댓글 수 조회
    int getCount(Long ffBno);

    //댓글 목록 조회
    List<FFReply> getList(
            @Param("ffBno") Long ffBno,
            @Param("cri") Criteria cri);

}
