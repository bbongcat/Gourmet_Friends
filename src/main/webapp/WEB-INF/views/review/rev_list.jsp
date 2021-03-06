<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="../includes/header.jsp" %>

<%--<style>
    .star-rating {
      color: #FFFF00;
    }
</style>--%>

<%--<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Review board</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->--%>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-6.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">Review</h1>
    </div>
</div>

<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div class="title-container">
            <h1 class="k-font-title">Review</h1>
            <c:if test="${loginUser != null}">
                <button id='regBtn' type="button" class="btn-box">리뷰 등록</button>
            </c:if>
        </div>

        <!-- /.panel-heading -->
        <div class="table-container">
            <table class="table-border">

                <tr>
                    <th class="rev-table-num">리뷰 번호</th>
                    <%--                    <th>음식점 번호</th>--%>
                    <th class="rev-table-restName">음식점 이름</th>
                    <th class="rev-table-revContent">리뷰 내용</th>
                    <%--                    <th>댓글 수</th>--%>
                    <th class="rev-table-star">리뷰 평점</th>
                    <%--                    <th>회원</th>--%>
                </tr>
                <%-- 음식점 번호, 회원 등은 글 상세 페이지에서 나오게 하는게 어떨지,
                 댓글 수는 삭제 고려--%>


                <c:forEach var="review" items="${rev_list}">
                    <tr>
<%--                        <td>${review.revBno}</td>--%>

                        <td>
                            <a class='move'
                               href="/review/rev_get${pageInfo.makeParam(pageInfo.cri.page)}&revBno=${review.revBno}">
                                                                        ${review.restNo}
                            </a>
                        </td>

                        <td>${review.restName}</td>
                        <td>${review.revContent}</td>
                            <%--                        <td>${review.revReplyCnt}</td>--%>
                        <td>
                            <div class="star-rating">
                                <c:forEach var="review" begin="1" end="${review.revStar}">★</c:forEach>
                            </div>
                        </td>
                            <%--                        <td>${review.userId}</td>--%>
                    </tr>
                </c:forEach>
            </table>

            <!-- search -->
            <div class='search-container'>

                <form id='searchForm' action="/review/rev_list" method='get'>
                    <select name='type'>
                        <%--                        <option value="">--</option>--%>
                        <option value="restName" ${pageInfo.cri.type == 'restName' ? 'selected' : ''}>음식점 이름
                        </option>
                        <option value="revContent" ${pageInfo.cri.type == 'revContent' ? 'selected' : ''}>리뷰
                            내용
                        </option>
                        <option value="userId" ${pageInfo.cri.type == 'userId' ? 'selected' : ''}>회원ID</option>
                    </select>
                    <input type='text' name='keyword' value="${pageInfo.cri.keyword}"/>

                    <button class='btn btn-default'>Search</button>
                </form>
            </div>
            <!-- end search -->

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test="${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/review/rev_list${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/review/rev_list${pageInfo.makeParam(num)}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageInfo.next}">
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
    <!-- end panel -->
</div>
<!-- /.row -->


<script>
    $(document).ready(function () {

        //게시글 등록 버튼 이벤트
        document.getElementById('regBtn').addEventListener('click', e => {
            //링크 이동
            location.href = '/review/rev_register';
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
            } else if (msg === 'modSuccess') {
                $modalBody.textContent = '리뷰가 수정되었습니다.';
            } else if (msg === 'delSuccess') {
                $modalBody.textContent = '리뷰가 삭제되었습니다.';
            } else if (msg === 'reportSuccess') {
                $modalBody.textContent = '리뷰가 신고되었습니다.';
            }
            //모달창 오픈
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

            //현재 위치 한 페이지에 클래스 acitve 부여하는 함수
            appendPageActive("${pageInfo.cri.page}");

        }());
    });


</script>


<%@include file="../includes/footer.jsp" %>