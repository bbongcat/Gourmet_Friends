<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <!DOCTYPE html>
  <html lang="ko">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>

      <link rel="stylesheet" href="/css/admin/rest_pop.css">
      <script src="/vendor/jQueryValidation/jquery.validate.min"></script>
      <script src="https://code.jquery.com/jquery-3.4.1.js" 
              integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
              crossorigin="anonymous"></script>

  </head>
  <body>
      <div class="subject_name_wrap">
          <span>음식점 선택</span>
      </div>
      <div class="content_wrap">
        <div class="rest_table_wrap">
                <c:if test="${restListChk != 'empty'}">
                    <table class="rest_table">
                        <th>
                            <tr>
                                <td class="th_coloumn_1">음식점 번호</td>
                                <td class="th_coloumn_2">음식점 이름</td>
                                <td class="th coloumn_3">음식점 카테고리</td>                           
                            </tr>
                        </th>
                        
                        <c:forEach items="${restList}" var="restList">
                            <tr>
                                <td><c:out value="${restList.restNo}"></c:out></td>
                                <td>
                                    <a class="move" href='<c:out value="${restList.restNo}"/>' data-name='<c:out value="${restList.restName}"/>'>
                                    <c:out value="${restList.restName}"></c:out>
                                </a>
                            </td>
                            <td><c:out value="${restList.cateName}"></c:out></td>                     
                        </tr>
                       </c:forEach>
                    </table>
                </c:if>

                <c:if test="${restListChk == 'empty'}">
                    <div class="table_empty">
                        등록된 음식점이 없습니다.
                    </div>
                </c:if>
            </div>

            <!-- 검색 영역 -->
            <div class="search_wrap">
                <form id="searchForm" action="/admin/rest_pop" method="GET">
                    <div class="search_input">
                        <input type="text" name="keyword" value='<c:out value="${pageInfo.cri.keyword}"></c:out>'>
                        <input type="hidden" name="page" value='<c:out value="${pageInfo.cri.page}"></c:out>'>
                        <input type="hidden" name="amount" value='${pageInfo.cri.keyword}'>
                        <button class="btn search_btn">검 색</button>
                    </div>
                </form>
            </div>

            <!-- pagination  -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test = "${pageInfo.prev}">
                        <li class="paginate_button previous">
                            <a href="/admin/rest_pop${pageInfo.makeParam(pageInfo.startPage-1)}">이전</a>
                        </li>
                    </c:if>
                        
                    <c:forEach var= "num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="paginate_button"><a href="/admin/rest_pop${pageInfo.makeParam(num)}">${num}</a></li>
                    </c:forEach>

                    <c:if test = "${pageInfo.next}">
                        <li class="paginate_button next">
                            <a href="/admin/rest_pop${pageInfo.makeParam(pageInfo.endPage+1)}">다음</a>
                        </li>
                    </c:if>

                </ul>
            </div>
                <!-- end pagination  -->

            <form id="moveForm" action="/admin/rest_pop" method="GET">
                <input type="hidden" name="page" value="${pageInfo.cri.page}">
                <input type="hidden" name="amount" value="${pageInfo.cri.amount}">
                <input type="hidden" name="keyword" value="${pageInfo.cri.keyword}">
            </form>

        </div>
    </div>

    <script>
        let moveForm = $('#moveForm');
        let searchForm = $('#searchForm');

        $('#searchForm button').on('click',function(e){
            e.preventDefault();
            
            if(!searchForm.find("input[name='keyword']").val()){
                alert("키워드를 입력하십시오.");
                return false;
            }
            
            searchForm.find("input[name='page']").val("1");
            
            searchForm.submit();
        });

        // 음식점 선택 및 팝업창 닫기 
        $(".move").on("click",function(e){
            e.preventDefault();

            let restNo = $(this).attr("href");
            let restName = $(this).data("name");
            $(opener.document).find("#restNo_input").val(restNo);
            $(opener.document).find("#restName_input").val(restName);

            window.close();
        });

        $(document).ready(function(){
            function appendPageActive(currentPage){

                const $pageLiList = document.querySelectorAll('.paginate_button');
                    for($li of $pageLiList){
                        if($li.textContent === currentPage){
                            $li.classList.add('active');
                        }
                    }

            }

            (function () {


                appendPageActive("${pageInfo.cri.page}");

            }());
        });
    </script>
  </body>
  </html>