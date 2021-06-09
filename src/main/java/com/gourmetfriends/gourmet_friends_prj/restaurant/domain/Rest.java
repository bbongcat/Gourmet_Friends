package com.gourmetfriends.gourmet_friends_prj.restaurant.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Rest {

    private int restNo;
    private Long cateNo;
    private String restName;
    private int restPh;
    private Long restStar;
    private String restTime;
    private String restPhoto;
    private int revCnt;
}
