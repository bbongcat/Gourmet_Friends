<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>


<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div class="section-content">
            <!-- Section Title -->
            <div class="title-wrap">
                <h2 class="section-title eng-font-title">Report</h2>
                <p class="section-sub-title">신고게시판입니다.</p>
            </div>

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form role="form" action="/report/report-register" method="post">

                        <div class="form-group">
                            <label>리뷰 번호</label> <input class="form-control" name='revBno'>
                        </div>

                        <div class="form-group">
                            <label>신고내용</label>
                            <textarea class="form-control" name="reportContent" id="reportContent_textarea"
                                      rows="10"></textarea>
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
</div>

<script>

    //위지윅 적용
    ClassicEditor
        .create(document.querySelector('#reportContent_textarea'), config)
        .catch(error => {
            console.error(error);
        });

</script>
<%@include file="../includes/footer.jsp" %>