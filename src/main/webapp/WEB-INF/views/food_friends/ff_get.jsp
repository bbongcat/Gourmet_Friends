<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-2.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">
            Food Friends</h1>
    </div>
</div>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">

                    <div class="get-title">
                        <%--                        <span>글번호 : ${foodFriends.ffBno}</span>--%>
                        <span>${foodFriends.title}</span>
                        <span class="lnr lnr-user"> ${foodFriends.userId}</span>
                    </div>


                    <div class="get-content">
                        <div>${foodFriends.content}</div>
                    </div>

                    <br>

                    <c:if test="${loginUser.userId == foodFriends.userId}">
                        <button id='modify-btn' class="btn btn-blue">수정</button>
                    </c:if>
                    <button id='list-btn' class="btn btn-blue">목록</button>
                    <c:if test="${loginUser != null}">
                        <button id='addReplyBtn' class='btn btn-blue'>댓글 등록</button>
                    </c:if>
                    <br>
                    <br>


                    <!-- 댓글 영역 -->
                    <div class='row'>
                        <div class="col-lg-12">

                            <div class="get-reply">
                                <span class="lnr lnr-bubble">&nbsp;<span class="ffReplyCnt"></span></span>
                            </div>


                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <ul class="chat reply-content">
                                    <!-- 실제 댓글이 들어갈 부분 -->
                                </ul>
                                <!-- ./ end ul -->
                            </div>
                            <!-- /.panel .chat-panel -->

                            <!-- 댓글 페이지 목록  -->
                            <div class="panel-footer"></div>

                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>


<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">밥친구 댓글 등록</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>댓글내용</label>
                    <input class="form-control" name='ffContent'>
                </div>
                <div class="form-group">
                    <label>ID</label>
                    <input class="form-control" name='userId' value='userId'>
                </div>
                <div class="form-group">
                    <label>댓글 등록 시간</label>
                    <input class="form-control" name='ffDate' value='2018-01-01 13:13'>
                </div>

            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-blue">수정</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-blue">삭제</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-blue">등록</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- //댓글 영역 끝 -->


<!-- 댓글 관련 스크립트 -->
<script>

    let ffBno = '${foodFriends.ffBno}';


    let curPageNum = 1;


    function formatDate(datetime) {

        const dateObj = new Date(datetime);

        let year = dateObj.getFullYear();
        let month = dateObj.getMonth() + 1;
        let day = dateObj.getDate();
        let hour = dateObj.getHours();
        let minute = dateObj.getMinutes();


        let ampm = '';
        if (hour < 12 && hour >= 6) {
            ampm = '오전';
        } else if (hour >= 12 && hour < 21) {
            ampm = '오후';
            if (hour !== 12) {
                hour -= 12;
            }
        } else if (hour >= 21 && hour <= 24) {
            ampm = '밤';
            hour -= 12;
        } else {
            ampm = '새벽';
        }

        (month < 10) ? month = '0' + month : month;
        (day < 10) ? day = '0' + day : day;
        (hour < 10) ? hour = '0' + hour : hour;
        (minute < 10) ? minute = '0' + minute : minute;

        return year + "-" + month + "-" + day + " " + ampm + " " + hour + ":" + minute;
    }


    function showReplyPage(count) {

        let pageNum = curPageNum;
        const $pageFooter = document.querySelector('.panel-footer');


        const DISPLAY_PAGE = 10;

        let endPage = Math.ceil(pageNum / DISPLAY_PAGE) * DISPLAY_PAGE;
        const beginPage = endPage - DISPLAY_PAGE + 1;


        if (endPage * DISPLAY_PAGE >= count) {
            endPage = Math.ceil(count / DISPLAY_PAGE);
        }

        const prev = beginPage !== 1;
        const next = endPage * DISPLAY_PAGE < count;

        let data = '';
        data += '<ul class="pagination pull-right">';

        if (prev) {
            data += '  <li class="page-item"><a class="page-link" href="' + (beginPage - 1) + '">이전</a></li>';
        }

        for (let i = beginPage; i <= endPage; i++) {
            let active = pageNum == i ? "active" : '';

            data += '<li class="page-item ' + active + '"><a class="page-link" href="' + i + '">' + i + "</a></li>";
        }

        if (next) {
            data += '  <li class="page-item"><a class="page-link" href="' + (endPage + 1) + '">다음</a></li>';
        }
        data += '</ul>';

        $pageFooter.innerHTML = data;


        document.querySelector('ul.pagination').addEventListener('click', e => {
            if (!e.target.matches('ul.pagination > li > a')) {
                return;
            }
            e.preventDefault();

            curPageNum = e.target.getAttribute('href');

            showReplyList(curPageNum);
        });
    }


    function makeReplyListDOM({replies, count}) {
        if (replies === null || replies.length === 0) {
            return;
        }
        let data = '';

        for (let ffReply of replies) {
            data += '<li class="left clearfix" data-rno = "' + ffReply.ffRno + '">';
            data += '   <div>';
            data += '     <div class="header">';
            data += '         <strong class="primary-font">' + ffReply.userId + '</strong>';
            data += '     <small class="pull-right text-muted">' + formatDate(ffReply.ffDate) + '</small>';
            data += '    </div>';
            data += '    <p>' + ffReply.ffContent + '</p>';
            data += '   </div>';
            data += '</li>';
        }
        document.querySelector('.chat').innerHTML = data;

        showReplyPage(count);
    }


    function showReplyList(page) {
        fetch('/api/v1/replies/' + ffBno + '/' + page)
            .then(res => res.json())
            .then(replyMap => {

                makeReplyListDOM(replyMap);
                document.querySelector('.ffReplyCnt').textContent = replyMap.count;
            });
    }

    //JQuery영역
    $(document).ready(function () {

        const $modal = $('#replyModal');

        //게시글 등록을 눌렀을 때 모달팝업을 띄우는 이벤트
        document.getElementById('addReplyBtn').addEventListener('click', () => {

            //$modal - 모달 전체 노드
            //find() - 요소에서 자식노드를 모두 탐색하여 선택자에 맞는 요소르 가져옴
            $modal.find('input').val('');

            $modal.find('input[name=ffDate]').parent().hide();

            $modal.find('button[id != modalRegisterBtn]').hide();

            $modal.find('#modalCloseBtn').show();

            $modal.modal('show');

        });

        //모달 close이벤트
        $('#modalCloseBtn').on('click', e => {
            $modal.modal('hide');
        });

        //게시물 등록 서버요청 비동기 처리 이벤트
        $('#modalRegisterBtn').on('click', e => {

            //서버로 전송할 데이터 - 디버깅
            const replyObj = {
                ffBno: ffBno,
                ffContent: $('input[name=ffContent]').val(),
                userId: $('input[name=userId]').val(),
            };

            console.log(replyObj);

            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(replyObj)
            };
            fetch('/api/v1/replies/', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'regSuccess') {
                        $modal.modal('hide');
                        $modal.find('input').val('');
                        showReplyList(curPageNum);
                    } else {
                        alert('댓글 등록을 실패하였습니다.');
                    }
                });

        });


        $('ul.chat').on('click', 'li', e => {

            $modal.find('button[id=modalRegisterBtn]').hide();
            $modal.find('button[id != modalRegisterBtn]').show();
            $modal.find('input[name=ffDate]').parent().show();


            const ffRno = e.currentTarget.dataset.rno;

            fetch('/api/v1/replies/' + ffRno)
                .then(res => res.json())
                .then(ffReply => {
                    // console.log(reply);
                    $('input[name=ffContent]').val(ffReply.ffContent);
                    $('input[name=userId]').val(ffReply.userId);
                    $('input[name=ffDate]').val(formatDate(ffReply.ffDate));
                    $('input[name=ffDate]').attr('redaonly', 'readonly');

                    $modal.data('ffRno', ffRno);
                });

            $modal.modal('show');
        });

        //댓글 수정 버튼 클릭 이벤트
        $('#modalModBtn').on('click', e => {
            const modDataObj = {
                ffRno: $modal.data('ffRno'),
                ffContent: $('input[name=ffContent]').val()
            }
            // console.log(modDataObj);
            const reqInfo = {
                method: 'PUT',
                headers: {'content-type': 'application/json'},
                body: JSON.stringify(modDataObj)
            }

            console.log(modDataObj);

            fetch('/api/v1/replies/' + modDataObj.ffRno, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'modSuccess') {
                        $modal.modal('hide');
                        showReplyList(curPageNum);
                    } else {
                        alert('수정에 실패하였습니다.');
                    }
                });
        });


        $('#modalRemoveBtn').on('click', e => {

            const reqInfo = {
                method: 'DELETE'
            };


            fetch('/api/v1/replies/' + ffBno + '/' + $modal.data('ffRno'), reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'delSuccess') {
                        $modal.modal('hide');
                        showReplyList(curPageNum);
                    } else {
                        alert('삭제에 실패하였습니다.');
                    }
                });

        });

    });//JQuery영역
    (function () {

        showReplyList(curPageNum);

    }());
</script>

<!-- 게시글 관련 스크립트 -->
<script>
    $(document).ready(function () {


        document.getElementById('list-btn').addEventListener('click', e => {
            location.href = '/food_friends/ff_list?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}';
        });

        document.getElementById('modify-btn').addEventListener('click', e => {
            location.href = '/food_friends/ff_modify?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}&ffBno=${foodFriends.ffBno}';
        });

    });
</script>


<%@include file="../includes/footer.jsp" %>