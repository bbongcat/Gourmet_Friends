package com.gourmetfriends.gourmet_friends_prj.ff_reply.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.domain.FFReply;
import com.gourmetfriends.gourmet_friends_prj.ff_reply.mapper.FFReplyMapper;
import com.gourmetfriends.gourmet_friends_prj.food_friends.mapper.FoodFriendsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class FFReplyServiceImpl implements FFReplyService {

    private final FFReplyMapper ffReplyMapper;
    private final FoodFriendsMapper foodFriendsMapper;

    @Override
    @Transactional
    public int register(FFReply ffReply) {
        int count = ffReplyMapper.insert(ffReply);
        foodFriendsMapper.increaseFfReplyCnt(ffReply.getFfBno());
        return count;
    }

    @Override
    public FFReply get(Long ffRno) {
        return ffReplyMapper.read(ffRno);
    }

    @Override
    public int modify(FFReply ffReply) {
        return ffReplyMapper.update(ffReply);
    }

    @Override
    public int remove(Long ffBno, Long ffRno) {
        int count = ffReplyMapper.delete(ffRno);
        foodFriendsMapper.increaseFfReplyCnt(ffBno);
        return count;
    }

    @Override
    public Map<String, Object> getList(Long ffBno, Criteria cri) {
        Map<String, Object> replyMap = new HashMap<>();
        replyMap.put("count",ffReplyMapper.getCount(ffBno));
        replyMap.put("replies",ffReplyMapper.getList(ffBno,cri));
        return replyMap;
    }
}
