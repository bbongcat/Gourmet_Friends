<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <link rel="stylesheet" href="/css/admin/rest_insert.css">
      <script src="/vendor/jquery/jquery.min.js"></script>

  </head>
  <body>
        <%@include file="../includes/admin/header.jsp"%>
            
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>음식점 등록</span></div>

                <div class="admin_content_main">
                    <form action="/admin/rest_insert" method="POST" id="insertForm">
                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 이름</label>
                            </div>
                            <div class="form_section_content">
                                <input type="text" class="form-control" name="restName" placeholder="음식점 이름">
                                <span id="warn_restName">음식점 이름을 입력해주세요.</span>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 전화번호</label>
                            </div>
                            <div class="form_section_content">
                                <input type="text" class="form-control" name="restPh" placeholder="음식점 전화번호">
                                <span id="warn_restPh">음식점 전화번호를 입력해주세요.</span>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 영업시간</label>
                            </div>
                            <div class="form_section_content">
                                <input type="text" class="form-control" name="restTime" placeholder="음식점 영업시간">
                                <span id="warn_restTime">음식점 영업시간을 입력해주세요.</span>
                            </div>
                        </div>

                        <!-- 음식점 메인사진 첨부 영역 -->

                        <div class="form_section">
                            <div class="form_section_content">
                                <input type="text" class="form-control" placeholder="우편번호" name="restOaddress" id="restOaddress" readonly>                                
                            </div>
                            <button type="button" class="btn btn-default" onclick='execPostCode();'><i class="fa fa-search"></i>우편번호 찾기</button>
                        </div>
            
                        <div class="form_section">
                            <div class="form_section_content">
                                <input type="text" class="form-control" placeholder="도로명 주소" name="restAddress" id="restAddress" readonly>
                            </div>
                        </div>
            
                        <div class="form_section">
                            <div class="form_section_content">
                                <input type="text" class="form-control" placeholder="상세주소" name="restDetailaddress" id="restDetailaddress">
                                <span id="warn_restDetailaddress">음식점 상세주소를 입력해주세요.</span>
                            </div>
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

        //우편번호 찾기
        function execPostCode(){
            daum.postcode.load(function(){
        
                new daum.Postcode({
                    oncomplete : function(data){
                    //팝업에서 검색결과 항목을 클릭했을 때 실행 할 코드를 작성하는 부분 
        
                    //도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    //내려오는 변수가 값이 없는 경우엔 공백('') 값을 가지므로, 이를 참고하여 분기 한다.
                    let fullRoadAddr = data.roadAddress;//도로명 주소 변수
                    let extraRoadAddr = '';//도로명 조합형 주소 변수
        
                    //법정동명이 있을 경우 추가한다.(법정리는 제외)
                    //법정동의 경우 마지막 문자가 '동/로/가'로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    //건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    //도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ') ';
                    }
                    //도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if(fullRoadAddr !== ''){
                        fullRoadAddr += extraRoadAddr;
                    }
                    
                    //우편번호와 주소정보를 해당필드에 넣는다.
                    console.log(data.zonecode);
                    console.log(fullRoadAddr);
                    
                    $('[name=userOaddress]').val(data.zonecode);
                    $('[name=userAddress]').val(fullRoadAddr);
        
                    document.getElementById('userOaddress').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('userAddress').value = fullRoadAddr;
        
                    }
                }).open();
            });
        }

        //등록 버튼
        $('#insertBtn').click(function(){

            let nameCheck = false;
            let phCheck = false;
            let timeCheck = false;
            let addressCheck = false;
            
            let restName = $('input[name=restName]').val();
            let restPh = $('input[name=restPh]').val();
            let restTime = $('input[name=restTime]').val();
            let restDetailaddress = $('input[name=restDetailaddress]').val();

            let wRestName = $('#warn_restName');
            let wRestPh = $('#warn_restPh');
            let wRestTime = $('#warn_restTime');
            let wRestDetailaddress = $('warn_restDetailaddress');

            //음식점 이름 공란 체크
            if(restName === ''){
                wRestName.css('display','block');
                nameCheck = false;
            }else{
                wRestName.css('display','none');
                nameCheck = true;
            }

            //음식점 전화번호 공란 체크
            if(restPh === ''){
                wRestPh.css('display','block');
                phCheck = false;
            }else{
                wRestPh.css('display','none');
                phCheck = true;
            }

            //음식점 영업시간 공란 체크
            if(restTime === ''){
                wRestTime.css('display','block');
                timeCheck = false;
            }else{
                wRestTime.css('display','none');
                timeCheck = true;
            }

            //음식점 주소 공란 체크
            if(restDetailaddress === ''){
                wRestDetailaddress.css('display','block');
                addressCheck = false;
            }else{
                wRestDetailaddress.css('display','none');
                addressCheck = true;
            }
            
            //최종 검사 
            if(nameCheck && phCheck && timeCheck && addressCheck){
                $('#insertForm').submit();
            }else{
                return;
            }
        });

        //취소 버튼 
        $('#cancelBtn').click(function(){
            location.href="/admin/rest_manage";
        });


    </script>

  </body>

  
  </html>