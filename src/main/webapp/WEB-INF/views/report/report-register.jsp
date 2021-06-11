<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Report Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Report Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/report/report-register" method="post">

          <div class="form-group">
            <label>신고내용</label>
            <br>
            <input type="text" list="report-content" name='reportContent'>
            <datalist id="report-content">
              <option>부정한 의미를 갖는 글이기 때문에</option>
              <option>욕설을 포함하고 있기 때문에</option>
              <option>게시판의 취지와 맞지 않는 글이기 때문에</option>
              <option>기타</option>
           </datalist>
          </div>

          <div class="form-group">
            <label>회원</label> <input class="form-control" name='userId' readonly value="${report.userId}">
          </div>

          <button type="submit" class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>