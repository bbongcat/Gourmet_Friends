package com.gourmetfriends.gourmet_friends_prj.ff_reply.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.domain.FFReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FFReplyMapperTest {

    @Autowired FFReplyMapper ffReplyMapper;

    @Test
    @DisplayName("게시물 번호에 해당하는 20개 댓글이 정상적으로 삽입되어야 한다.")
    void ffReplyInsertTest(){

            FFReply ffReply = new FFReply();
            ffReply.setFfBno(97L);
            ffReply.setFfContent("97번 게시물 댓글 no");
            ffReply.setUserId("테스터");

            ffReplyMapper.insert(ffReply);
    }

    @Test
    @DisplayName("특정 댓글을 조회할 수 있어야 한다.")
    void ffReplyReadTest(){
        FFReply ffReply = ffReplyMapper.read(41L);
        System.out.println("ffReply = " + ffReply);

        assertEquals(ffReply.getFfBno(), 7L);
    }

    @Test
    @DisplayName("특정 댓글을 삭제할 수 있어야 한다.")
    void ffReplyDeleteTest(){
        int delSuccessNum = ffReplyMapper.delete(41L);

        assertTrue(delSuccessNum == 1);
        assertNull(ffReplyMapper.read(41L));
    }

    @Test
    @DisplayName("특정 댓글을 수정할 수 있어야 한다.")
    void ffReplyModifyTest(){
        FFReply ffReply = ffReplyMapper.read(42L);
        ffReply.setFfContent("댓글 수정");

        ffReplyMapper.update(ffReply);

        FFReply modifiedFfReply = ffReplyMapper.read(42L);

    }

    @Test
    @DisplayName("댓글 목록을 페이징해서 조회할 수 있어야 한다.")
    void ffReplyListTest(){

        Criteria cri = new Criteria(1,10,0);
        List<FFReply> foodFriendsReplies = ffReplyMapper.getList(7L,cri);

        for (FFReply foodFriendsReply : foodFriendsReplies) {
            System.out.println("foodFriendsReply = " + foodFriendsReply);
        }
        assertEquals(foodFriendsReplies.size(), 10);
        assertEquals(foodFriendsReplies.get(0).getFfRno(),ffReplyMapper.read(42L).getFfRno());
    }


}