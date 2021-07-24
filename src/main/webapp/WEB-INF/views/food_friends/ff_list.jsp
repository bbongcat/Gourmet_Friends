<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="../includes/header.jsp" %>

<style>
    tr.noticeList td > a {
        color: #4a69bd;
        font-weight: bold;
    }

    /*tr.commonList td > a {
        color: blue;
    }*/
</style>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-2.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">
            Food Friends</h1>
    </div>
</div>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <%--        <div class="title-container board-title">--%>
        <div class="title-container">
            <h1 class="k-font-title">밥친구 게시판</h1>
            <a href="/food_friends/ff_register/">
                <c:if test="${loginUser != null}">
                    <button id='regBtn' type="button" class="btn-box">게시글 등록</button>
                </c:if>
            </a>
        </div>

        <!-- /.panel-heading -->
        <div class="table-container">
            <table class="table-border">

                <tr>
                    <th class="fflist-table-num">번호</th>
                    <th class="fflist-table-title">제목</th>
                    <th class="fflist-table-user">회원</th>
                    <th class="fflist-table-time">작성일</th>
                    <%--                    <th>수정일</th>--%>
                    <%--수정일 빼는거 어떤지 (글에 들어갔을 때만 나오게 한다던지)--%>
                </tr>

                <c:forEach var="foodFriends" items="${noticeList}">
                    <tr class="noticeList" value="SPECIFIC">
                        <td><span class="lnr lnr-bullhorn"></span>
                                ${foodFriends.ffBno}</td>

                        <td>
                            <a class='move'
                               href="/food_friends/ff_get${pageInfo.makeParam(pageInfo.cri.page)}&ffBno=${foodFriends.ffBno}">
                                    ${foodFriends.title}&nbsp;
                                <c:if test="${foodFriends.ffReplyCnt != null}">
                                    [${foodFriends.ffReplyCnt}]
                                </c:if>
                            </a>
                        </td>

                        <td>${foodFriends.userId}</td>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.regDate}"/></td>
                            <%--                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.updateDate}"/></td>--%>
                    </tr>
                </c:forEach>

                <c:forEach var="foodFriends" items="${commonList}">
                    <tr class="commonList" value="GENERAL">
                        <td>${foodFriends.ffBno}</td>

                        <td>
                            <a class='move'
                               href="/food_friends/ff_get${pageInfo.makeParam(pageInfo.cri.page)}&ffBno=${foodFriends.ffBno}">
                                    ${foodFriends.title}&nbsp;
                                <c:if test="${foodFriends.ffReplyCnt != null}">
                                    [${foodFriends.ffReplyCnt}]
                                </c:if>
                            </a>
                        </td>

                        <td>${foodFriends.userId}</td>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.regDate}"/></td>
                            <%--                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${foodFriends.updateDate}"/></td>--%>
                    </tr>
                </c:forEach>
            </table>

            <!-- search -->
            <div class='search-container'>

                <form id='searchForm' action="/food_friends/ff_list" method='get'>
                    <select name='type'>
                        <option value="title" ${pageInfo.cri.type == 'title' ? 'selected' : ''}>제목</option>
                        <option value="content" ${pageInfo.cri.type == 'content' ? 'selected' : ''}>내용</option>
                        <option value="userId" ${pageInfo.cri.type == 'userId' ? 'selected' : ''}>회원ID</option>
                        <option value="titleContent" ${pageInfo.cri.type == 'titleContent' ? 'selected' : ''}>제목 or
                            내용
                        </option>
                    </select>
                    <input type='text' name='keyword' value="${pageInfo.cri.keyword}" placeholder="검색어를 입력하세요"/>

                    <button class='btn btn-blue'>검색</button>
                </form>
            </div>
            <!-- end search -->

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test="${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/food_friends/ff_list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/food_friends/ff_list${pageInfo.makeParam(num)}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageInfo.next}">
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
                                    data-dismiss="modal">Close
                            </button>
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
    <!-- /.col-lg-12 -->
</div>


<script>
    $(document).ready(function () {


        document.getElementById('regBtn').addEventListener('click', e => {

            location.href = '/food_friends/ff_register';
        });

        const resultMessage = '${msg}';

        function checkModal(msg) {

            const $modalBody = document.querySelector('.modal-body');

            if (msg === '') {
                return;
            }

            if (msg === 'regSuccess') {
                $modalBody.textContent = '게시글이 등록되었습니다.';
            } else if (msg === 'modSuccess') {
                $modalBody.textContent = '게시글이 수정되었습니다.';
            } else if (msg === 'delSuccess') {
                $modalBody.textContent = '게시글이 삭제되었습니다.';
            }

            $('#myModal').modal('show');
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

            checkModal(resultMessage);

            appendPageActive("${pageInfo.cri.page}");

        }());
    });


</script>


<%@include file="../includes/footer.jsp" %>