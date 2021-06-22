<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>
    .rating .rate-radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
  }
  .rating .rate-radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./views/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
  }
  .rating .rate-radio:checked + label {
      background-color: #ff8;
  }
  .warning-msg {
      display: none;
      position: relative;
      text-align: center;
      background: #ffffff;
      line-height: 26px;
      width: 100%;
      color: red;
      padding: 10px;
      box-sizing: border-box;
      border: 1px solid #e0e0e0;
   }
   .select_img img {
       width: 500px;
       margin: 20px 0;
   }
</style>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Review Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Review Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/review/rev_modify" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label>리뷰 번호</label>
                        <input class="form-control" name='revBno' value='${review.revBno}' readonly>
                    </div>

                    <div class="form-group">
                        <label>음식점 이름</label>
                        <input class="form-control" name='restNo' value='${restaurant.restName}' readonly>
                    </div>

                    <div class="form-group">
                        <label>리뷰 내용</label>
                        <textarea class="form-control" rows="5" name='revContent'>${review.revContent}</textarea>
                    </div>

                    <!-- 리뷰 평점 api생성하기 -->
                    <div class="review-rating">
                        <div class="warning-msg">별점을 선택해주세요</div>
                        <div class="rating">
                          <input type="checkbox" name="revStar" id="rating1" value="${review.revStar}" class="rate-radio" title="1점">
                          <label for="rating1"></label>
                          <input type="checkbox" name="revStar" id="rating2" value="${review.revStar}" class="rate-radio" title="2점">
                          <label for="rating2"></label>
                          <input type="checkbox" name="revStar" id="rating3" value="${review.revStar}" class="rate-radio" title="3점">
                          <label for="rating3"></label>
                          <input type="checkbox" name="revStar" id="rating4" value="${review.revStar}" class="rate-radio" title="4점">
                          <label for="rating4"></label>
                          <input type="checkbox" name="revStar" id="rating5" value="${review.revStar}" class="rate-radio" title="5점">
                          <label for="rating5"></label>
                        </div>
                      </div>

                    <div class="form-group">
                        <label>회원</label>
                        <input class="form-control" name='userId' value='${review.userId}' readonly>
                    </div>

                    <div class="form_group">                       
                            <label for="reviewImg">리뷰 이미지</label>
                            <input type="file" id="reviewImg" name="file">
                        <div class="select_img">
                            <img src="${review.reviewImg}">
                            <input type="hidden" name="reviewImg" value="${review.reviewImg}">
                            <input type="hidden" name="reviewThumbImg" value="${review.reviewThumbImg}">
                        </div>
                    </div>

                    <input type="hidden" name="page" value="${pageInfo.page}">
                    <input type="hidden" name="type" value="${pageInfo.type}">
                    <input type="hidden" name="keyword" value="${pageInfo.keyword}">

                    <div class="btn-group">
                        <button type="submit" data-oper='rev_modify' class="btn btn-default">수정</button>
                        <button type="button" data-oper='rev_remove' class="btn btn-danger">삭제</button>
                        <button type="button" data-oper='rev_list' class="btn btn-info">목록</button>
                    </div>
                </form>


            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->
<script>

    document.querySelector('.btn-group').addEventListener('click',function(e){
        e.preventDefault(); //submit기능 중지(서버로 전송 가능)

        const oper = e.target.dataset.oper;

        const $actionForm = document.querySelector('form[role=form]')

        if(oper === 'rev_list'){
            $actionForm.setAttribute('action','/review/rev_list');
            $actionForm.setAttribute('method','get');
        }else if(oper === 'rev_remove'){
            $actionForm.setAttribute('action','/review/rev_remove');
        }

        //form을 submit
        $actionForm.submit();
    });

    //별점 마킹 모듈 프로토타입으로 생성
    function Rating(){};
    Rating.prototype.rate = 0;
    Rating.prototype.setRate = function(newrate){
        //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
        this.rate = newrate;
        let items = document.querySelectorAll('.rate-radio');
        items.forEach(function(item, idx){
            if(idx < newrate){
                item.checked = true;
            }else{
                item.checked = false;
            }
        });
    }
    let rating = new Rating();//별점 인스턴스 생성

    document.addEventListener('DOMContentLoaded', function(){
        //별점선택 이벤트 리스너
        document.querySelector('.rating').addEventListener('click',function(e){
            let elem = e.target;
            if(elem.classList.contains('.rate-radio')){
                rating.setRate(parseInt(elem.value));
            }
        })
    });

    //리뷰 이미지 
    $("#reviewImg").change(function(){
        if(this.files && this.files[0]){
            let reader = new FileReader;
            reader.onload = function(data){
                $(".select_img img").attr("src",data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
</script>


<%@include file="../includes/footer.jsp"%>