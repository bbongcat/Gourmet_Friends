<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/css/restaurant.css">
    <script src="/vendor/jQueryValidation/jquery.validate.min"></script>

    <style>
        section#content ul li { display:inline-block; margin:10px; }
        section#content div.restThumb img { width:200px; height:200px; }
        section#content div.restName { padding:10px 0; text-align:center; }
        section#content div.restName a { color:#000; }
    </style>

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
                        <C:ForEach items="${restCateList}" var="restCateList">
                            <li>
                                <div class="restThumb">
                                    <img src="${restCateList.restThumbImg}">
                                </div>
                                <div class="restName">
                                    <a href="/restaurant/rest_list?restNo=${restCateList.restNo}">${restCateList.restName}</a>
                                </div>
                            </li>
                        </C:ForEach>
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
