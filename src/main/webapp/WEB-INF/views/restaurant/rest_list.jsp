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

    <link rel="stylesheet" href="/css/restaurant.css">
    <script src="/vendor/jQueryValidation/jquery.validate.min"></script>

</head>
<body>
    <div id="root">
        <header id="header">
            <div id="header_box">
                <%@include file="../includes/restaurant/header.jsp"%>

            </div>
        </header>

        <nav id="nav">
            <div id="nav_box">
                <%@include file="../includes/restaurant/nav.jsp"%>
            </div>
        </nav>
        
        <section id="container">
            <div id="container_box">
            
                <section id="content">
                    <ul>
                        <c:forEach items="${restCateList}" var="restCateList">
                            <li>
                                <div class="thumb">
                                    <img src="${restCateList.restThumbImg}">
                                </div>
                                <div class="name">
                                    <a href="/restaurant/menu_list?restNo=${restCateList.restNo}">${restCateList.restName}</a>
                                </div>
                                <div class="ph">전화번호: ${restCateList.restPh}</div>
                                <div class="time">영업시간: ${restCateList.restPh}</div>
                                <div class="address">주소: ${restCateList.restAddress} 
                                    ${restCateList.restDetailaddress}</div>
                            </li>
                        </c:forEach>
                    </ul>
                </section>
                
                <aside id="aside">
                    <%@ include file="../includes/restaurant/aside.jsp" %>
                </aside>
                
            </div>
        </section>

        <footer id="footer">
            <div id="footer_box">
                <%@ include file="../includes/restaurant/footer.jsp" %>
            </div>		
        </footer>
    </div>
</body>
</html>
