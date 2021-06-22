package com.gourmetfriends.gourmet_friends_prj.report.service;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.report.domain.Report;
import com.gourmetfriends.gourmet_friends_prj.report.mapper.ReportMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {

    private final ReportMapper reportMapper;

    @Override
    public void reportRegister(Report report) {
        reportMapper.reportWrite(report);
    }

    @Override
    public Report reportGet(Long reportNo) {
        return reportMapper.reportFindByNo(reportNo);
    }

    @Override
    public boolean reportRemove(Long reportNo) {
        return reportMapper.reportDelete(reportNo) == 1;
    }

    @Override
    public List<Report> reportGetList(Criteria cri) {
        return reportMapper.reportGetListWithPaging(cri);
    }

    @Override
    public int reportGetTotal(Criteria cri) {
        return reportMapper.reportGetSearchTotal(cri);
    }

    @Override
    public List<Report> reportSearchList(Criteria cri) {
        return reportMapper.reportGetSearchList(cri);
    }
}
