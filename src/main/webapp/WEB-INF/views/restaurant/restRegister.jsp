<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Restaurant Register</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Restaurant Register</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/restaurant/register" method="post">
                    <div class="form-group">
                        <label>음식점 이름</label> <input class="form-control" name='name'>
                    </div>

                    <div class="form-group">
                        <label>카테고리</label> <input class="form-control" name="category">
                    </div>

                    <div class="form-group">
                        <label>음식점 번호</label> <input class="form-control" name='phone_number'>
                    </div>

                    <div class="form-group">
                        <label>음식점 시간</label> <input class="form-control" name='time'>
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
<%@include file="../includes/footer.jsp" %>