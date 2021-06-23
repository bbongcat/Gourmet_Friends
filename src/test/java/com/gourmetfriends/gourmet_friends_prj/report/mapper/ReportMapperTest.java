package com.gourmetfriends.gourmet_friends_prj.report.mapper;

import com.gourmetfriends.gourmet_friends_prj.report.domain.Report;
import com.gourmetfriends.gourmet_friends_prj.report.service.ReportService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReportMapperTest {

    @Autowired ReportMapper reportMapper;
    @Autowired ReportService reportService;

    @Test
    @DisplayName("데이터베이스에서 게시글 전체를 조회할 수 있어야 한다.")
    void reportFindAllTest(){
        List<Report> reportList = reportMapper.reportGetList();

        assertTrue(reportList.size() == 0);

        for (Report report : reportList) {
            System.out.println(report);
        }
    }

    @Test
    @DisplayName("데이터베이스 저장에 성공해야 한다.")
    void reportInsertTest(){
        Report newReport = new Report();
        newReport.setRevBno(2L);
        newReport.setReportContent("신고 내용2 입니다.");
        newReport.setUserId("abc1234");

        reportMapper.reportWrite(newReport);
    }

    @Test
    @DisplayName("글 번호를 전달하면 해당 글 정보를 얻어야 한다.")
    void reportFindOneTest(){
        Report report = reportMapper.reportFindByNo(1L);
        System.out.println("report = " + report);

        assertTrue(report.getReportNo() == 1);
    }

    @Test
    @DisplayName("글 번호를 전달하면 해당 글 정보가 삭제되어야 한다.")
    void reportDeleteTest(){
        reportMapper.reportDelete(2L);

        assertNull(reportMapper.reportFindByNo(2L));
    }

    @Test
    @DisplayName("총 게시물 수를 잘 조회해야 한다.")
    void totalCountTest(){
        int totalCount = reportMapper.reportGetTotalCount();

        System.out.println("totalCount = " + totalCount);

        assertTrue(totalCount == 1);
    }


}