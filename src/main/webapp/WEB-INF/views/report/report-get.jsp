<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Report Read</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Report Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class="form-group">
                    <label>신고 번호</label> <input class="form-control" name='reportNo' value="${report.reportNo}" readonly>
                </div>

                <div class="form-group">
                    <label>리뷰 번호</label> <input class="form-control" name='revBno' value="${report.revBno}" readonly>
                </div>

                <div class="form-group">
                    <label>신고 내용</label>
                    <textarea class="form-control" rows="3" name='reportContent' readonly>${report.reportContent}</textarea>
                </div>

                <div class="form-group">
                    <label>회원</label> <input class="form-control" name='userId' value="${report.userId}" readonly>
                </div>

                <button id='list-btn' class="btn btn-info">목록</button>


            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->


<!-- 게시글 관련 스크립트 -->
<script>
    $(document).ready(function() {

        document.getElementById('list-btn').addEventListener('click', e => {
            location.href='/report/report-list?page=${pageInfo.page}';
        });

    });
</script>


<%@include file="../includes/footer.jsp"%>