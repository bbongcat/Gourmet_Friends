<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-2.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">
            Food Friends</h1>
    </div>
</div>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">
            <!-- Section Title -->
            <div class="title-wrap">
                <h2 class="section-title k-font-subtitle">내 곁의 밥친구</h2>
                <p class="section-sub-title">당신의 음식 취향, 먹고 싶은 음식, 심지어 취미까지.<br>뭐든 알려주세요. 밥친구가 나타날거에요.</p>

            </div>

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form role="form" action="/food_friends/ff_register" method="post">
                        <div class="form-group">
                            <label>카테고리</label>&nbsp;
                            <select name="cateNotice">
                                <c:if test="${loginUser.userAuth == 'ADMIN'}">
                                    <option selected value="SPECIFIC">공지</option>
                                </c:if>
                                <option value="GENERAL" selected>일반</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>제목</label> <input class="form-control" name='title'>
                        </div>

                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="8" name='content'></textarea>
                        </div>

                        <div class="form-group">
                            <label>회원</label> <input class="form-control" name='userId' readonly
                                                     value="${loginUser.userId}">
                        </div>

                        <button type="submit" class="btn btn-default">Submit</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="../includes/footer.jsp" %>