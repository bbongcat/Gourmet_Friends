<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>

.select_img img {
    margin: 20px 0;
}
.star-rating .on {
    font-size: 25px;
    color: #FFFF00;
}

</style>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Review Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Review Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/review/rev_register" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label>음식점</label>
            <input id="restName_input" readonly>
            <input id="restNo_input" name="restNo" type="hidden">
            <button class="restNo_btn">음식점 선택</button>
          </div>

          <div class="form-group">
            <label>리뷰 내용</label>
            <textarea class="form-control" rows="5" name='revContent'></textarea>
          </div>

          <!-- 별정 기능 구현 -->
         <div class="form-group">
           <label>리뷰 평점</label>
           <div class="star-rating">
             <a href="#" class="on" id="1">★</a>
             <a href="#" class="on" id="2">★</a>
             <a href="#" class="on" id="3">★</a>
             <a href="#" id="4">★</a>
             <a href="#" id="5">★</a>
             <input type="hidden" id="revStar" name="revStar" value="3">
           </div>
         </div>

          <div class="form-group">
            <label>회원</label> <input class="form-control" name='userId' readonly value="${loginUser.userId}">
          </div>

          <br>

          <div class="form_group">
            <label for="review">메뉴 이미지</label>
            <input type="file" id="reviewImg" name="file">
            <div class="select_img"><img src=""></div>
          </div>
          
          <button type="submit" class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
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
        $(document).ready(function() {

          $('.star-rating a').click(function(){
            $(this).parent().children('a').removeClass('on');
            $(this).addClass('on').prevAll('a').addClass('on');
            let starRate = $(this).attr('id');
            $('#revStar').val(starRate);
            return false;
          });

        });

        
        //리뷰 이미지 
        $("#reviewImg").change(function(){
            if(this.files && this.files[0]){
                let reader = new FileReader;
                reader.onload = function(data){
                    $(".select_ img img").attr("src",data.target.result).width(500);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        $('.restNo_btn').on("click",function(e){
            e.preventDefault();

            let popUrl= "/review/rest_pop";
            let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";

            window.open(popUrl, "음식점 선택", popOption);
        });

</script>
<%@include file="../includes/footer.jsp"%>