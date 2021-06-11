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
                <label for="userNick">닉네임</label>
                <input type="text" class="form-control" id="userNick" name="userNick" placeholder="NickName">
                <div class="eheck-font" id="nick-check"></div>
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
                <input type="checkbox" id="userGender" name="userGender" value="남">남
                <input type="checkbox" id="userGender" name="userGender" value="남">여
            </div>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="우편번호" name="userOaddress" id="userOaddress" readonly>
                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 찾기</button>
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
            
        const birthCheck = false;

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

                const reqInfo = $('#userId').val();

                fetch('/check?kind=userId&info=' + reqInfo)
                    .then(res => res.text())
                    .then(reqInfo => {
                        if(reqInfo > 0){
                            $('id-check').text('중복된 아이디입니다.');
                            $('id-check').css('color','red');
                        }else{
                            if(idCheck.test(reqInfo)){
                                $('id-check').text('사용가능 한 아이디입니다.');
                                $('id-check').css('color','blue');
                                $("#usercheck").attr("disabled", false);
                            }
                        }
                    })
            }
        })
    });
        
    
</script>