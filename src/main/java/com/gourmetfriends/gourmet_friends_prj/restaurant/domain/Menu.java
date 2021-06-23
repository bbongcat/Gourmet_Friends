package com.gourmetfriends.gourmet_friends_prj.restaurant.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Menu {

    private int menuNo; //메뉴 번호
    private String menuName; //메뉴 이름
    private int restNo; //음식점 번호
    private String menuIntro; //메뉴 소개
    private int menuPrice; //메뉴 가격
    private List<String> menuPhotos; //메뉴 사진
}
