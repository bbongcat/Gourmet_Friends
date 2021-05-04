<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Review Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Review Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/review/rev_modify" method="post">

                    <div class="form-group">
                        <label>리뷰 번호</label>
                        <input class="form-control" name='revBno' value='${review.revBno}' readonly>
                    </div>

                    <div class="form-group">
                        <label>음식점 이름</label>
                        <input class="form-control" name='restNo' value='${restaurant.restName}' readonly>
                    </div>

                    <div class="form-group">
                        <label>리뷰 내용</label>
                        <textarea class="form-control" rows="5" name='revContent'>${review.revContent}</textarea>
                    </div>

                    <!-- 리뷰 평점 api생성하기 -->
                    <div class="form-group">
                        <label>리뷰 평점</label> 
                        <input class="form-control" name='restStar' value="${review.restStar}">
                    </div>

                    <div class="form-group">
                        <label>회원</label>
                        <input class="form-control" name='userId' value='${review.userId}' readonly>
                    </div>

                    <input type="hidden" name="page" value="${pageInfo.page}">
                    <input type="hidden" name="type" value="${pageInfo.type}">
                    <input type="hidden" name="keyword" value="${pageInfo.keyword}">

                    <div class="btn-group">
                        <button type="submit" data-oper='rev_modify' class="btn btn-default">수정</button>
                        <button type="button" data-oper='rev_remove' class="btn btn-danger">삭제</button>
                        <button type="button" data-oper='rev_list' class="btn btn-info">목록</button>
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

    document.querySelector('.btn-group').addEventListener('click',function(e){
        e.preventDefault(); //submit기능 중지(서버로 전송 가능)

        const oper = e.target.dataset.oper;

        const $actionForm = document.querySelector('form[role=form]')

        if(oper === 'rev_list'){
            $actionForm.setAttribute('action','/review/rev_list');
            $actionForm.setAttribute('method','get');
        }else if(oper === 'rev_remove'){
            $actionForm.setAttribute('action','/review/rev_remove');
        }

        //form을 submit
        $actionForm.submit();
    });

</script>


<%@include file="../includes/footer.jsp"%>