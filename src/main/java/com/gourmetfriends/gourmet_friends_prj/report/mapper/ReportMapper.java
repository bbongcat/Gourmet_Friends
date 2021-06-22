package com.gourmetfriends.gourmet_friends_prj.report.mapper;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.report.domain.Report;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {

    //리뷰 신고 글 목록 전체 조회
    List<Report> reportGetList();

    //리뷰 신고 글 목록 조회(페이징 처리)
    List<Report> reportGetListWithPaging(Criteria cri);

    //총 리뷰 신고 수 조회
    int reportGetTotalCount();

    //검색 처리 통합 조회
    List<Report> reportGetSearchList(Criteria cri);
    int reportGetSearchTotal(Criteria cri);

    //리뷰 신고 글 상세 조회
    Report reportFindByNo(Long reportNo);

    //리뷰 신고 글 작성
    void reportWrite(Report report);

    //리뷰 신고 글 삭제
    int reportDelete(Long reportNo);

}
