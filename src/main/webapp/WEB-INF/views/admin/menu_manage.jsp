<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin/header.jsp" %>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div>
            <h3>메뉴 관리</h3>
            <br>

            <c:if test="${menuListChk != 'empty'}">
                <div class="table-container">
                    <table class="table-border">
                        <tr>
                            <th style="width: 15%;">메뉴 번호</th>
                            <th style="width: 35%;">메뉴명</th>
                            <th style="width: 35%;">음식점명</th>
                            <th style="width: 15%;">가격</th>
                        </tr>
                        <c:forEach items="${menuList}" var="menuList">
                            <tr>
                                <td><c:out value="${menuList.menuNo}"></c:out></td>
                                <td>
                                    <a class="move" href='<c:out value="${menuList.menuNo}"/>'>
                                        <c:out value="${menuList.menuName}"></c:out>
                                    </a>
                                </td>
                                <td><c:out value="${menuList.restName}"></c:out></td>
                                <td><c:out value="${menuList.menuPrice}"></c:out></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>

            <c:if test="${menuListChk == 'empty'}">
                <div class="k-font">
                    등록된 메뉴가 없습니다.
                </div>
            </c:if>
        </div>
        <br>

        <!-- 검색 영역 -->
        <div class="search_wrap">
            <form id="searchForm" action="/admin/menu_manage" method="GET">
                <div class="search_input">
                    <input type="text" name="keyword"
                           value='<c:out value="${pageInfo.cri.keyword}"></c:out>'>
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
                        <a href="/admin/menu_manage${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <li class="paginate_button"><a
                            href="/admin/menu_manage${pageInfo.makeParam(num)}">${num}</a></li>
                </c:forEach>

                <c:if test="${pageInfo.next}">
                    <li class="paginate_button next">
                        <a href="/admin/menu_manage${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
                    </li>
                </c:if>

            </ul>
        </div>
        <!-- end pagination  -->

        <form id="moveForm" action="/admin/menu_manage" method="GET">
            <input type="hidden" name="page" value="${pageInfo.cri.page}">
            <input type="hidden" name="amount" value="${pageInfo.cri.amount}">
            <input type="hidden" name="keyword" value="${pageInfo.cri.keyword}">
        </form>
    </div>
</div>


<%@include file="../includes/admin/footer.jsp" %>

<script>

    $(document).ready(function () {

        let eResult = '<c:out value="${insert_result}"/>';

        checkResult(eResult);

        function checkResult(result) {
            if (result === '') {
                return;
            }
            alert("메뉴'" + eResult + "'를 등록하였습니다.");
        }

        let modify_result = '${modify_result}';

        if (modify_result == 1) {
            alert("수정 완료");
        }

        let delete_result = '${delete_result}';

        if (delete_result == 1) {
            alert("삭제 완료");
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


    //메뉴 조회 페이지 이동
    $('.move').on('click', function (e) {
        e.preventDefault();
        moveForm.append("<input type='hidden' name='menuNo' value='" + $(this).attr("href") + "'>");
        moveForm.attr("action", "/admin/menu_detail");
        moveForm.submit();
    });

</script>
