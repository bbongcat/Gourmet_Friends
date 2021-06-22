package com.gourmetfriends.gourmet_friends_prj.user.service;

import com.gourmetfriends.gourmet_friends_prj.user.domain.User;
import com.gourmetfriends.gourmet_friends_prj.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    @Override
    public void signUp(User user) {
        //평문비번
        String rawUserPw = user.getUserPw();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        //암호화비번
        String encodedPassword = encoder.encode(rawUserPw);
        user.setUserPw(encodedPassword);

        userMapper.userRegister(user);
    }

    @Override
    public boolean isDuplicate(String kind, String info) {
        Map<String,Object> checkDataMap = new HashMap<>();
        checkDataMap.put("kind", kind);
        checkDataMap.put("info", info);
        userMapper.isDuplicate(checkDataMap);

        //중복되면 1, 중복이 아니면 0
        int resultNumber = userMapper.isDuplicate(checkDataMap);
        return resultNumber == 1;
    }

    @Override
    public User getUser(String userId) {
        return userMapper.getUserInfo(userId);
    }

    @Override
    public String login(User inputData, User dbData) {
        if(dbData != null){
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if(encoder.matches(inputData.getUserPw(), dbData.getUserPw())){
                return "loginSuccess";
            }else {
                return "pwFail";
            }
        }else {
            return "idFail";
        }
    }

}
