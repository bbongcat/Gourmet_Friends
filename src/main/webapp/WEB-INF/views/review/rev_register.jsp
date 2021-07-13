<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<style>

    .select_img img {
        margin: 20px 0;
    }

    .star-rating .on {
        font-size: 25px;
        color: #ffc048;
    }

</style>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-6.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title">Review</h1>
        <p class="k-font">
            소중한 평가를 들려주세요.
        </p>
    </div>
</div>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form role="form" action="/review/rev_register" method="post" enctype="multipart/form-data">

                        <div class="form-group" style="margin-bottom: 20px;">
                            <label>음식점</label>
                            <br>
                            <input id="restName_input" readonly>
                            <input id="restNo_input" name="restNo" type="hidden">
                            <button class="restNo_btn">음식점 선택</button>
                        </div>

                        <div class="form-group">
                            <label>리뷰 내용</label>
                            <textarea class="form-control" rows="6" name="revContent"></textarea>
                        </div>

                        <!-- 별정 기능 구현 -->
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
                            <label>회원</label> <input class="form-control" name='userId' readonly
                                                     value="${loginUser.userId}">
                        </div>

                        <br>

                        <div class="form_group">
                            <label for="review">메뉴 이미지</label>
                            <br>
                            <input type="file" id="reviewImg" name="file">
                            <div class="select_img"><img src=""></div>
                            <%=request.getRealPath("/") %>
                        </div>

                        <br>

                        <button type="submit" class="btn btn-default">Submit</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
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

    $('.restNo_btn').on("click", function (e) {
        e.preventDefault();

        let popUrl = "/review/rest_pop";
        let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl, "음식점 선택", popOption);
    });

</script>
<%@include file="../includes/footer.jsp" %>