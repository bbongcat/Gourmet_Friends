<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<style>
    .star-rating {
      color: #FFFF00;
    }
</style>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">리뷰 게시판</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            Review List Page
            <button id='regBtn' type="button" class="btn btn-primary btn-xs pull-right">리뷰 등록</button>
         </div>

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">

                    <tr>
                        <th>리뷰 번호</th>
                        <th>음식점 번호</th>
                        <th>리뷰 내용</th>
                        <th>댓글 수</th>
                        <th>리뷰 평점</th>
                        <th>회원</th>
                    </tr>


               <c:forEach var="review" items="${rev_list}">
                  <tr>
                     <td>${review.revBno}</td>

                     <td>
                        <a class='move' href="/review/rev_get${pageInfo.makeParam(pageInfo.cri.page)}&revBno=${review.revBno}">
                            ${review.restNo}
                        </a>
                     </td>

                     <td>${review.revContent}</td>
                     <td>${review.revReplyCnt}</td>
                     <td>
                      <div class="star-rating">
                        <c:forEach var="review" begin="1" end="${review.revStar}">★</c:forEach>
                      </div></td>
                     <td>${review.userId}</td>
                  </tr>
               </c:forEach>
            </table>

            <!-- search -->
            <div class='row'>
                <div class="col-lg-12">
 
                   <form id='searchForm' action="/review/rev_list" method='get'>
                    <select name='type'>
                        <option value="">--</option>
                        <option value="restNo" ${pageInfo.cri.type == 'restNo' ? 'selected' : ''}>음식점 번호</option>
                        <option value="revContent" ${pageInfo.cri.type == 'revContent' ? 'selected' : ''}>리뷰 내용</option>
                        <option value="userId" ${pageInfo.cri.type == 'userId' ? 'selected' : ''}>회원ID</option>
                     </select>  
                      <input type='text' name='keyword' value="${pageInfo.cri.keyword}" /> 
                         
                      <button class='btn btn-default'>Search</button>
                   </form>
                </div>
             </div>
             <!-- end search -->

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test = "${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/review/rev_list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>
                        
                    <c:forEach var= "num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/review/rev_list${pageInfo.makeParam(num)}">${num}</a></li>
                    </c:forEach>

                    <c:if test = "${pageInfo.next}">
                        <li class="paginate_button next">
                            <a href="/review/rev_list${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
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

    //게시글 등록 버튼 이벤트
    document.getElementById('regBtn').addEventListener('click', e => {
        //링크 이동
        location.href='/review/rev_register';
    });


    const resultMessage = '${msg}';
    // console.log(resultMessage);

    //게시물 처리에 따른 모달을 띄워주는 함수
    function checkModal(msg) {

        const $modalBody = document.querySelector('.modal-body');

        if (msg === '') {
            return;
        }

        if (msg === 'regSuccess') {
            $modalBody.textContent = '리뷰가 등록되었습니다.';
        }else if(msg === 'modSuccess'){
            $modalBody.textContent = '리뷰가 수정되었습니다.';
        }else if(msg === 'delSuccess'){
            $modalBody.textContent = '리뷰가 삭제되었습니다.';
        }
        //모달창 오픈
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

        //현재 위치 한 페이지에 클래스 acitve 부여하는 함수
        appendPageActive("${pageInfo.cri.page}");

    }());
});


</script>


<%@include file="../includes/footer.jsp"%>