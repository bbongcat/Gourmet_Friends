<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


<style>
    .star-rating {
      color: #FFFF00;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Tables</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Restaurant List Page
                <button id='regBtn' type="button" class="btn btn-primary btn-xs pull-right">게시글 등록</button>
            </div>

            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">

                    <tr>
                        <th>음식점 번호</th>
                        <th>음식점 이름</th>
                        <th>카테고리</th>
                        <th>전화번호</th>
                        <th>별점</th>
                        <th>영업시간</th>
                        <th>사진</th>
                        <th>리뷰수</th>
                    </tr>


                    <c:forEach var="restaurant" items="${rest_list}">
                        <tr>
                            <td>${restaurant.restName}</td>

                            <td>
                                <a class='move'
                                   href="/restaurant/rest_get${pageInfo.makeParam(pageInfo.cri.page)}&restNo=${restaurant.restNo}">
                                        ${restaurant.restNo}
                                </a>
                            </td>

                            <td>${restaurant.cateNo}</td>
                            <td>${restaurant.restPh}</td>
                            <td>
                            <div class="star-rating">
                                <c:forEach var="review" begin="1" end="${review.revStar}">★</c:forEach>
                            </div>
                            </td>
                            <td>
                                <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${restaurant.restTime}"/>
                            </td>
                            <td></td>
                            <td>${restaurant.revCnt}</td>
                        </tr>
                    </c:forEach>
                </table>

                <!-- Modal  추가 -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다.</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
    $(document).ready(function () {
        //게시글 등록 버튼 이벤트
        document.getElementById('regBtn').addEventListener('click', e => {
            //링크 이동
            location.href = '/restaurant/rest_register';
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
                $modalBody.textContent = '음식점이 등록되었습니다.';
            } else if (msg === 'modSuccess') {
                $modalBody.textContent = '음식점이 수정되었습니다.';
            } else if (msg === 'delSuccess') {
                $modalBody.textContent = '음식점이 삭제되었습니다.';
            }
            //모달창 오픈
            $('#myModal').modal('show');
        }

        (function () {
            checkModal(resultMessage);
        }());
    });
</script>

<%@include file="../includes/footer.jsp" %>