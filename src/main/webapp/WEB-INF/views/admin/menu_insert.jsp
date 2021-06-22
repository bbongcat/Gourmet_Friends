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

      <link rel="stylesheet" href="/css/admin/menu_insert.css">
      <script src="/vendor/jquery/jquery.min.js"></script>
      <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>


  </head>
  <body>
        <%@include file="../includes/admin/header.jsp"%>
            
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>메뉴 등록</span></div>

                <div class="admin_content_main">
                    <form action="/admin/menu_insert" method="POST" id="insertForm">
                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 이름</label>
                            </div>
                            <div class="form_section_content">
                                <input name="menuName">
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점</label>
                            </div>
                            <div class="form_section_content">
                              <input id="restName_input" readonly>
                              <input id="restNo_input" name="restNo" type="hidden">
                              <button class="restNo_btn">음식점 선택</button>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 소개</label>
                            </div>
                            <div class="form_section_content">
                              <textarea name="menuIntro" id="menuIntro_textarea"></textarea>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 가격</label>
                            </div>
                            <div class="form_section_content">
                              <input name="menuPrice" value="0">
                            </div>
                        </div>
            
                        <!-- 메뉴 사진 -->
                    </form>

                    <div class="btn_section">
                        <button id="cancelBtn" class="btn">취 소</button>
                        <button id="insertBtn" class="btn insert_btn">등 록</button>
                    </div>
                </div>
            </div>
        
        <%@include file="../includes/admin/footer.jsp"%>

        <script>

            let insertForm = $("#insertForm");

            //취소 버튼 
            $("#cancelBtn").click(function(){

                location.href="/admin/menu_manage";

            });

            //등록 버튼
            $("#insertBtn").on("click",function(e){

                e.preventDefault();
                insertForm.submit();

            });

            //위지윅 적용 
            ClassicEditor
                .create(document.querySelector('#menuIntro_textarea'),config)
                .catch(error => {
                    console.error(error);
                });

            $('.restNo_btn').on("click",function(e){
                e.preventDefault();

                let popUrl= "/admin/rest_pop";
                let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";

                window.open(popUrl, "음식점 선택", popOption);
            });
        </script>

  </body>
  </html>