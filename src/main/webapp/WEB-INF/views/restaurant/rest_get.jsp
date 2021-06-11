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
        <h1 class="page-header">Restaurant Read</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Restaurant Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class="form-group">
                    <label>음식점 번호</label> <input class="form-control" name='restNo' value="${restaurant.restNo}" readonly>
                </div>

                <div class="form-group">
                    <label>음식점 이름</label> <input class="form-control" name='restName' value="${restaurant.restName}" readonly>
                </div>

                <div class="form-group">
                    <label>카테고리</label>
                    <textarea class="form-control" rows="3" name='category' readonly>${restaurant.cateNo}</textarea>
                </div>

                <div class="form-group">
                    <label>전화번호</label> <input class="form-control" name='restPh' value="${restaurant.restPh}" readonly>
                </div>

                <div class="form-group">
                    <label>별점</label> 
                    <div class="star-rating">
                        <c:forEach var="review" begin="1" end="${review.revStar}">★</c:forEach>
                    </div>
                </div>

                <div class="form-group">
                    <label>영업 시간</label> <input class="form-control" name='restTime' value="${restaurant.restTime}" readonly>
                </div>

                <div class="form-group">
                    <ul class="uploaded-list"></ul>
                </div>

                <button id='list-btn' class="btn btn-info">List</button>


            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->

<%--
<div class='row'>

    <div class="col-lg-12">

        <!-- /.panel -->
        <div class="panel panel-default">


            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> 댓글 (<span class="replyCnt"></span>)

                <c:if test="${loginUser != null}">
                    <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 등록</button>
                </c:if>

            </div>


            <!-- /.panel-heading -->
            <div class="panel-body">

                <ul class="chat">
                    <!-- 실제 댓글이 들어갈 부분 -->
                    <!-- <li class="left clearfix" data-rno="1">
                      <div>
                        <div class="header">
                          <strong class="primary-font">둘리</strong>
                          <small class="pull-right text-muted">13:09</small>
                        </div>
                        <p>댓글 내용 주저리주저리</p>
                      </div>
                    </li>
                  </ul> -->
                    <!-- ./ end ul -->
            </div>
            <!-- /.panel .chat-panel -->

            <!-- 댓글 페이지가 들어갈 부분 -->
            <div class="panel-footer"></div>


        </div>
    </div>
    <!-- ./ end row -->
</div>



<!-- Reply Modal : 댓글 관련 -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Reply</label>
                    <input class="form-control" name='reply' value='New Reply!!!!'>
                </div>
                <div class="form-group">
                    <label>Replyer</label>
                    <input class="form-control" name='replyer' value='replyer'>
                </div>
                <div class="form-group">
                    <label>Reply Date</label>
                    <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
                </div>

            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 댓글 관련 스크립트 -->
<script>
    // 원본 글 번호
    let bno = '${board.bno}';

    // 현재 댓글 페이지 정보
    let curPageNum = 1;

    // 날짜 포맷 변환 함수
    function formatDate(datetime) {
        // 문자열 날짜 데이터를 날짜객체로 변환
        const dateObj = new Date(datetime);
        // 날짜 객체를 통해 각 날짜 정보 얻기
        let year = dateObj.getFullYear();
        let month = dateObj.getMonth() + 1;
        let date = dateObj.getDate();
        let hour = dateObj.getHours();
        let minute = dateObj.getMinutes();

        // 오전, 오후 시간 체크
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

        // 숫자가 1자리일 경우 2자리로 변환
        (month < 10) ? month = '0' + month: month;
        (date < 10) ? date = '0' + date: date;
        (hour < 10) ? hour = '0' + hour: hour;
        (minute < 10) ? minute = '0' + minute: minute;

        return year + "-" + month + "-" + date + " " + ampm + " " + hour + ":" + minute;
    }

    // 댓글 페이지 목록을 만들어주는 함수
    function showReplyPage(count) {
        let pageNum = curPageNum;
        const $pageFooter = document.querySelector('.panel-footer');

        // 한번에 보여줄 페이지 개수
        const DISPLAY_PAGE = 10;

        let endPage = Math.ceil(pageNum / DISPLAY_PAGE) * DISPLAY_PAGE;
        const beginPage = endPage - DISPLAY_PAGE + 1;

        // 끝페이지 보정
        if (endPage * DISPLAY_PAGE >= count) {
            endPage = Math.ceil(count / DISPLAY_PAGE);
        }

        const prev = beginPage !== 1;
        const next = endPage * DISPLAY_PAGE < count;

        let data = '';
        data += '<ul class="pagination pull-right">';
        if (prev) {
            data += '<li class="page-item"><a class="page-link" href="' + (beginPage - 1) + '">이전</a></li>';
        }

        for (let i = beginPage; i <= endPage; i++) {
            let active = pageNum == i ? "active" : '';

            data += '<li class="page-item ' + active + '"><a class="page-link" href="' + i + '">' + i + '</a></li>';
        }

        if (next) {
            data += '  <li class="page-item"><a class="page-link" href="' + (endPage + 1) + '">다음</a></li>';
        }
        data += '</ul>';

        $pageFooter.innerHTML = data;

        // 댓글 페이지 클릭 이벤트
        document.querySelector('ul.pagination').addEventListener('click', e => {
            if (!e.target.matches('ul.pagination > li > a')) {
                return;
            }
            e.preventDefault();
            // console.log("페이지 버튼 클릭됨!", e.target.getAttribute('href'));

            curPageNum = e.target.getAttribute('href')

            showReplyList(curPageNum);
        })
    }

    // 댓글 목록 DOM을 만드는 함수
    function makeReplyListDOM({
                                  replies,
                                  count
                              }) {

        if (replies === null || replies.length === 0) {
            return;
        }
        let data = '';

        for (let reply of replies) {
            data += '<li class="left clearfix" data-rno="' + reply.rno + '">';
            data += '<div>';
            data += '<div class="header">';
            data += '<strong class="primary-font">' + reply.replyer + '</strong>';
            data += '<small class="pull-right text-muted">' + formatDate(reply.replyDate) + '</small>';
            data += '</div>';
            data += '<p>' + reply.reply + '</p>';
            data += '</div>';
            data += '</li>';
        }
        document.querySelector('.chat').innerHTML = data;

        // 페이지화면을 그려주는 함수
        showReplyPage(count);
    }

    // 댓글목록을 비동기로 불러오는 함수
    function showReplyList(page) {
        fetch('/api/v1/replies/' + bno + '/' + page)
            .then(res => res.json())
            .then(replyMap => {
                // console.log(replyList);
                makeReplyListDOM(replyMap);
                document.querySelector('.replyCnt').textContent = replyMap.count;
            })
    }

    $(document).ready(function () {

        const $modal = $('#replyModal');

        // 게시글 등록을 눌렀을 때 모달팝업을 띄우는 이벤트
        document.getElementById('addReplyBtn').addEventListener('click', e => {

            // $modal - 모달 전체 노드
            // find() - 요소에서 자식노드를 모드 탐색하여 선택자에 맞는 요소를 가져옴
            $modal.find('input').val('');

            $modal.find('input[name=replyDate]').parent().hide();

            $modal.find('button[id != modalRegisterBtn]').hide();
            $modal.find('button[id= modalRegisterBtn]').show()
            $modal.find('#modalCloseBtn').show();

            $('#replyModal').modal('show');
        });

        // Modal close버튼 이벤트
        $('#modalCloseBtn').on('click', e => {
            $modal.modal('hide');
        });

        // 댓글 등록 서버요청 비동기 처리 이벤트
        $('#modalRegisterBtn').on('click', e => {

            // 서버로 전송할 데이터
            const replyObj = {
                bno: bno,
                reply: $('input[name=reply]').val(),
                replyer: $('input[name=replyer]').val()
            };
            // console.log(replyObj);

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
                        alert('댓글 등록 실패');
                    }
                });
        });

        // 댓글 li를 눌렀을 때 댓글 상세보기 모달이 뜨트 이벤트
        $('ul.chat').on('click', 'li', e => {
            // console.log(e.target);

            $modal.find('button[id=modalRegisterBtn]').hide();
            $modal.find('button[id!=modalRegisterBtn]').show();
            $modal.find('input[name=replyDate]').parent().show();


            // 서버에 댓글 개별 조회 비동기 요청
            const rno = e.currentTarget.dataset.rno;

            // console.log(rno);
            fetch('/api/v1/replies/' + rno)
                .then(res => res.json())
                .then(reply => {
                    // console.log(reply);
                    $('input[name=reply]').val(reply.reply);
                    $('input[name=replyer]').val(reply.replyer);
                    $('input[name=replyDate]').val(formatDate(reply.replyDate));
                    $('input[name=replyDate]').attr('readonly', 'readonly');

                    // Modal에 rno 추가
                    $modal.data('rno', rno);
                });

            $modal.modal('show');
        });

        // 댓글 수정 버튼 클릭 이벤트
        $('#modalModBtn').on('click', e => {

            const modDataObj = {
                rno: $modal.data('rno'),
                reply: $('input[name=reply]').val()
            }
            // console.log(modDataObj);

            const reqInfo = {
                method: 'PUT',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(modDataObj)
            };

            fetch('/api/v1/replies/' + modDataObj.rno, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'modSuccess') {
                        $modal.modal('hide');
                        showReplyList(curPageNum);
                    } else {
                        alert('modify fail');
                    }
                });
        });

        // 댓글 삭제 버튼 클릭 이벤트
        $('#modalRemoveBtn').on('click', e => {

            const reqInfo = {
                method: 'DELETE'
            };

            fetch('/api/v1/replies/' + bno + "/" + $modal.data('rno'), reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'delSuccess') {
                        $modal.modal('hide');
                        showReplyList(curPageNum);
                    } else {
                        alert('delete fail');
                    }
                });
        });

        // 이미지파일인지 확인하는 함수
        function isImageFile(originFileName) {
            // 정규표현식
            const pattern = /jpg$|gif$|png$/i;
            return originFileName.match(pattern);
        }

        // 확장자 판별 후 태그처리 함수
        function checkExtType(fileName) {
            // 원본 파일명 추출
            // fileName: /2021/04/23/~~~~. 확장자
            // dfsfdsfsdgsd_haha.docx -> haha.docx
            let originFileName = fileName.substring(fileName.indexOf("_") + 1);

            // 이미지인지 확인
            if (isImageFile(originFileName)) {
                originFileName = fileName.substring(fileName.indexOf("_") + 1);

                const $img = document.createElement('img');
                $img.classList.add('img-sizing');
                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);
                $('.uploaded-list').append($img)
            } else {
                // 이미지가 아니라면 다운로드 링크를 생성
                const $link = document.createElement('a');
                $link.setAttribute('href', '/loadFile?fileName' + fileName);

                const $img = document.createElement('img');
                $img.setAttribute('src', '/img/file_icon.jpg');

                $link.appendChild($img);
                $link.innerHTML += '<span>' + originFileName + '</span>';
                $('.uploaded-list').append($link);
            }
        }

        //드롭한 파일의 형식에 따라 태그를 보여주는 함수
        function showFileData(fileNameList) {
            //fileName: \2021\04\22\dfhskdfjslfjdlsfsjk_dog.gif
            for (let fileName of fileNameList) {

                // 이미지인지 이미지가 아닌지 구분하여 따로 처리
                checkExtType(fileName);
            }
        }

        // 파일 목록 불러오기
        function showFileList() {
            fetch('/board/file/' + bno)
                .then(res => res.json())
                .then(fileNameList => {
                    showFileData(fileNameList);
                })
        }
        showFileList();

    }); // JQuery 영역

    (function () {
        showReplyList(curPageNum);
    }());
</script>
--%>

<!-- 게시글 관련 스크립트 -->
<script>
    $(document).ready(function () {

        //목록 버튼 이벤트
        document.getElementById('list-btn').addEventListener('click', e => {
            location.href = '/restaurant/rest_list?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}';
        });

        //수정 버튼 이벤트
        document.getElementById('modify-btn').addEventListener('click', e => {
            location.href =
                '/restaurant/rest_modify?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}&restNo=${restaurant.restNo}';
        });

    });
</script>


<%@include file="../includes/footer.jsp"%>