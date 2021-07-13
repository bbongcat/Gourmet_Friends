<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">

                    <div class="get-title">
                        <span>${review.restName}</span>
                        <span class="lnr lnr-user">${report.userId}</span>
                    </div>

                    <div class="get-content">
                        <span>신고 내용</span>
                        <div>${report.reportContent}</div>
                    </div>

                    <div class="form-group">
                        <label>신고 번호</label> <input class="form-control" name='reportNo' value="${report.reportNo}"
                                                    readonly>
                    </div>

                    <div class="form-group">
                        <label>리뷰 번호</label> <input class="form-control" name='revBno' value="${report.revBno}"
                                                    readonly>
                    </div>

                    <button id='list-btn' class="btn btn-blue">목록</button>


                </article>
            </div>
        </div>
    </div>
</section>


<!-- 게시글 관련 스크립트 -->
<script>
    $(document).ready(function () {

        document.getElementById('list-btn').addEventListener('click', e => {
            location.href = '/report/report-list?page=${pageInfo.page}';
        });

    });
</script>


<%@include file="../includes/footer.jsp" %>