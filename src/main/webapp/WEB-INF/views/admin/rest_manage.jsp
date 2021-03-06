<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin/header.jsp" %>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div>
            <h3>음식점 관리</h3>
            <br>

            <c:if test="${restListChk != 'empty'}">
            <div class="table-container">
                <table class="table-border">
                    <tr>
<%--                        <th class="th_column_1">음식점 번호</th>--%>
                        <th style="width: 20%;">음식점명</th>
                        <th style="width: 10%;">카테고리</th>
                        <th style="width: 15%;">전화번호</th>
                        <th style="width: 10%;">영업시간</th>
<%--                        <th class="th_column_6">음식점 우편주소</th>--%>
                        <th style="width: 45%;">주소</th>
<%--                        <th class="th_column_8">음식점 상세주소</th>--%>
                    </tr>

                    <c:forEach items="${restList}" var="restList">
                        <tr>
<%--                            <td><c:out value="${restList.restNo}"></c:out></td>--%>
                            <td>
                                <a class="move" href='<c:out value="${restList.restNo}"/>'>
                                    <c:out value="${restList.restName}"></c:out>
                                </a>
                            </td>
                            <td><c:out value="${restList.cateName}"></c:out></td>
                            <td><c:out value="${restList.restPh}"></c:out></td>
                            <td><c:out value="${restList.restTime}"></c:out></td>
<%--                            <td><c:out value="${restList.restOaddress} "></c:out></td>--%>
                            <td><c:out value="${restList.restAddress} ${restList.restDetailaddress}"></c:out></td>
<%--                            <td><c:out value="${restList.restDetailaddress}"></c:out></td>--%>
                        </tr>
                    </c:forEach>
                </table>
                </c:if>

                <c:if test="${restListChk == 'empty'}">
                    <div class="table_empty">
                        등록된 음식점이 없습니다.
                    </div>
                </c:if>
            </div>

            <!-- 검색 영역 -->
            <div class="search_wrap">
                <form id="searchForm" action="/admin/rest_manage" method="GET">
                    <div class="search_input">
                        <input type="text" name="keyword" value='<c:out value="${pageInfo.cri.keyword}"></c:out>'>
                        <input type="hidden" name="page" value='<c:out value="${pageInfo.cri.page}"></c:out>'>
                        <input type="hidden" name="amount" value='${pageInfo.cri.keyword}'>
                        <button class="btn search_btn">검 색</button>
                    </div>
                </form>
            </div>
            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test="${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/admin/rest_manage${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/admin/rest_manage${pageInfo.makeParam(num)}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageInfo.next}">
                        <li class="paginate_button next">
                            <a href="/admin/rest_manage${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
                        </li>
                    </c:if>

                </ul>
            </div>
            <!-- end pagination  -->
            <form id="moveForm" action="/admin/rest_manage" method="GET">
                <input type="hidden" name="page" value="${pageInfo.cri.page}">
                <input type="hidden" name="amount" value="${pageInfo.cri.amount}">
                <input type="hidden" name="keyword" value="${pageInfo.cri.keyword}">
            </form>
        </div>
    </div>
</div>

<%@include file="../includes/admin/footer.jsp" %>

<script>
    $(document).ready(function () {
        let result = '<c:out value="${insert_result}"/>';
        let mresult = '<c:out value="${modify_result}"/>';

        checkResult(result);
        checkmResult(mresult);

        function checkResult(result) {

            if (result === '') {
                return;
            }
            alert("음식점'${insert_result}'을 등록하였습니다.");
        }

        function checkResult(result) {

            if (mresult === '1') {
                alert('음식점 정보 수정을 완료하였습니다.');
            } else if (mresult === '0') {
                alert('음식점 정보 수정을 하지 못하였습니다.');
            }
        }

        let delete_result = '${delete_result}';

        if (delete_result == 1) {
            alert('삭제 완료');
        } else if (delete_result == 2) {
            alert('해당 음식점 데이터를 사용하고 있는 데이터가 있어서 삭제할 수 없습니다.');
        }

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

    let moveForm = $('#moveForm');
    let searchForm = $('#searchForm');

    //음식점 검색 버튼
    $('#searchForm button').on('click', function (e) {
        e.preventDefault();

        if (!searchForm.find("input[name='keyword']").val()) {
            alert("키워드를 입력하십시오.");
            return false;
        }

        searchForm.find("input[name='page']").val("1");

        searchForm.submit();
    });

    //음식점 상세 페이지 이동
    $('.move').on('click', function (e) {
        e.preventDefault();
        moveForm.append("<input type='hidden' name='restNo' value='" + $(this).attr("href") + "'>");
        moveForm.attr("action", "/admin/rest_detail");
        moveForm.submit();
    });
</script>

</body>
</html>