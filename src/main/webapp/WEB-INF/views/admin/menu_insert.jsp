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

      <link rel="stylesheet" href="/css/admin/menu_insert.css">
      <script src="/vendor/jquery/jquery.min.js"></script>
      <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>

     

  </head>
  <body>
        <%@include file="../includes/admin/header.jsp"%>
            
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>메뉴 등록</span></div>

                <div class="admin_content_main">
                    <form action="/admin/menu_insert" method="POST" id="insertForm" enctype="multipart/form-data">
                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 이름</label>
                            </div>
                            <div class="form_section_content">
                                <input name="menuName">
                                <span class="ck_warn menuName_warn">메뉴 이름을 입력해주세요.</span>
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
                              <span class="ck_warn restNo_warn">음식점을 선택해주세요.</span>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 가격</label>
                            </div>
                            <div class="form_section_content bit">
                              <input name="menuPrice" value="0">
                              <span class="ck_warn menuPrice_warn">메뉴 가격을 입력해주세요.</span>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>메뉴 소개</label>
                            </div>
                            <div class="form_section_content">
                              <textarea name="menuIntro" id="menuIntro_textarea"></textarea>
                              <span class="ck_warn menuIntro_warn">메뉴 소개를 입력해주세요.</span>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label for="menuImg">메뉴 이미지</label>
                                <input type="file" id="menuImg" name="file">
                            </div>
                            <div class="select_img"><img src=""></div>
                        </div>
                       
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

                // 체크 변수 
                let menuNameCk = false;
                let restNoCk = false;
                let menuPriceCk = false;
                let menuIntroCk = false;

                // 체크 대상 변수 
                let menuName = $("input[name='menuName']").val();
                let restNo = $("input[name='restNo']").val();
                let menuPrice = $("input[name='menuPrice']").val();
                let menuIntro = $('.bit p').html();

                
                //공란 체크 
                if(menuName){
                    $('.menuName_warn').css('dispaly','none');
                    menuNameCk = true;
                } else{
                    $('.menuName_warn').css('dispaly','block');
                    menuNameCk = false;
                }
                
                if(restNo){
                    $('.restNo_warn').css('dispaly','none');
                    restNoCk = true;
                } else{
                    $('.restNo_warn').css('dispaly','block');
                    restNoCk = false;
                }

                if(menuPrice != 0){
                    $('.menuPrice_warn').css('dispaly','none');
                    restNoCk = true;
                } else{
                    $('.menuPrice_warn').css('dispaly','block');
                    restNoCk = false;
                }
                
                if(menuIntro != '<br data-cke-filler="true">'){
                    $('.menuIntro_warn').css('dispaly','none');
                    menuIntroCk = true;
                } else{
                    $('.menuIntro_warn').css('dispaly','block');
                    menuIntroCk = false;
                }
                
                
                if(menuNameCk && restNoCk && menuPriceCk && menuIntroCk){
                    insertForm.submit();
                }else{
                    return false;
                }


            });

            //위지윅 적용 
            ClassicEditor
                .create(document.querySelector('#menuIntro_textarea'))
                .catch(error => {
                    console.error(error);
                });               

            $('.restNo_btn').on("click",function(e){
                e.preventDefault();

                let popUrl= "/admin/rest_pop";
                let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";

                window.open(popUrl, "음식점 선택", popOption);
            });

            
            //메뉴 이미지 
            $("#menuImg").change(function(){
                if(this.files && this.files[0]){
                    let reader = new FileReader;
                    reader.onload = function(data){
                        $(".select_ img img").attr("src",data.target.result).width(500);
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });

            
        </script>

  </body>
  </html>