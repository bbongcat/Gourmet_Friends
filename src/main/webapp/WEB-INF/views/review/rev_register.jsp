<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/board/register" method="post">
          <div class="form-group">
            <label>Title</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="5" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>Writer</label> <input class="form-control" name='writer'>
          </div>

          <!-- 첨부파일 드래그 앤 드롭 영역 -->
          <div class="form-group">
            <form action="/upload" method="post" enctype="multipart/form-data">
              <input type="file" name="file" multiple>
              <button type="submit">업로드</button>
            </form>
            <div class="uploadDiv">
              <input type="file" name="files" id="ajax-file" style="display: none;">
            </div>
            <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
            <div class="uploaded-list"></div>
          </div>
          
          <button type="submit" class="btn btn-default">Submit
            Button</button>
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

     //이미지 파일인지 확인하는 함수
     function isImageFile(originFileName){
         //정규 표현식
         const pattern = /jpg$|gif$|png$/i;
         return originFileName.match(pattern);
     }
      

     //확장자 판별 후 태그처리 함수 
     function checkExtType(fileName){
         //fileName:/2021/04/23 ~~~~~~.확장자
         //sfdagsgdggdsgds_haha.docx -> haha.docx
         let originFileName = fileName.substring(fileName.indexOf("_") + 1);

         //input과 이미지를 감싸는 li
         const $li = document.createElement('li');
         const $input = document.createElement('input');
         $input.setAttribute('type','hidden');
         $input.setAttribute('name','fileNames');
         $input.setAttribute('value',fileName);
         $li.appendChild($input);

         //이미지인지 확인
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

     //드롭한 파일의 형식에 따라 태그를 보여주는 함수 
     function showFileData(fileNameList){
         for(let fileName of fileNameList){

             //이미지인지 이미지가 아닌지 구분하여 따로 처리 
             checkExtType(fileName);

         }
     }
  });
</script>
<%@include file="../includes/footer.jsp"%>