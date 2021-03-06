<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
    .star-rating {
        color: #ffc048;
    }

</style>

<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/bg-6.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">Review</h1>
    </div>
</div>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">

                    <div class="get-title">
                        <span>${review.restName}</span>
                        <span class="lnr lnr-user">${review.userId}</span>
                    </div>

                    <div class="get-content">
                        <img src="${review.reviewImg}" class="oriImg">
                        <br>
                        <div>${review.revContent}</div>
                        <br>
                        <div class="star-rating">
                            <c:forEach var="review" begin="1" end="${review.revStar}">★</c:forEach>
                        </div>
                    </div>

                    <br>
                    <br>

                    <c:if test="${loginUser.userId == review.userId}">
                        <button id='modify-btn' class="btn btn-blue">수정</button>
                    </c:if>
                    <c:if test="${loginUser != null}">
                        <button id='report-btn' class="btn btn-blue">신고</button>
                    </c:if>
                    <button id='list-btn' class="btn btn-blue">목록</button>
                    <br>
                    <br>

                    <!-- Modal  추가 -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">처리가 완료되었습니다.</div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-brown" data-dismiss="modal">Close
                                    </button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->

                    <!-- 댓글 영역 -->
                    <div class='row'>

                        <div class="col-lg-12">

                            <!-- /.panel -->
                            <div class="panel panel-default">


                                <div class="panel-heading">
                                    <i class="fa fa-comments fa-fw"></i> 댓글 <span class="revReplyCnt"></span>

                                    <c:if test="${loginUser != null}">
                                        <button id='addReplyBtn' class='btn btn-brown'>댓글 등록</button>
                                    </c:if>
                                </div>


                                <!-- /.panel-heading -->
                                <div class="panel-body">

                                    <ul class="chat">
                                        <!-- 실제 댓글이 들어갈 부분 -->
                                    </ul>
                                    <!-- ./ end ul -->
                                </div>
                                <!-- /.panel .chat-panel -->

                                <!-- 댓글 페이지 목록  -->
                                <div class="panel-footer"></div>


                            </div>
                        </div>
                        <!-- ./ end row -->
                    </div>

                </article>
                <!--  end panel-body -->
            </div>
        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</section>
<!-- /.row -->


<!--review reply Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">리뷰 댓글 등록</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>리뷰 댓글 내용</label>
          <input class="form-control" name='revContent'>
        </div>
        <div class="form-group">
          <label>회원</label>
          <input class="form-control" name='userId' value='userId'>
        </div>
        <div class="form-group">
          <label>리뷰 댓글 시간</label>
          <input class="form-control" name='revDate' value='2018-01-01 13:13'>
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

<!-- //리뷰 댓글 영역 끝 -->

<!-- 댓글 관련 스크립트 -->
<script>
  let revBno = '${review.revBno}';

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

        return year + "-" + month + "-" + day + "-" + ampm + " " + hour + ":" + minute;
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

  function makeReplyListDOM({replies,count}) {
    if (replies === null || replies.length === 0) {
      return;
    }
    let data = '';

    for (let revReply of replies) {
      data += '<li class="left clearfix" data-rno = "' + revReply.revRno + '">';
      data += '   <div>';
      data += '     <div class="header">';
      data += '         <strong class="primary-font">' + revReply.userId + '</strong>';
      data += '     <small class="pull-right text-muted">' + formatDate(revReply.revDate) + '</small>';
      data += '    </div>';
      data += '    <p>' + revReply.revContent+ '</p>';
      data += '   </div>';
      data += '</li>';
    }
    document.querySelector('.chat').innerHTML = data;
    showReplyPage(count);
  }


  function showReplyList(page) {
    fetch('/api/v2/replies/' + revBno + '/' + page)
      .then(res => res.json())
      .then(replyMap => {
        makeReplyListDOM(replyMap);
        document.querySelector('.revReplyCnt').textContent = replyMap.count;
      });
  }

    $(document).ready(function () {

        //리뷰 댓글 등록
        const $modal = $('#replyModal');

        document.getElementById('addReplyBtn').addEventListener('click', () => {

            $modal.find('input').val('');

            $modal.find('input[name=revDate]').parent().hide();

            $modal.find('button[id != modalRegisterBtn]').hide();

            $modal.find('#modalCloseBtn').show();

            $modal.modal('show');

        });

        $('#modalCloseBtn').on('click', e => {
            $modal.modal('hide');
        });

        $('#modalRegisterBtn').on('click', e => {

      const replyObj = {
        revBno: revBno,
        revContent: $('input[name=revContent]').val(),
        userId: $('input[name=userId]').val()
      };

      console.log(replyObj);

      const reqInfo = {
        method: 'POST',
        headers: {
          'content-type':'application/json'
        },
        body:JSON.stringify(replyObj)
      };

      fetch('/api/v2/replies/',reqInfo)
            .then(res => res.text())
            .then(msg => {
              console.log(msg);
              if(msg === 'regSuccess'){
                $modal.modal('hide');
                $modal.find('input').val('');
                showReplyList(curPageNum);
              }else{
                alert('댓글 등록을 실패하였습니다.');
              }
          });

    });
    

        $('ul.chat').on('click', 'li', e => {
            $modal.find('button[id=modalRegisterBtn]').hide();
            $modal.find('button[id != modalRegisterBtn]').show();
            $modal.find('input[name=revDate]').parent().show();

      const revRno = e.currentTarget.dataset.rno;

      console.log(revBno);

      fetch('/api/v2/replies/' + revRno)
        .then(res => res.json())
        .then(revReply => {
          $('input[name=revContent]').val(revReply.revContent);
          $('input[name=userId]').val(revReply.userId);
          $('input[name=revDate]').val(formatDate(revReply.revDate));
          $('input[name=revDate]').attr('redaonly', 'readonly');

                    $modal.data('revRno', revRno);
                });

            $modal.modal('show');
        });

    $('#modalModBtn').on('click', e => {
      const modDataObj = {
        revRno: $modal.data('revRno'),
        revContent: $('input[name=revContent]').val()
      }

      const reqInfo = {
        method: 'PUT',
        headers: {
          'content-type': 'application/json'
        },
        body: JSON.stringify(modDataObj)
      }

      console.log(modDataObj);

      fetch('/api/v2/replies/' + modDataObj.revRno, reqInfo)
        .then(res => res.text())
        .then(msg => {
          if (msg === 'modSuccess') {
            $modal.modal('hide');
            showReplyList(curPageNum);
          } else {
            alert('수정실패!');
          }
        });
    });

        $('#modalRemoveBtn').on('click', e => {
            const reqInfo = {
                method: 'DELETE'
            };

      fetch('/api/v2/replies/' + revBno + '/' + $modal.data('revRno'), reqInfo)
        .then(res => res.text())
        .then(msg => {
          if (msg === 'delSuccess') {
            $modal.modal('hide');
            showReplyList(curPageNum);
          } else {
            alert('삭제실패');
          }
        });
    });

    }); //JQuery영역

    (function () {

        showReplyList(curPageNum);

    }());
</script>

<!-- 게시글 관련 스크립트 -->
<script>
    $(document).ready(function () {

        //목록 버튼 이벤트
        document.getElementById('list-btn').addEventListener('click', e => {
            location.href = '/review/rev_list?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}';
        });

        //수정 버튼 이벤트
        document.getElementById('modify-btn').addEventListener('click', e => {
            location.href =
                '/review/rev_modify?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}&revBno=${review.revBno}';
        });


        document.getElementById('report-btn').addEventListener('click', e => {
            //링크 이동
            location.href = '/report/report-register';
        });


  });
</script>

<%@include file="../includes/footer.jsp" %>