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

    <link rel="stylesheet" href="/css/admin/rest_modify.css">
    <script src="/vendor/jquery/jquery.min.js"></script>

</head>
<body>
    <%@include file="../includes/admin/header.jsp"%>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>음식점 상세</span></div>
            <div class="admin_content_main">
              <form id="modifyForm" action="/admin/rest_modify" method="POST">
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
                        <input class="input_block" name="cateCode" value="<c:out value='${restInfo.cateCode}'></c:out>">
                        <span id="warn_cateCode">음식점 카테고리를 입력해주세요.</span>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 이름</label>
                </div>
                <div class="form_section_content">
                    <input class="input_block" name="restName" value="<c:out value='${restInfo.restName}'></c:out>">
                    <span id="warn_restName">음식점 이름을 입력해주세요.</span>
                </div>

                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 전화번호</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restPh" value="<c:out value='${restInfo.restPh}'></c:out>">
                        <span id="warn_restPh">음식점 전화번호를 입력해주세요.</span>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 영업시간</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restTime" value="<c:out value='${restInfo.restTime}'></c:out>">
                        <span id="warn_restTime">음식점 영업시간을 입력해주세요.</span>
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
                        <input class="input_block" name="restDetailaddress" value="<c:out value='${restInfo.restDetailaddress}'></c:out>">
                        <span id="warn_restDetailaddress">음식점 상세주소를 입력해주세요.</span>
                    </div>
                </div>
                
                <div class="btn_section">
                    <button id="cancelBtn" class="btn">취 소</button>
                    <button id="modifyBtn" class="btn modify_btn">수 정</button>
                </div>
              </form>
                
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


    let moveForm = $('#moveForm');
    let modifyForm = $('#modifyForm');

    //음식점 관리 페이지 이동 버튼 
    $("#cancelBtn").on("click",function(e){
        e.preventDefault();
        moveForm.attr("action","/admin/rest_detail");
        moveForm.submit();
    });

    //음식점 수정 페이지 이동 버튼 & 유효성 검사 
    $("#modifyBtn").on("click",function(e){
        let restName = $(".form_section_content input[name='restName']").val();
        let restPh = $(".form_section_content input[name='restPh']").val();
        let restTime = $(".form_section_content input[name='restTime']").val();
        let restAddress= $(".form_section_content input[name='restDetailaddress']").val();
        let cateCode = $(".form_section_content input[name='cateCode']").val();

        let nameCheck = false;
        let phCheck = false;
        let timeCheck = false;
        let addressCheck = false;
        let cateCodeCheck = false;

        e.preventDefault();

        if(!restName){
            $('warn_restName').css('display','block');
        }else{
            $('warn_restName').css('display','none');
            nameCheck = true;
        }

        if(!restPh){
            $('warn_restPh').css('display','block');
        }else{
            $('warn_restPh').css('display','none');
            phCheck = true;
        }

        if(!restTime){
            $('warn_restTime').css('display','block');
        }else{
            $('warn_restTime').css('display','none');
            timeCheck = true;
        }

        if(!restAddress){
            $('warn_restDetailaddress').css('display','block');
        }else{
            $('warn_restDetailaddress').css('display','none');
            addressCheck = true;
        }

        if(!cateCode){
            $('warn_cateCode').css('display','block');
        }else{
            $('warn_cateCode').css('display','none');
            cateCodeCheck = true;
        }

        if(nameCheck && phCheck && timeCheck && addressCheck && cateCodeCheck){
            modifyForm.submit();
        } else{
            return false;
        }


    });
        
    </script>
    
</body>
</html>