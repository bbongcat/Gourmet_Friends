package com.gourmetfriends.gourmet_friends_prj.common;

import lombok.Getter;
import lombok.ToString;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

//클라이언트에 각종 페이지 관련 정보를 전달하는 클래스
@Getter
@ToString
public class PageMaker {

    private int startPage;//시작 페이지 번호
    private int endPage;//끝 페이지 번호
    private boolean prev, next;//이전, 다음 표시 유무

    private Criteria cri;//페이지 정보
    private int total;//총 게시물 수

    //한 화면에 보여줄 페이지 수
    private static final int PAGE_COUNT = 10;

    public PageMaker(Criteria cri, int total){
        this.cri = cri;
        this.total = total;

        //끝 페이지 계산
        this.endPage = (int)Math.ceil((double) cri.getPage() / PAGE_COUNT) * PAGE_COUNT;

        //시작 페이지 계산
        this.startPage = endPage - PAGE_COUNT + 1;

        //끝 페이지 보정
        int realEnd = (int)Math.ceil((double) total/ cri.getAmount());

        if(realEnd <= endPage){
            this.endPage = realEnd;
        }

        //이전 페이지 표시 여부
        this.prev = this.startPage > 1;

        //다음 페이지 표시 여부
        this.next = this.endPage < realEnd;

    }

    //URI 파라미터를 쉽게 생성해주는 메서드
    public String makeParam(int page){
        UriComponents build = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("keyword", cri.getKeyword())
                .queryParam("type", cri.getType())
                .build();
        return build.toString();
    }

}
