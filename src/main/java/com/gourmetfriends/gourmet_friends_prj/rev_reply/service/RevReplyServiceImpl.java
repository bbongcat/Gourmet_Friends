package com.gourmetfriends.gourmet_friends_prj.rev_reply.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.domain.RevReply;
import com.gourmetfriends.gourmet_friends_prj.rev_reply.mapper.RevReplyMapper;
import com.gourmetfriends.gourmet_friends_prj.review.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class RevReplyServiceImpl implements RevReplyService {

    private final RevReplyMapper revReplyMapper;
    private final ReviewMapper reviewMapper;

    @Override
    @Transactional
    public int revRegister(RevReply revReply) {
        int revCount = revReplyMapper.revInsert(revReply);
        reviewMapper.revIncreaseReplyCount(revReply.getRevBno());
        return 0;
    }

    @Override
    public RevReply revGet(Long revRno) {
        return revReplyMapper.revRead(revRno);
    }

    @Override
    public int revModify(RevReply revReply) {
        return revReplyMapper.revUpdate(revReply);
    }

    @Override
    public int revRemove(Long revBno, Long revRno) {
        int revCount = revReplyMapper.revDelete(revRno);
        reviewMapper.revIncreaseReplyCount(revBno);
        return revCount;
    }

    @Override
    public Map<String, Object> revGetList(Long revBno, Criteria cri) {
        Map<String,Object> revReplyMap = new HashMap<>();
        revReplyMap.put("revCount",revReplyMapper.revGetCount(revBno));
        revReplyMap.put("revReplies",revReplyMapper.revGetList(revBno,cri));
        return revReplyMap;
    }
}
