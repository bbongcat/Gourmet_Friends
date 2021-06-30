<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">Report Board</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">

                    <tr>
                        <th>번호</th>
                        <th>리뷰 번호</th>
                        <th>신고내용</th>
                        <th>회원</th>
                        <th>신고시간</th>
                    </tr>


               <c:forEach var="report" items="${report-list}">
                  <tr>
                     <td>${report.reportNo}</td>

                     <td>${report.revBno}</td>

                     <td>
                        <a class='move' href="/report/report-get${pageInfo.makeParam(pageInfo.cri.page)}&reportNo=${report.reportNo}">
                            ${report.reportContent}
                        </a>
                    </td>

                     <td>${report.userId}</td>
                     <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${report.reportDate}" /></td>
                  </tr>
               </c:forEach>
            </table>

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test = "${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/report/report-list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>
                        
                    <c:forEach var= "num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/report/report-list${pageInfo.makeParam(num)}">${num}</a></li>
                    </c:forEach>

                    <c:if test = "${pageInfo.next}">
                        <li class="paginate_button next">
                            <a href="/report/report-list${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
                        </li>
                    </c:if>

                </ul>
            </div>
            <!-- end pagination  -->
      </div>
      <!--  end panel-body -->
   </div>
   <!-- end panel -->
</div>
</div>
<!-- /.row -->

<script>

   $(document).ready(function(){
      function appendPageActive(currentPage){

      const $pageLiList = document.querySelectorAll('.paginate_button');
            for($li of $pageLiList){
               if($li.textContent === currentPage){
                  $li.classList.add('active');
               }
            }

      }

      (function () {

         appendPageActive("${pageInfo.cri.page}");

      }());
   });
</script>


<%@include file="../includes/footer.jsp"%>