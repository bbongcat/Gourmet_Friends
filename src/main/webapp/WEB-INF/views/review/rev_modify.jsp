<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>

    .select_img img {
        width: 500px;
        margin: 20px 0;
    }

    .star-rating .on {
        font-size: 25px;
        color: #ffc048;
    }
</style>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-6.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">
            Review</h1>
    </div>
</div>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form role="form" action="/review/rev_modify" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label>리뷰 번호</label>
                            <input class="form-control" name='revBno' value='${review.revBno}' readonly>
                        </div>

                        <div class="form-group">
                            <label>음식점</label>
                            <input id="restName_input" readonly value="${review.restName}">
                            <input id="restNo_input" name="restNo" type="hidden" value="${review.restNo}">
                            <button class="restNo_btn">음식점 선택</button>
                        </div>

                        <div class="form-group">
                            <label>리뷰 내용</label>
                            <textarea class="form-control" rows="5" name='revContent'>${review.revContent}</textarea>
                        </div>

                        <!-- 리뷰 평점 api생성하기 -->
                        <div class="form-group">
                            <label>리뷰 평점</label>
                            <div class="star-rating">
                                <a href="#" class="on" id="1">★</a>
                                <a href="#" class="on" id="2">★</a>
                                <a href="#" class="on" id="3">★</a>
                                <a href="#" id="4">★</a>
                                <a href="#" id="5">★</a>
                                <input type="hidden" id="revStar" name="revStar" value="3">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>회원</label>
                            <input class="form-control" name='userId' value='${loginUser.userId}' readonly>
                        </div>

                        <div class="form_group">
                            <label for="reviewImg">리뷰 이미지</label>
                            <input type="file" id="reviewImg" name="file">
                            <div class="select_img">
                                <img src="${review.reviewImg}">
                                <input type="hidden" name="reviewImg" value="${review.reviewImg}">
                                <input type="hidden" name="reviewThumbImg" value="${review.reviewThumbImg}">
                            </div>
                        </div>

                        <input type="hidden" name="page" value="${pageInfo.page}">
                        <input type="hidden" name="type" value="${pageInfo.type}">
                        <input type="hidden" name="keyword" value="${pageInfo.keyword}">

                        <div class="btn-group">
                            <button type="submit" data-oper='rev_modify' class="btn btn-blue">수정</button>
                            <button type="button" data-oper='rev_remove' class="btn btn-blue">삭제</button>
                            <button type="button" data-oper='rev_list' class="btn btn-blue">목록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    document.querySelector('.btn-group').addEventListener('click', function (e) {
        e.preventDefault(); //submit기능 중지(서버로 전송 가능)

        const oper = e.target.dataset.oper;

        const $actionForm = document.querySelector('form[role=form]')

        if (oper === 'rev_list') {
            $actionForm.setAttribute('action', '/review/rev_list');
            $actionForm.setAttribute('method', 'get');
        } else if (oper === 'rev_remove') {
            $actionForm.setAttribute('action', '/review/rev_remove');
        }

        //form을 submit
        $actionForm.submit();
    });

    $(document).ready(function () {

        $('.star-rating a').click(function () {
            $(this).parent().children('a').removeClass('on');
            $(this).addClass('on').prevAll('a').addClass('on');
            let starRate = $(this).attr('id');
            $('#revStar').val(starRate);
            return false;
        });

    });

    //리뷰 이미지 
    $("#reviewImg").change(function () {
        if (this.files && this.files[0]) {
            let reader = new FileReader;
            reader.onload = function (data) {
                $(".select_img img").attr("src", data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
</script>


<%@include file="../includes/footer.jsp" %>