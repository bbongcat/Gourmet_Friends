package com.gourmetfriends.gourmet_friends_prj.report.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.report.domain.Report;

import java.util.List;

public interface ReportService {

    //리뷰 신고 글 등록 과정
    void reportRegister(Report report);

    //리뷰 신고 글 상세 조회
    Report reportGet(Long reportNo);

    //리뷰 신고 글 삭제 과정
    boolean reportRemove(Long reportNo);

    //리뷰 신고 글 전체 조회
    List<Report> reportGetList(Criteria cri);

    //리뷰 총 신고 글 수 조회
    int reportGetTotal(Criteria cri);

    //리뷰 신고 글 검색 조회 과정
    List<Report> reportSearchList(Criteria cri);
}
