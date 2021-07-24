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

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form role="form" action="/food_friends/ff_modify" method="post">

                        <div class="form-group">
                            <label>번호</label>
                            <input class="form-control" name='bno' value='${foodFriends.ffBno}' readonly>
                        </div>

                        <div class="form-group">
                            <label>제목</label>
                            <input class="form-control" name='title' value='${foodFriends.title}'>
                        </div>

                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="5" name='content'>${foodFriends.content}</textarea>
                        </div>

                        <div class="form-group">
                            <label>회원ID</label>
                            <input class="form-control" name='writer' value='${loginUser.userId}' readonly>
                        </div>

                        <div class="form-group">
                            <label>등록시간</label>
                            <input class="form-control" name='regDate'
                                   value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${foodFriends.regDate}" />'
                                   readonly>
                        </div>

                        <div class="form-group">
                            <label>수정시간</label>
                            <input class="form-control" name='updateDate'
                                   value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${foodFriends.updateDate}" />'
                                   readonly>
                        </div>

                        <input type="hidden" name="page" value="${pageInfo.page}">
                        <input type="hidden" name="type" value="${pageInfo.type}">
                        <input type="hidden" name="keyword" value="${pageInfo.keyword}">
                        <br>
                        <br>

                        <div class="btn-group">
                            <button type="submit" data-oper='ff_modify' class="btn btn-blue">수정</button>
                            <button type="button" data-oper='ff_remove' class="btn btn-blue">삭제</button>
                            <button type="button" data-oper='ff_list' class="btn btn-blue">목록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

    <script>

        document.querySelector('.btn-group').addEventListener('click', function (e) {
            e.preventDefault();

            const oper = e.target.dataset.oper;

            const $actionForm = document.querySelector('form[role=form]')

            if (oper === 'ff_list') {

                $actionForm.setAttribute('action', '/food_friends/ff_list');
                $actionForm.setAttribute('method', 'get');
            } else if (oper === 'ff_remove') {

                $actionForm.setAttribute('action', '/food_friends/ff_remove');
            }

            $actionForm.submit();
        });

    </script>


<%@include file="../includes/footer.jsp" %>