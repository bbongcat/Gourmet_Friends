<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<link rel="stylesheet" href="/css/login/login.css">

<div class="jumbotron d-flex align-items-center" style="background-color: transparent;">
    <div class="container text-center">
        <div class="margin10">
            <div class="card-body">
                <form action="/loginCheck" name="sign-in" method="post" id="signInForm">
                    <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                        <tr>
                            <td class="column_01">
                                <p>아이디를 입력해주세요.&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="text" name="userId" id="signInId"
                                       class="form-control tooltipstered" maxlength="10"
                                       required="required" aria-required="true" placeholder="최대 10자"></td>
                        </tr>
                        <tr>
                            <td class="column_01">
                                <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="password" size="17" maxlength="20" id="signInPw"
                                       name="userPw" class="form-control tooltipstered"
                                       maxlength="20" required="required" aria-required="true" placeholder="최소 8자">
                            </td>
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
                            <td class="column_02">
                                <p><strong>로그인하셔서 더 많은 서비스를 이용해보세요!</strong></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="column_03">
                                <input type="submit" value="로그인" class="btn form-control tooltipstered"
                                       id="signIn-btn">
                            </td>
                        </tr>
                        <tr>
                            <td class="column_04">
                                <a class="btn form-control sign-up" href="/user/sign-up">회원가입</a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<%--<div class="container">
    <div class="row">
        <div class="offset-md-2 col-md-4">
            <div class="card" style="width:200%;">
                <div class="card-header text-white">
                    <h2> 로그인</h2>
                </div>
                <div class="card-body">
                    <form action="/loginCheck" name="sign-in" method="post" id="signInForm">
                        <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                            <tr>
                                <td class="column_01">
                                    <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="userId" id="signInId"
                                           class="form-control tooltipstered" maxlength="10"
                                           required="required" aria-required="true" placeholder="최대 10자"></td>
                            </tr>
                            <tr>
                                <td class="column_01">
                                    <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="password" size="17" maxlength="20" id="signInPw"
                                           name="userPw" class="form-control tooltipstered"
                                           maxlength="20" required="required" aria-required="true" placeholder="최소 8자">
                                </td>
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
                                <td class="column_02">
                                    <p><strong>로그인하셔서 더 많은 서비스를 이용해보세요!</strong></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="column_03">
                                    <input type="submit" value="로그인" class="btn form-control tooltipstered"
                                           id="signIn-btn">
                                </td>
                            </tr>
                            <tr>
                                <td class="column_04">
                                    <a class="btn form-control sign-up" href="/user/sign-up">회원가입</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>--%>

<Script>


    const msg = '${msg}';
    if (msg === 'joinSuccess') {
        alert('축하합니다. 회원가입에 성공했습니다.');
    }


</Script>
<%@include file="../includes/footer.jsp" %>