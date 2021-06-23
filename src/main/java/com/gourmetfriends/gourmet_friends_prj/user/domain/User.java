package com.gourmetfriends.gourmet_friends_prj.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class User {
    private String userId; //회원 id
    private String userPw; //회원 pw
    private String userName; //회원 이름
    private String userBirth; //회원 생일
    private String userEmail; //회원 이메일
    private String userPhone; //회원 전화번호
    private String userGender; //회원 성별
    private String userOaddress; //회원 우편번호
    private String userAddress; //회원 주소
    private String userDetailaddress; //회원 상세주소
    private UserRank userRank; //회원 등급
    private UserAuth userAuth; //회원 권한

}
