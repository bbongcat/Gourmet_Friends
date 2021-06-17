package com.gourmetfriends.gourmet_friends_prj.restaurant.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@ToString
public class Restaurant {
    private Long restNo; //음식점 번호
    private String cateCode; //카테고리 번호
    private String restName; //음식점 이름
    private String restPh; //음식점 전화번호
//    private Long restStar; //음식점 별점
    private String restTime; //음식점 영업시간
    private List<String> restPhotos; //음식점 메인사진
//    private Long revCnt; //리뷰 수
    private String restOaddress; //음식점 우편번호
    private String restAddress; //음식점 주소
    private String restDetailaddress;//음식점 상세주소
}
