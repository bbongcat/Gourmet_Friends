package com.gourmetfriends.gourmet_friends_prj.user.mapper;

import com.gourmetfriends.gourmet_friends_prj.user.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

    //회원가입 기능
    void userRegister(User user);

    //아이디, 이메일 중복체크
    int isDuplicate(Map<String,Object> datas);

    //회원 정보 조회 기능
    User getUserInfo(String userId);
}
