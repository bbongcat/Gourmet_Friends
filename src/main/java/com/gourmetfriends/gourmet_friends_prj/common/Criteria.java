package com.gourmetfriends.gourmet_friends_prj.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {

    private int page;//페이지 번호
    private int amount;//한 페이지당 게시물 수
    private int startIndex;

    private String type;//검색 조건
    private String keyword;//검색어

    public Criteria() {
        this(1,10,0);
    }

    public Criteria(int page, int amount, int startIndex) {
        this.page = page;
        this.amount = amount;
        this.startIndex = startIndex;
    }

    public void setPage(int page){
        this.page = page;
        this.startIndex = (this.page - 1) * this.amount;
    }

    public Criteria(int page, int amount, int startIndex, String type, String keyword) {
        this.page = page;
        this.amount = amount;
        this.startIndex = startIndex;
        this.type = type;
        this.keyword = keyword;
    }
}
