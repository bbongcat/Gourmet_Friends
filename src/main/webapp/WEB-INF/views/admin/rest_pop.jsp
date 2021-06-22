<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>

      <link rel="stylesheet" href="/css/admin/rest_pop.css">
      <script src="/vendor/jquery/jquery.min.js"></script>

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
                                <td class="th_coloumn_3">음식점 전화번호</td>
                                <td class="th_coloumn_4">음식점 영업시간</td>
                                <td class="th_coloumn_5">음식점 우편주소</td>
                                <td class="th_coloumn_6">음식점 도로명주소</td>
                                <td class="th_coloumn_7">음식점 상세주소</td>
                            </tr>
                        </th>
                        
                        <c:forEach items="${restList}" var="restList">
                            <td><c:out value="${restList.restNo}"></c:out></td>
                            <td>
                                <a class="move" href='<c:out value="${restList.restNo}"/>' data-name='<c:out value="${restList.restName}"/>'>
                                    <c:out value="${restList.restName}"></c:out>
                                </a>
                            </td>
                            <td><c:out value="${restList.cateCode}"></c:out></td>     
                            <td><c:out value="${restList.restPh}"></c:out></td>
                            <td><c:out value="${restList.restTime}"></c:out></td>
                            <td><c:out value="${restList.restOaddress}"></c:out></td>
                            <td><c:out value="${restList.restAddress}"></c:out></td>
                            <td><c:out value="${restList.restDetailaddress}"></c:out></td>
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
            <div class="pageMaker_wrap">
                <ul class="pageMaker">
                    <c:if test="${pageInfo.prev}">
                        <li class="pageMaker_btn prev">
                            <a href="${pageInfo.startPage - 1}">이전</a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="num">
                        <li class="pageMaker_btn ${pageInfo.cri.page == num ?}"active":""}">
                            <a href="${num}">${num}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageInfo.next}">
                        <li class="pageMaker_btn next">
                            <a href="${pageInfo.endPage + 1}">다음</a>
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

        //음식점 검색 버튼 
        $('#searchForm button').on(function(e){
            e.preventDefault();

            if(!searchForm.find("input[name='keyword']").val()){
                alert("키워드를 입력하십시오.");
                return false;
            }

            searchForm.find("input[name='page']").val("1");

            searchForm.submit();
        });

         // 페이지 이동 
         $('.pageMaker_btn a').on('click', function(e){
            e.preventDefault();
            moveForm.find("input[name='page']").val($(this).attr("href"));
            moveForm.submit();
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
    </script>
  </body>
  </html>