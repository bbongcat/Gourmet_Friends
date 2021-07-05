package com.gourmetfriends.gourmet_friends_prj.report.controller;

import com.gourmetfriends.gourmet_friends_prj.common.Criteria;
import com.gourmetfriends.gourmet_friends_prj.common.PageMaker;
import com.gourmetfriends.gourmet_friends_prj.report.domain.Report;
import com.gourmetfriends.gourmet_friends_prj.report.service.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/report/*")
@Log4j2
public class ReportController {

    private final ReportService reportService;

    //리뷰 신고 글 목록 요청 처리
    @GetMapping("/report-list")
    public String reportList(Criteria cri, Model model){
        log.info("/report/report-list GET요청 발생: " + cri);
        List<Report> reportList = reportService.reportSearchList(cri);
        model.addAttribute("report_list",reportList);
        model.addAttribute("pageInfo", new PageMaker(cri,reportService.reportGetTotal(cri)));
        return "report/report-list";
    }

    //리뷰 신고 글 등록 화면 요청 처리
    @GetMapping("/report-register")
    public String reportRegister(){
        log.info("/report/report-register GET요청");
        return "report/report-register";
    }

    //리뷰 신고 글 데이터베이스 저장 요청
    @PostMapping("/report-register")
    public String reportRegister(Report report, RedirectAttributes ra){
        log.info("/report/report-register POST요청: " + report);
        reportService.reportRegister(report);
        ra.addFlashAttribute("msg","reportSuccess");
        return "redirect:/review/rev_list";
    }

    //리뷰 신고 글 상세 보기 요청
    @GetMapping("/report-get")
    public String reportGet(Long reportNo,@ModelAttribute("pageInfo") Criteria cri, Model model){
        log.info("/report/report-get GET요청: " + reportNo);
        model.addAttribute("report",reportService.reportGet(reportNo));
        return "report/report-get";
    }

    //리뷰 신고 삭제 요청
    @PostMapping("/report-remove")
    public String reportDelete(Long reportNo, RedirectAttributes ra){
        log.info("/report/report-remove POST요청: " + reportNo);
        boolean reportRemove = reportService.reportRemove(reportNo);
        if (reportRemove){
            ra.addFlashAttribute("msg","delSuccess");
        }
        return "redirect:/report/report-get";
    }


}
