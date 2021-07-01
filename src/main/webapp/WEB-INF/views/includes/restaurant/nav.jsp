<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
    <c:if test="${user == null}">
        <li>
            <a href="/user/login">로그인</a>
        </li>
        <li>
            <a href="/user/sign_up">회원가입</a>
        </li>
    </c:if>
    <c:if test="${user != null}">

        <c:if test="${loginUser.userAuth == 'ADMIN'}">
            <li>
                <a href="/admin/manager">관리자 페이지</a>
            </li>
        </c:if>

        <li>
                ${user.userName}님 환영합니다.
        </li>
        <li>
            <a href="/user/logout">로그아웃</a>
        </li>
    </c:if>

</ul>