<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">foodFriends Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">foodFriends Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <div class="form-group">
          <label>번호</label> <input class="form-control" name='ffBno' value="${foodFriends.ffBno}" readonly>
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" name='title' value="${foodFriends.title}" readonly>
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" name='content' readonly>${foodFriends.content}</textarea>
        </div>

        <div class="form-group">
          <label>회원ID</label> <input class="form-control" name='userId' value="${foodFriends.userId}" readonly>
        </div>


        <button id='modify-btn' class="btn btn-default">수정</button>
        <button id='list-btn' class="btn btn-info">목록</button>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- 댓글 영역 -->
<div class='row'>

  <div class="col-lg-12">

    <!-- /.panel -->
    <div class="panel panel-default">

      
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> 댓글 (<span class="ffReplyCnt"></span>)
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 등록</button>
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



<!-- Modal -->
      <div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>댓글내용</label> 
                <input class="form-control" name='ffContent' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>회원ID</label> 
                <input class="form-control" name='userId' value='userId'>
              </div>
              <div class="form-group">
                <label>댓글 등록 시간</label> 
                <input class="form-control" name='ffDate' value='2018-01-01 13:13'>
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

<!-- //댓글 영역 끝 -->


<!-- 댓글 관련 스크립트 -->
<script>

  let bno = '${foodFriends.ffBno}';

  
  let curPageNum = 1; 

  
  function formatDate(datetime){
    
    const dateObj = new Date(datetime);
    
    let year = dateObj.getFullYear();
    let month = dateObj.getMonth() + 1;
    let day = dateObj.getDate();
    let hour = dateObj.getHours();
    let minute = dateObj.getMinutes();

    
    let ampm = '';
    if(hour < 12 && hour >= 6){
      ampm = '오전';
    }else if(hour >= 12 && hour < 21){
      ampm = '오후';
      if(hour !== 12){
        hour -= 12;
      }
    }else if(hour >= 21 && hour <= 24){
      ampm = '밤';
      hour -= 12;
    }else{
      ampm = '새벽';
    }

    (month < 10) ? month = '0' + month : month;
    (day < 10) ? day = '0' + day : day;
    (hour < 10) ? hour = '0' + hour : hour;
    (minute < 10) ? minute = '0' + minute : minute;

    return year + "-" + month + "-" + day + "-" + ampm + " " + hour + ":" + minute ; 
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

      
    document.querySelector('ul.pagination').addEventListener('click',e => {
      if(!e.target.matches('ul.pagination > li > a')){
        return;
      }
      e.preventDefault();
      
      curPageNum = e.target.getAttribute('href');
      
      showReplyList(curPageNum);
    });
  }

  
  function makeReplyListDOM({replies, count}){
    if(replies === null || replies.length === 0){
      return;
    }
    let data = '';
  
    for(let reply of replies){
      data += '<li class="left clearfix" data-rno = "'+ ffReply.ffRno +'">';
      data += '   <div>';
      data += '     <div class="header">';
      data += '         <strong class="primary-font">' + ffReply.userId + '</strong>';
      data += '     <small class="pull-right text-muted">'+ formatDate(ffReply.ffDate) + '</small>';
      data += '    </div>';
      data += '    <p>'+ ffReply.ffContent +'</p>';
      data += '   </div>';
      data += '</li>';
    }
    document.querySelector('.chat').innerHTML = data;
    
    showReplyPage(count);
  }


  function showReplyList(page){
    fetch('/api/v1/replies/'+ ffBno + '/' + page)
        .then(res => res.json())
        .then(ffReplyMap => {
          
          makeReplyListDOM(ffReplyMap);
          document.querySelector('.ffReplyCnt').textContent = ffReplyMap.count;
        });
  }

  //JQuery영역
  $(document).ready(function() {

    const $modal = $('#replyModal');

    //게시글 등록을 눌렀을 때 모달팝업을 띄우는 이벤트 
    document.getElementById('addReplyBtn').addEventListener('click',() => {

      //$modal - 모달 전체 노드 
      //find() - 요소에서 자식노드를 모두 탐색하여 선택자에 맞는 요소르 가져옴 
      $modal.find('input').val('');

      $modal.find('input[name=ffDate]').parent().hide();

      $modal.find('button[id != modalRegisterBtn]').hide();

      $modal.find('#modalCloseBtn').show();

      $modal.modal('show');

    });

    //모달 close이벤트
    $('#modalCloseBtn').on('click',e => {
      $modal.modal('hide');
    });

    //게시물 등록 서버요청 비동기 처리 이벤트 
    $('#modalRegisterBtn').on('click',e => {

      //서버로 전송할 데이터 - 디버깅 
      const replyObj ={
          bno: bno,
          reply: $('input[name=ffReply').val(),
          replyer: $('input[name=userId').val()
      };

      console.log(replyObj);

      const reqInfo = {
        method: 'POST',
        headers: {
          'content-type':'application/json'
        },
        body:JSON.stringify(replyObj)
      };
      fetch('/api/v1/replies/',reqInfo)
            .then(res => res.text())
            .then(msg => {
              if(msg === 'regSuccess'){
                $modal.modal('hide');
                $modal.find('input').val('');
                showReplyList(curPageNum);
              }else{
                alert('댓글 등록을 실패하였습니다.');
              }
            });

    });

  
    $('ul.chat').on('click', 'li' ,e =>{
      
      $modal.find('button[id=modalRegisterBtn]').hide();
      $modal.find('button[id != modalRegisterBtn]').show();
      $modal.find('input[name=ffDate]').parent().show();

      
      const rno = e.currentTarget.dataset.rno;

      fetch('/api/v1/replies/' + rno)
            .then(res => res.json())
            .then(reply => {
              // console.log(reply);
              $('input[name=ffReply]').val(ffReply.ffReply);
              $('input[name=userId').val(ffReply.userId);
              $('input[name=ffDate]').val(formatDate(ffReply.ffDate));
              $('input[name=ffDate]').attr('redaonly','readonly');

              $modal.data('ffRno',ffRno);
            });

      $modal.modal('show');
    });

    //댓글 수정 버튼 클릭 이벤트 
    $('#modalModBtn').on('click',e =>{
      const modDataObj = {
        rno: $modal.data('ffRno'),
        reply: $('input[name=ffReply]').val()
      }
      // console.log(modDataObj);
      const reqInfo = {
        method: 'PUT',
        headers: {'content-type': 'application/json'},
        body: JSON.stringify(modDataObj)
      }

      fetch('/api/v1/replies/'+ modDataObj.ffRno,reqInfo)
            .then(res => res.text())
            .then(msg => {
              if(msg === 'modSuccess'){
                $modal.modal('hide');
                showReplyList(curPageNum);
              }else{
                alert('수정에 실패하였습니다.');
              }
            });
    });

    
    $('#modalRemoveBtn').on('click',e => {
    
      const reqInfo = {
        method: 'DELETE'
      };

      
      fetch('/api/v1/replies/'+ ffBno + '/'+ $modal.data('ffRno'),reqInfo)
            .then(res => res.text())
            .then(msg => {
              if(msg === 'delSuccess'){
                $modal.modal('hide');
                showReplyList(curPageNum);
              }else{
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
$(document).ready(function() {

      
      document.getElementById('list-btn').addEventListener('click', e => {
          location.href='/food_friends/ff_list?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}';
      });

      document.getElementById('modify-btn').addEventListener('click', e => {
          location.href='/food_friends/ff_modify?page=${pageInfo.page}&type=${pageInfo.type}&keyword=${pageInfo.keyword}&ffBno=${foodFriends.ffBno}';
      });

});
</script>


<%@include file="../includes/footer.jsp"%>