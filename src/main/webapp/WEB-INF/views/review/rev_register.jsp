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
  .star-rating{
    font-size: 0;
    letter-spacing: -4px;
  }
  .star-rating a {
    font-size: 22px;
    letter-spacing: 0;
    display: inline-block;
    margin-left: 5px;
    color: #ccc;
    text-decoration: none;
  }
  .star-rating a:first-child {
    margin-left: 0;
  }
  .star-rating a.on {
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

        <form role="form" action="/review/rev_register" method="post">
          <div class="form-group">
            <label>음식점 번호</label> <input class="form-control" name='restNo' value="${restaurant.restName}">
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
            <label>회원</label> <input class="form-control" name='userId' readonly value="${loginUser.userNick}">
          </div>

          <br>

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

     $('.star-rating a').click(function(){
       $(this).parent().children('a').removeClass('on');
       $(this).addClass('on').prevAll('a').addClass('on');
       let starRate = $(this).attr('id');
       $('#revStar').val(starRate);
       return false;
     });


  });

</script>
<%@include file="../includes/footer.jsp"%>