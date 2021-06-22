<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>
    td{
        border: 1px solid #000;
        border-collapse: collapse;
    }

    #userAddress{
        top: 5px;
    }
    
    #userOaddress{
        width: 40%; 
        display: inline;
    }
</style>

<article class="container">
    <div class="page-header">
        <div class="col-md-6 col-md-offset-3">
            <h3>회원가입</h3>
        </div>
    </div>
    <div class="col-sm-6 col-md-offset-3">
        <form action="/user/sign_up" method="post" role="form" id="userCheck" name="user">

            <input type="hidden" name="userAuth" value="COMMON">

            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" class="form-control" id="userId" name="userId" placeholder="ID">
                <div class="eheck-font" id="id-check"></div>
            </div>

            <div class="form-group">
                <label for="userPw">비밀번호</label>
                <input type="password" class="form-control" id="userPw" name="userPw" placeholder="PASSWORD">
                <div class="eheck-font" id="pw-check"></div>
            </div>

            <div class="form-group">
                <label for="userPw2">비밀번호 확인</label>
                <input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="Confirm PASSWORD">
                <div class="eheck-font" id="pw2-check"></div>
            </div>

            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" class="form-control" id="userName" name="userName" placeholder="NAME">
                <div class="eheck-font" id="name-check"></div>
            </div>

            <div class="form-group">
                <label for="userBirth">생년월일</label>
                <input type="tel" class="form-control" id="userBirth" name="userBirth" placeholder="ex)19990101">
                <div class="eheck-font" id="birth-check"></div>
            </div>

            <div class="form-group">
                <label for="userEmail">이메일 주소</label>
                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="E-mail">
                <div class="eheck-font" id="email-check"></div>
            </div>

            <div class="form-group">
                <label for="userPhone">휴대폰 번호('-'없이 번호만 입력해주세요)</label>
                <input type="tel" class="form-control" id="userPhone" name="userphone" placeholder="Phone-Number">
                <div class="eheck-font" id="phone-check"></div>
            </div>

            <div class="form-group">
                <label for="userGender">성별</label>
                <input type="checkbox" id="userGender" name="userGender" value="남">남
                <input type="checkbox" id="userGender" name="userGender" value="여">여
            </div>

            <div class="form-group">
                <label for="userAddress">주소</label>
                <input type="text" class="form-control" placeholder="우편번호" name="userOaddress" id="userOaddress" readonly>
                <button type="button" class="btn btn-default" onclick='execPostCode();'><i class="fa fa-search"></i>우편번호 찾기</button>
            </div>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="도로명 주소" name="userAddress" id="userAddress" readonly>
            </div>

            <div class="form-group"> 
                <input type="text" class="form-control" placeholder="상세주소" name="userDetailaddress" id="userDetailaddress">
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">회원가입</button>
            </div>
        </form>        
    </div>
</article>

<script>

    $(document).ready(function(){

        //모든 공백 체크 정규식 
        const empCheck = RegExp(/\s/g); 
        //아이디 정규식 
        const idCheck = RegExp(/^[a-z0-9][a-z0-9_\-]{4,19}$/); 
        // 비밀번호 정규식 
        const pwCheck = RegExp(/^[A-Za-z0-9]{4,12}$/);
        // 이름 정규식 
        const nameCheck = RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/); 
        // 이메일 검사 정규식 
        const mailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i); 
        // 휴대폰 번호 정규식 
        const phoneCheck = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/); 
            
        const address = $('#userDetailaddress');
        

        //아이디 중복 확인 
        $('#userId').blur(function(){
            if($('#userId').val() == ''){
                $('#id-check').text('아이디를 입력하세요.');
                $('#id-check').css('color','red');

            }else if(idCheck.test($('#userId').val()) != true){
                $('#id-check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                $('#id-check').css('color','red');
            }else if($('#userId').val() != ''){

                const userId = $('#userId').val();

                fetch('/check?kind=userId&info=', userId)
                    .then(res => res.text())
                    .then(flag => {
                        if(flag === 'ture'){
                            $('#id-check').text('중복된 아이디입니다.');
                            $('#id-check').css('color','red');
                        }else{
                            if(idCheck.test(uesrId)){
                                $('#id-check').text('사용가능 한 아이디입니다.');
                                $('#id-check').css('color','blue');
                                $("#userCheck").attr("disabled", false);
                            }else if(userId == ''){
                                $('#id-check').text('아이디를 입력해주세요');
                                $('#id-check').css('color','red');
                                $('#userCheck').attr("disabled", true);
                            }else{
                                $('#id-check').text('아이디는 소문자와 숫자 4~12자리만 가능합니다.');
                                $('#id-check').css('color','red');
                                $('#userCheck').attr("disabled", true);
                            }
                        }
                    });
            }
        });

        $('form').on('submit',function(){
            const inval_arr = new Array(8).fill(false);
            if(idCheck.test($('#userId').val())){
                inval_arr[0] = true;
            }else {
                inval_arr[0] = false;
                alert('아이디를 확인하새요.');
                return false;
            }
            //비밀번호가 같은 경우 && 비밀번호 정규식 
            if(($('#userPw').val() == ($('#userPw2').val()))
                    && pwCheck.test($('#userPw').val())){
                        inval_arr[1] = true;
            } else {
                inval_arr[1] = false;
                alert('비밀번호를 확인하세요');
                return false;
            }
            //이름 정규식 
            if(nameCheck.test($('#userName').val())){
                inval_arr[2] = true;
            }else{
                inval_arr[2] = false;
                alert('이름을 확인하세요.');
                return false;
            }
            //생년월일 정규식 
            if(birthCheck){
                console.log(birthCheck);
                inval_arr[3] = true;
            } else{
                inval_arr[3] = false;
                alert('생년월일을 확인하세요');
                return false;
            }
            //이메일 정규식 
            if(mailCheck.test($('#userEmail').val())){
                console.log(mailCheck.test($('#userEmail').val()));
                inval_arr[4] = true;
            }else{
                inval_arr[4] = false;
                alert('이메일을 확인하세요');
                return false;
            }
            //휴대폰 번호 정규식 
            if(phoneCheck.test($('#userPhone').val())){
                console.log(phoneCheck.test($('#userPhone').val()));
                inval_arr[5] = true;
            }else{
                inval_arr[5] = false;
                alert('휴대폰 번호를 확인하세요.');
                return false;
            }
            //성별 확인 
            if(user.userGender[0].checkd == false && user.userGender[1].checkd == false){
                inval_arr[6] = false;
                alert('성별을 확인하세요.');
                return false;
            }else {
                inval_arr[6] = true;
            }
            //주소 확인 
            if(address.val() == ''){
                inval_arr[7] = false;
                alert('주소를 확인하세요');
                return false;
            }else{
                inval_arr[7] = true;
            }
            //전체 유효성 검사
            const validAll = true;
            for(let i = 0; i < inval_arr.length; i++){
                if(inval_arr[i] == false){
                    validAll = false;
                }
            }
            if(validAll == true){
                alert('저희의 가족이 되어주셔서 감사합니다.');
            }else{
                alert('정보를 다시 확인하세요.');
            }
        });

        $('#userId').blur(function(){
            if(idCheck.test($('#userId').val())){
                $('#id-check').text('');
            }else{
                $('#id-Check').text('5~20의 영문 소문자, 숫자와 특수 기호(_),(-)만 사용 가능합니다.');
                $('#id-check').css('color','red');
            }
        });

        $('#userPw').blur(function(){
            if(pwCheck.test($('#userPw').val())){
                $('#pw-check').text('');
            }else{
                $('#pw-Check').text('4~12자의 숫자, 문자로만 사용가능합니다.');
                $('#pw-check').css('color','red');
            }
        });
        //패스워드 일치 확인 
        $('#userPw2').blur(function(){
            if($('#userPw').val() != $(this).val()){
                $('#pw-check').text('비밀번호가 일치하지 않습니다.');
                $('#pw-check').css('color','red');
            }else{
                $('#pw-Check').text('');
            }
        });
        //이름에 특수문자 들어가지 않도록 설정 
        $('#userName').blur(function(){
            if(nameCheck.test($(this).val())){
                $('#name-check').text('');
            }else{
                $('#name-check').text('한글 2~4자 이내로 입력하세요.(특수기호, 공백 사용 불가)');
                $('#name-check').css('color','red');
            }
        });

        $('#userEmail').blur(function(){
            if($('#userEmail').val() == ''){
                $('#email-check').text('이메일을 입력하세요.');
                $('#email-check').css('color','red');
            }else if(emailCheck.test($('#userEmail').val()) != true){
                $('#email-check').text('이메일 형식이 맞지 않습니다.');
                $('#email-check').css('color','red');
            }else if($('#userEmail').val() != ''){
                const userEmail = $('#userEmail').val();
                fetch('/check?kind=userEmail&info=' + userEmail)
                    .then(res => res.text())
                    .then(flag => {
                        if(flag === 'ture'){
                            $('#email-check').text('중복된 이메일입니다.');
                            $('#email-check').css('color','red');
                            $('#userCheck').attr('disabled',true);
                        }else{
                            $('#email-check').text('사용가능한 이메일입니다.');
                            $('#email-check').css('color','blue');
                            $('#userCheck').attr('disabled',false);
                        }
                    });
            }
        });

        //생일 유효성 검사
        const birthCheck = false;
        
        $('#userBirth').blur(function(){
            const dateStr = $(this).val();
            const year = Number(dateStr.substr(0,4));//입력한 값의 0~4자리까지(연)
            const month = Number(dateStr.substr(4,2));//입력한 값의 4번째 자리부터 2자리 숫자(월)
            const day = Number(dateStr.substr(6,2));//입력한 값 6번째 자리부터 2자리 숫자(일)
            const today = new Date();//날짜 변수 선언 
            const yearNow = today.getFullYear(); //올해 연도 가져옴 

            if(dateStr.length <= 8){
                //연도의 경우 1900보다 작거나 yearNow보다 크다면 false를 반환합니다.
                if(year > yearNow || year < 1900){
                    $('#birth-check').text('생년월일을 확인하세요.');
                    $('#birth-check').css('color','red');
                }else if(month < 1 || month > 12){
                    $('#birth-check').text('생년월일을 확인하세요.');
                    $('#birth-check').css('color','red');
                }else if(day < 1 || day > 31){
                    $('#birth-check').text('생년월일을 확인하세요.');
                    $('#birth-check').css('color','red');
                }else if((month == 4 || month == 6 || month == 9 || month == 11) && day == 31){
                    $('#birth-check').text('생년월일을 확인하세요.');
                    $('#birth-check').css('color','red');
                }else if(month == 2){
                    const isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));

                    if(day > 29 || (day == 29 && !isleap)){
                        $('#birth-check').text('생년월일을 확인하세요.');
                        $('#birth-check').css('color','red');
                    }else{
                        $('#birth-check').text('');
                        birthCheck = true;
                    }
                }else{
                    $('#birth-check').text('');
                    birthCheck = true;
                }
            }else{
                //1.입력된 생년월일이 8자 초과할 때 : auth:false
                $('#birth-check').text('생년월일을 확인하세요.');
                $('#birth-check').css('color','red');
            }
        });

        //휴대폰 번호 
        $('#userPhone').blur(function(){
            if(phoneCheck.test($(this).val())){
                $('#phon-check').text('');
            }else{
                $('#phone-check').text('휴대폰 번호를 확인하세요.');
                $('#phone-check').css('color','red');
            }
        });
    });
   
        //우편번호 찾기 버튼 클릭 시 발생 이벤트 
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
    
    
</script>
<%@include file="../includes/footer.jsp"%>
