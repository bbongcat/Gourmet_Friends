<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>

  .fileDrop {
      width: 800px;
      height: 400px;
      border: 1px dashed gray;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 1.5em;
  }
  .uploaded-list{
      display: flex;
  }
  .img-sizing{
      display: block;
      width: 100px;
      height: 100px;
  }
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
  .rating .rate-radio+label{
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/views/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
  }
  .rating .rate-radio:checked+label {
      background-color: #ff8;
  }
  /* .warning-msg {
      display: block;
      position: relative;
      text-align: center;
      background: #ffffff;
      line-height: 26px;
      width: 100%;
      color: red;
      padding: 10px;
      box-sizing: border-box;
      border: 1px solid #e0e0e0;
   } */
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

        <form role="form" action="/review/register" method="post">
          <div class="form-group">
            <label>음식점 번호</label> <input class="form-control" name='restNo' value="${restaurant.restName}">
          </div>

          <div class="form-group">
            <label>리뷰 내용</label>
            <textarea class="form-control" rows="5" name='revContent'></textarea>
          </div>

          <!-- 별정 기능 구현 -->
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
            <label>회원ID</label> <input class="form-control" name='userId' readonly value="${loginUser.userNick}">
          </div>

          <!-- 첨부파일 드래그 앤 드롭 영역 -->
          <div class="form-group">
            <div class="fileDrop">
              <span>사진을 드래그 하세요.</span>
            </div>
            <div class="uploadDiv">
              <input type="file" name="files" id="ajax-file" style="display: none;">
            </div>
            <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
            <div class="uploaded-list"></div>
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

     const $dropBox = $('.fileDrop');
     
     $dropBox.on('dragover dragenter',e => {
         e.preventDefault();
         $dropBox.css('border-color','red').css('background','lightgray');
     });
     $dropBox.on('dragleave',e => {
         e.preventDefault();
         $dropBox.css('border-color','gray').css('background','transparent');
     });

     function isImageFile(originFileName){
         const pattern = /jpg$|gif$|png$/i;
         return originFileName.match(pattern);
     }
      

     function checkExtType(fileName){
         let originFileName = fileName.substring(fileName.indexOf("_") + 1);

         const $li = document.createElement('li');
         const $input = document.createElement('input');
         $input.setAttribute('type','hidden');
         $input.setAttribute('name','fileNames');
         $input.setAttribute('value',fileName);
         $li.appendChild($input);

         if(isImageFile(originFileName)){
             originFileName = fileName.substring(fileName.indexOf("_") + 1);

             const $img = document.createElement('img');
             $img.classList.add('img-sizing');
             $img.setAttribute('src','/loadFile?fileName='+fileName);
             $img.setAttribute('alt',originFileName);
             
             $li.appendChild($img);
             $('.uploaded-list').append($li);
         }
     }

     function showFileData(fileNameList){
         for(let fileName of fileNameList){

             checkExtType(fileName);

         }
     }

     $dropBox.on('drop',e => {
         e.preventDefault();

         const files = e.originalEvent.dataTransfer.files;

         const $fileInput = $('#ajax-file');
         $fileInput.prop('files',files);

         const formData = new FormData();
         const sendFiles = $fileInput[0].files;

         for(let file of sendFiles){
             formData.append('files',file);
         }
         
         const reqInfo = {
             method: 'POST',
             body: formData 
         }
         fetch('/ajaxUpload',reqInfo)
             .then(res => res.json())
             .then(fileNameList => {
                 showFileData(fileNameList);
             });

     });
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
        // console.log(elem);
        if(elem.classList.contains('.rate-radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
</script>
<%@include file="../includes/footer.jsp"%>