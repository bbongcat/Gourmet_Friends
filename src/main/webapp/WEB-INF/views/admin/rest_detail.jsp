<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/css/admin/rest_detail.css">
    <script src="/vendor/jquery/jquery.min.js"></script>

</head>
<body>
    <%@include file="../includes/admin/header.jsp"%>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>음식점 상세</span></div>
            <div class="admin_content_main">

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 번호</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restNo" readonly value="<c:out value='${restInfo.restNo}'></c:out>">
                    </div>
                </div>
                
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 카테고리</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="cateCode" readonly value="<c:out value='${restInfo.cateCode}'></c:out>"> 
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 이름</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restName" readonly value="<c:out value='${restInfo.restName}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 전화번호</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restPh" readonly value="<c:out value='${restInfo.restPh}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 영업시간</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restTime" readonly value="<c:out value='${restInfo.restTime}'></c:out>">
                    </div>
                </div>

                <!-- 음식점 메인 사진 -->

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 주소</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restOaddress" readonly value="<c:out value='${restInfo.restOaddress}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_content">
                        <input class="input_block" name="restAddress" readonly value="<c:out value='${restInfo.restAddress}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_content">
                        <input class="input_block" name="restDetailaddress" readonly value="<c:out value='${restInfo.restDetailaddress}'></c:out>">
                    </div>
                </div>

                <div class="btn_section">
                    <button id="cancelBtn" class="btn">음식점 목록</button>
                    <button id="modifyBtn" class="btn modify_btn">수 정</button>
                </div>

            </div>
        </div>
        
        <form id="moveForm" method="GET">
            <input type="hidden" name="restNo" value='<c:out value="${restInfo.restNo}"/>'>
            <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
            <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
            <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
        </form>
    <%@include file="../includes/admin/footer.jsp"%>


    <script>
        let moveForm = $('#moveForm');

        //음식점 관리 페이지 이동 버튼 
        $("#cancelBtn").on("click",function(e){
            e.preventDefault();
            $("input[name=restNo]").remove();
            moveForm.attr("action","/admin/rest_manage");
            moveForm.submit();
        });

        //음식점 수정 페이지 이동 버튼 
        $("#modifyBtn").on("click",function(e){
            e.preventDefault();
            moveForm.attr("action","/admin/rest_modify");
            moveForm.submit();
        });

    </script>
    
</body>
</html>