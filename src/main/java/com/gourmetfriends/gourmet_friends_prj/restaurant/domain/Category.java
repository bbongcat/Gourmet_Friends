package com.gourmetfriends.gourmet_friends_prj.restaurant.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Category {

    private int tier; //카테고리 등급
    private String cateName; //카테고리 이름
    private String cateCode; //카테고리 번호
    private String cateParent; //상위 카테고리
}
