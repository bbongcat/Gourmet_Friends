<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="container">
    <div class="row">
       <div class="offset-md-2 col-md-4">
          <div class="card" style="width:200%;">
             <div class="card-header text-white" style="background: #d9d9de;">
                <h2> 로그인</h2>               
             </div>
             <div class="card-body">
                <form action="/loginCheck" name="sign-in" method="post" id="signInForm"
                style="margin-bottom: 0;">
                <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                   <tr>
                      <td style="text-align: left">
                         <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
                      </td>
                   </tr>
                   <tr>
                      <td><input type="text" name="userId" id="signInId"
                         class="form-control tooltipstered" maxlength="10"
                         required="required" aria-required="true"
                         style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                         placeholder="ID"></td>
                   </tr>
                   <tr>
                      <td style="text-align: left">
                         <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
                      </td>
                   </tr>
                   <tr>
                      <td><input type="password" size="17" maxlength="20" id="signInPw"
                         name="userPw" class="form-control tooltipstered" 
                         maxlength="20" required="required" aria-required="true"
                         style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                         placeholder="PASSWORD"></td>
                   </tr>
                   
                   <!-- 자동 로그인 체크박스 -->
                   <tr>
                      <td>
                         <label for="auto-login">
                            <span>
                            <i class="fa fa-sign-in" aria-hidden="true"></i> 
                            자동 로그인
                            <input type="checkbox" id="auto-login" name="isAutoLogin">
                            </span>
                         </label>
                      </td>
                   </tr>
                   
                   <tr>
                      <td style="padding-top: 10px; text-align: center">
                         <p><strong>로그인하셔서 더 많은 서비스를 이용해보세요!</strong></p>
                      </td>
                   </tr>
                   <tr>
                      <td style="width: 100%; text-align: center; colspan: 2;"><input
                         type="submit" value="로그인" class="btn form-control tooltipstered" id="signIn-btn"
                         style="background-color: #343A40; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
                      </td>
                   </tr>
                   <tr>
                      <td
                         style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">
 
                         <a class="btn form-control tooltipstered" href="/user/sign_up"
                         style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: gray; border: 0px solid #388E3C; opacity: 0.8">
                            회원가입</a>
                      </td>
                   </tr>
                   
                </table>
             </form>
             </div>
          </div>
       </div>
    </div>
 </div>

 <Script>
     const msg = '${msg}';
     if(msg === 'joinSuccess'){
         alert('축하합니다. 회원가입에 성공했습니다.');
     }
 </Script>
<%@include file="../includes/footer.jsp"%>