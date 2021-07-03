<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">foodFriends Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">foodFriends Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

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
                            value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${foodFriends.regDate}" />' readonly>
                    </div>

                    <div class="form-group">
                        <label>수정시간</label>
                        <input class="form-control" name='updateDate'
                            value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${foodFriends.updateDate}" />' readonly>
                    </div>

                    <input type="hidden" name="page" value="${pageInfo.page}">
                    <input type="hidden" name="type" value="${pageInfo.type}">
                    <input type="hidden" name="keyword" value="${pageInfo.keyword}">

                    <div class="btn-group">
                        <button type="submit" data-oper='ff_modify' class="btn btn-default">수정</button>
                        <button type="button" data-oper='ff_remove' class="btn btn-danger">삭제</button>
                        <button type="button" data-oper='ff_list' class="btn btn-info">목록</button>
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
        e.preventDefault(); 

        const oper = e.target.dataset.oper;

        const $actionForm = document.querySelector('form[role=form]')

        if(oper === 'ff_list'){
        
            $actionForm.setAttribute('action','/food_friends/ff_list');
            $actionForm.setAttribute('method','get');
        }else if(oper === 'ff_remove'){
            
            $actionForm.setAttribute('action','/food_friends/ff_remove');
        }

        $actionForm.submit();
    });

</script>


<%@include file="../includes/footer.jsp"%>