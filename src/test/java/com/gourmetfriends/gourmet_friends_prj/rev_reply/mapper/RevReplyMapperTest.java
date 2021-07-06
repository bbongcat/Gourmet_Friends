package com.gourmetfriends.gourmet_friends_prj.rev_reply.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.domain.RevReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RevReplyMapperTest {

    @Autowired RevReplyMapper revReplyMapper;

    @Test
    @DisplayName("리뷰 번호에 해당하는 20개의 댓글이 정상적으로 삽입되어야 한다. ")
    void revReplyInsertTest(){


            RevReply revReply = new RevReply();
            revReply.setRevBno(162L);
            revReply.setRevContent("2번 리뷰 댓글 번호 No" );
            revReply.setUserId("user");
            revReplyMapper.revInsert(revReply);
    }

    @Test
    @DisplayName("특정 댓글을 조회 할 수 있어야 한다.")
    void revReplyReadTest(){
        RevReply revReply = revReplyMapper.revRead(21L);
        System.out.println("revReply = " + revReply);

        assertEquals(revReply.getRevBno(), 2L);
    }

    @Test
    @DisplayName("특정 댓글을 삭제할 수 있어야 한다.")
    void revReplyDeleteTest(){
        int revDelSuccessNum = revReplyMapper.revDelete(162L);


    }

    @Test
    @DisplayName("특정 리뷰 댓글을 수정할 수 있어야 한다.")
    void revReplyModifyTest(){
        RevReply revReply = revReplyMapper.revRead(22L);
        revReply.setRevContent("리뷰 댓글을 수정했지");

        revReplyMapper.revUpdate(revReply);

        RevReply revModifiedReply = revReplyMapper.revRead(22L);

    }

    @Test
    @DisplayName("리뷰 댓글 목록을 페이징해서 조회할 수 있어야 한다.")
    void revReplyListTest(){
        Criteria cri = new Criteria(1,10,0);
        List<RevReply> revReplies = revReplyMapper.revGetList(2L, cri);

        for (RevReply revReply : revReplies) {
            System.out.println("revReply = " + revReply);
        }

        assertEquals(revReplies.size(),10);
        assertEquals(revReplies.get(0).getRevRno(), revReplyMapper.revRead(22L).getRevRno());

    }


}