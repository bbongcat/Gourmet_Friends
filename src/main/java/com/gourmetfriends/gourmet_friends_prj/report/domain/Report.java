package com.gourmetfriends.gourmet_friends_prj.report.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter @Getter @ToString
public class Report {

    private Long reportNo;//리뷰 신고 번호
    private Long revBno;//원본 리뷰 번호
    private String userId;//회원 ID
    private String reportContent;//신고 내용
    private Date reportDate;//신고 시간

}
