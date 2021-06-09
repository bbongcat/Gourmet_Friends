package com.gourmetfriends.gourmet_friends_prj.restaurant.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.restaurant.domain.Rest;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RestServiceImpl implements RestService {
    @Override
    public void regRest(Rest rest) {

    }

    @Override
    public Rest getRest(Long restNo) {
        return null;
    }

    @Override
    public boolean modRest(Rest rest) {
        return false;
    }

    @Override
    public boolean delRest(Long restNo) {
        return false;
    }

    @Override
    public List<Rest> getRestList(Criteria cri) {
        return null;
    }

    @Override
    public int getRestTotal(Criteria cri) {
        return 0;
    }

    @Override
    public List<Rest> searchList(Criteria cri) {
        return null;
    }
}
