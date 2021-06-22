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
    <title>Document</title>

    <link rel="stylesheet" href="/css/admin/menu_modify.css">
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>

</head>
<body>
    <%@include file="../includes/admin/header.jsp"%>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>메뉴 등록</span></div>
            <div class="admin_content_main">
                <form action="/admin/menu_modify" method="POST" id="modifyForm" enctype="multipart/form-data">
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>메뉴 이름</label>
                        </div>
                        <div class="form_section_content">
                            <input name="menuName" value="${menuInfo.menuName}">
                            <span class="ck_warn menuName_warn">메뉴 이름을 입력해주세요.</span>
                        </div>
                    </div>
                    
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>음식점</label>
                        </div>
                        <div class="form_section_content">
                            <input id="restName_input" readonly value="${menuInfo.restName}">
                            <input id="restNo_input" name="restNo" type="hidden" value="${menuInfo.restNo}">
                            <button class="restNo_btn">음식점 선택</button>
                            <span class="ck_warn restNo_warn">음식점을 선택해주세요.</span>
                        </div>
                    </div>

                    <div class="form_section">
                        <div class="form_section_title">
                            <label>메뉴 가격</label>
                        </div>
                        <div class="form_section_content">
                            <input name="menuPrice" value="${menuInfo.menuPrice}">
                            <span class="ck_warn menuPrice_warn">메뉴 가격을 입력해주세요.</span>
                        </div>
                    </div>

                    <div class="form_section">
                        <div class="form_section_title">
                            <label>메뉴 소개</label>
                        </div>
                        <div class="form_section_content bit">
                            <textarea name="menuIntro" id="menuIntro_textarea">${menuInfo.menuIntro}</textarea>
                            <span class="ck_warn menuIntro_warn">메뉴 소개를 입력해주세요.</span>
                        </div>
                    </div>

                    <div class="form_section">
                        <div class="form_section_title">
                            <label for="menuImg">메뉴 이미지</label>
                            <input type="file" id="menuImg" name="file">
                        </div>
                        <div class="select_img">
                            <img src="${menuInfo.menuImg}">
                            <input type="hidden" name="menuImg" value="${menuInfo.menuImg}">
                            <input type="hidden" name="menuThumbImg" value="${menuInfo.menuThumbImg}">
                        </div>
                    </div>

                    <input type="hidden" name="menuNo" value="${menuInfo.menuNo}">
                </form>

                <div class="btn_section">
                    <button id="cancelBtn" class="btn">취 소</button>
                    <button id="modifyBtn" class="btn modify_btn">수 정</button>
                    <button id="deleteBtn" class="btn delete_btn">삭 제</button>
                </div>
            </div>

            <form id="moveForm" action="/admin/menu_manage" method="GET">
                <input type="hidden" name="menuNo" value='<c:out value="${menuInfo.menuNo}"/>'>
                <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
                <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
            </form>
        </div>
    <%@include file="../includes/admin/footer.jsp"%>

    <script>
        $(document).ready(function(){

            classicEditor
                    .create(document.querySelector('#menuIntro_textarea'))
                    .catch(error => {
                        console.error(error);
                    });
        });

        $("#cancelBtn").on("click",function(e){
            e.preventDefault();
            $("#moveForm").submit();
        });
        
        $("#deleteBtn").on("click",function(e){
            e.preventDefault();
            let moveForm = $("#moveForm");
            moveForm.find("input").remove();
            moveForm.append('<input type="hidden" name="menuNo" value="${menuInfo.menuNo}">');
            moveForm.attr("action","/admin/menu_delete");
            moveForm.attr("method","post");
            moveForm.submit();
        });

        $("#modifyBtn").on("click",function(e){
            e.preventDefault();

            let menuNameCk = false;
            let restNoCk = false;
            let menuPriceCk = false;
            let menuIntroCk = false;

            let menuName = $("input[name='menuName']").val();
            let restNo = $("input[name='restNo']").val();
            let menuPrice = $("input[name='menuPrice']").val();
            let menuInro = $(".bit p").html();

            if(menuName){
                $('.menuName_warn').css('display','none');
                menuNameCk = true;
            }else{
                $('.menuName_warn').css('display','block');
                menuNameCk = false;
            }

            if(restNo){
                $('.restNo_warn').css('display','none');
                restNoCk = true;
            }else{
                $('.restNo_warn').css('display','block');
                restNoCk = false;
            }

            if(menuPrice != 0){
                $('.menuPrice_warn').css('display','none');
                menuPriceCk = true;
            }else{
                $('.menuPrice_warn').css('display','block');
                menuPriceCk = false;
            }

            if(menuIntro != '<br data-cke-filler="true">'){
                $('.menuIntro_warn').css('display','none');
                menuIntroCk = true;
            }else{
                $('.menuIntro_warn').css('display','block');
                menuIntroCk = false;
            }

            if(menuNameCk && restNoCk && menuPriceCk && menuIntroCk){
                $("#modifyForm").submit();
            }else{
                return false;
            }

        });

         //메뉴 이미지 
         $("#menuImg").change(function(){
            if(this.files && this.files[0]){
                let reader = new FileReader;
                reader.onload = function(data){
                    $(".select_img img").attr("src",data.target.result).width(500);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });
    </script>

</body>
</html>