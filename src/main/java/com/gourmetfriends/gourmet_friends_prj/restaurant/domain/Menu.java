package com.gourmetfriends.gourmet_friends_prj.restaurant.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Menu {

    private Long menuNo; //메뉴 번호
    private String menuName; //메뉴 이름
    private Long restNo; //음식점 번호
    private String menuIntro; //메뉴 소개
    private Long menuPrice; //메뉴 가격
    private String menuImg; //메뉴 메인 이미지
    private String menuThumbImg; //메뉴 썸네일 이미지

}
