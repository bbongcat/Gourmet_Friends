<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="../includes/header.jsp" %>


<div class="jumbotron d-flex align-items-center">
    <div class="container">

        <div class="title-container">
            <h1 class="k-font-title">Report</h1>
        </div>

        <!-- /.panel-heading -->
        <div class="table-container">
            <table class="table table-bordered">

                <tr>
                    <th>번호</th>
                    <th>리뷰 번호</th>
                    <th>신고내용</th>
                    <th>회원</th>
                    <th>신고시간</th>
                </tr>


                <c:forEach var="report" items="${report_list}">
                    <tr>
                        <td>${report.reportNo}</td>

                        <td>
                            <a class='move'
                               href="/report/report-get${pageInfo.makeParam(pageInfo.cri.page)}&reportNo=${report.reportNo}">
                                    ${report.revBno}
                            </a>
                        </td>

                        <td>${report.reportContent}</td>

                        <td>${report.userId}</td>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${report.reportDate}"/></td>
                    </tr>
                </c:forEach>
            </table>

            <!-- search -->
            <div class='row'>
                <div class="col-lg-12">

                    <form id='searchForm' action="/report/report-list" method='get'>
                        <select name='type'>
                            <option value="">--</option>
                            <option value="reportNo" ${pageInfo.cri.type == 'reportNo' ? 'selected' : ''}>신고 번호
                            </option>
                            <option value="reportContent" ${pageInfo.cri.type == 'reportContent' ? 'selected' : ''}>
                                신고 내용
                            </option>
                            <option value="userId" ${pageInfo.cri.type == 'userId' ? 'selected' : ''}>회원ID</option>
                        </select>
                        <input type='text' name='keyword' value="${pageInfo.cri.keyword}"/>

                        <button class='btn btn-default'>Search</button>
                    </form>
                </div>
            </div>
            <!-- end search -->

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test="${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/report/report-list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a
                                href="/report/report-list${pageInfo.makeParam(num)}">${num}</a></li>
                    </c:forEach>

                    <c:if test="${pageInfo.next}">
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
<!-- /.row -->

<script>

    $(document).ready(function () {
        function appendPageActive(currentPage) {

            const $pageLiList = document.querySelectorAll('.paginate_button');
            for ($li of $pageLiList) {
                if ($li.textContent === currentPage) {
                    $li.classList.add('active');
                }
            }

        }

        (function () {

            appendPageActive("${pageInfo.cri.page}");

        }());
    });
</script>


<%@include file="../includes/footer.jsp" %>