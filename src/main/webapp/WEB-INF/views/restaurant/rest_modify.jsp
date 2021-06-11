<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Restaurant Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Restaurant Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/restaurant/rest_modify" method="post">

                    <div class="form-group">
                        <label>음식점 번호</label>
                        <input class="form-control" name='restNo' value='${restaurant.restNo}' readonly>
                    </div>

                    <div class="form-group">
                        <label>음식점 이름</label>
                        <input class="form-control" name='restName' value='${restaurant.restName}'>
                    </div>

                    <div class="form-group">
                        <label>카테고리</label>
                        <textarea class="form-control" rows="5" name='cateNo'>${restaurant.cateNo}</textarea>
                    </div>

                    <div class="form-group">
                        <label>전화번호</label>
                        <input class="form-control" name='restPh' value='${restaurant.restPh}' readonly>
                    </div>

                    <div class="form-group">
                        <label>별점</label>
                        <input class="form-control" name='restStar' value='${restaurant.restStar}' readonly>
                    </div>

                    <div class="form-group">
                        <label>영업시간</label>
                        <input class="form-control" name='restTime'
                               value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${restaurant.restTime}" />' readonly>
                    </div>

                    <!-- form에서 다른 URL로 파라미터를 넘기려면 name속성을 활용해야 함 -->
                    <input type="hidden" name="page" value="${pageInfo.page}">
                    <input type="hidden" name="type" value="${pageInfo.type}">
                    <input type="hidden" name="keyword" value="${pageInfo.keyword}">

                    <div class="btn-group">
                        <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
                        <button type="button" data-oper='remove' class="btn btn-danger">Remove</button>
                        <button type="button" data-oper='list' class="btn btn-info">List</button>
                    </div>
                </form>


            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->

<script>
    document.querySelector('.btn-group').addEventListener('click', e => {
        e.preventDefault(); // submit 기능 중지 (서버로 전송 기능)

        const oper = e.target.dataset.oper;

        const $actionForm = document.querySelector('form[role=form]');

        if (oper === 'list') {
            // form의 action을 /restaurant/list로 변경, method를 get으로 변경
            $actionForm.setAttribute('action', '/restaurant/rest_list');
            $actionForm.setAttribute('method', 'get');
        } else if (oper === 'remove') {
            // form의 action을 /restaurant/remove로 변경
            $actionForm.setAttribute('action', '/restaurant/rest_remove');
        }
        // form을 submit
        $actionForm.submit();

    })
</script>

<%@include file="../includes/footer.jsp"%>