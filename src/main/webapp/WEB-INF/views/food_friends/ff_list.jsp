<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">밥친구 게시판</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            FoodFriends List Page
            <button id='regBtn' type="button" class="btn btn-primary btn-xs pull-right">게시글 등록</button>
         </div>

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">

                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>회원</th>
                        <th>작성일</th>
                        <th>수정일</th>
                    </tr>

                <c:forEach var="foodFriends" items="${noticeList}">
                    <tr>
                        <td>${foodFriends.ffBno}</td>

                        <td>
                            <a class='move' href="/food_friends/ff_get${pageInfo.makeParam(pageInfo.cri.page)}&ffBno=${foodFriends.ffBno}">
                                ${foodFriends.title} [${foodFriends.ffReplyCnt}]
                            </a>
                        </td>

                        <td>${foodFriends.userId}</td>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.regDate}" /></td>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.updateDate}" /></td>
                    </tr>
                </c:forEach>

                <c:forEach var="foodFriends" items="${commonList}">
                  <tr>
                     <td>${foodFriends.ffBno}</td>

                     <td>
                        <a class='move' href="/food_friends/ff_get${pageInfo.makeParam(pageInfo.cri.page)}&ffBno=${foodFriends.ffBno}">
                            ${foodFriends.title} [${foodFriends.ffReplyCnt}]
                        </a>
                     </td>

                     <td>${foodFriends.userId}</td>
                     <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.regDate}" /></td>
                     <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.updateDate}" /></td>
                  </tr>
                </c:forEach>
            </table>

            <!-- search -->
            <div class='row'>
                <div class="col-lg-12">
 
                   <form id='searchForm' action="/food_friends/ff_list" method='get'>
                    <select name='type'>
                        <option value="">--</option>
                        <option value="title" ${pageInfo.cri.type == 'title' ? 'selected' : ''}>제목</option>
                        <option value="content" ${pageInfo.cri.type == 'content' ? 'selected' : ''}>내용</option>
                        <option value="userId" ${pageInfo.cri.type == 'userId' ? 'selected' : ''}>회원ID</option>
                        <option value="titleContent" ${pageInfo.cri.type == 'titleContent' ? 'selected' : ''}>제목 or 내용</option>   
                     </select>  
                      <input type='text' name='keyword' value="${pageInfo.cri.keyword}" /> 
                         
                      <button class='btn btn-default'>검색</button>
                   </form>
                </div>
             </div>
             <!-- end search -->

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test = "${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/food_friends/ff_list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>
                        
                    <c:forEach var= "num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/food_friends/ff_list${pageInfo.makeParam(num)}">${num}</a></li>
                    </c:forEach>

                    <c:if test = "${pageInfo.next}">
                        <li class="paginate_button next">
                            <a href="/food_friends/ff_list${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
                        </li>
                    </c:if>

                </ul>
            </div>
            <!-- end pagination  -->


            <!-- Modal  추가 -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다.</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

      </div>
      <!--  end panel-body -->
   </div>
   <!-- end panel -->
</div>
</div>
<!-- /.row -->
<script>
$(document).ready(function() {

    
    document.getElementById('regBtn').addEventListener('click', e => {
        
        location.href='/food_friends/ff_register';
    });

    const resultMessage = '${msg}';
   
    function checkModal(msg) {

        const $modalBody = document.querySelector('.modal-body');

        if (msg === '') {
            return;
        }

        if (msg === 'regSuccess') {
            $modalBody.textContent = '게시글이 등록되었습니다.';
        }else if(msg === 'modSuccess'){
            $modalBody.textContent = '게시글이 수정되었습니다.';
        }else if(msg === 'delSuccess'){
            $modalBody.textContent = '게시글이 삭제되었습니다.';
        }

        $('#myModal').modal('show');
    }

    function appendPageActive(currentPage){

        const $pageLiList = document.querySelectorAll('.paginate_button');
        for($li of $pageLiList){
            if($li.textContent === currentPage){
                $li.classList.add('active');
            }
        }

       

    }

    (function () {
        
        checkModal(resultMessage);

        appendPageActive("${pageInfo.cri.page}");

    }());
});


</script>





<%@include file="../includes/footer.jsp"%>