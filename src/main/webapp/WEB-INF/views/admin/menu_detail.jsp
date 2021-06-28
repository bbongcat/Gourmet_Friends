<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MENU Detail</title>

    <link rel="stylesheet" href="/css/admin/menu_detail.css">
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>

</head>
<body>
    <%@include file="../includes/admin/header.jsp"%>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>메뉴 상세</span></div>
            <div class="admin_content_main">

                <div class="form_section">
                    <div class="form_section_title">
                        <label>메뉴 이름</label>
                    </div>
                    <div class="form_section_content">
                        <input name="menuNo" value="<c:out value='${menuInfo.menuNo}'/>" disabled>
                    </div>
                </div>
                
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점</label>
                    </div>
                    <div class="form_section_content">
                        <input id="restName_input" readonly value="${menuInfo.restName}" disabled> 
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>메뉴 가격</label>
                    </div>
                    <div class="form_section_content">
                        <input name="menuPrice" value="<c:out value='${menuInfo.menuPrice}'/>" disabled> 
                    </div>
                </div>
                
                <div class="form_section">
                    <div class="form_section_title">
                        <label>메뉴 소개</label>
                    </div>
                    <div class="form_section_content">
                        <textarea name="menuIntro" id="menuIntro_textarea"disabled>${menuInfo.menuIntro}</textarea>
                    </div>
                </div>
               
                <div class="form_section">
                    <div class="form_section_title">
                        <label for="menuImg">메뉴 이미지</label>
                    </div>
                    <p>원본 이미지</p>
                    <img src="${menuInfo.menuImg}" class="oriImg">

                    <p>썸네일</p>
                    <img src="${menuInfo.menuThumbImg}" class="thumbImg">
                </div>

                <div class="btn_section">
                    <button id="cancelBtn" class="btn">메뉴 목록</button>
                    <button id="modifyBtn" class="btn modify_btn">수 정</button>
                </div>

            </div>

            <form id="moveForm" action="/admin/menu_manage" method="GET">
                <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
                <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
            </form>
        </div>
        
    <%@include file="../includes/admin/footer.jsp"%>

    <script>

        $(document).ready(function(){

            // 메뉴 소개 
            ClassicEditor
                    .create(document.querySelector('#menuIntro_textarea'))
                    .then(editor => {
                        console.log(editor);
                        editor.isReadOnly = true;
                    })
                    .catch(error => {
                        console.error(error);
                    });
            
        });

        $("#cancelBtn").on("click",function(e){
            e.preventDefault();
            $("#moveForm").submit();
        });

        $("#modifyBtn").on("click",function(e){
            e.preventDefault();
            let addInput = '<input type="hidden" name="menuNo" value="${menuInfo.menuNo}">';
            $("#moveForm").append(addInput);
            $("#moveForm").attr("action","/admin/menu_modify");
            $("#moveForm").submit();
        });

    </script>

</body>
</html>