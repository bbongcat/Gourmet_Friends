<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/css/restaurant.css">
    <script src="/vendor/jquery/jquery.min.js"></script>

</head>
<body>
    <div id="root">
        <header id="header">
            <div id="header_box">
                <%@include file="includes/restaurant/header.jsp"%>

            </div>
        </header>

        <nav id="nav">
            <div id="nav_box">
                <%@include file="includes/restaurant/nav.jsp"%>
            </div>
        </nav>
        
        <section id="container">
            <div id="container_box">
            
                <section id="content">
                  본문 영역
                </section>
                
                <aside id="aside">
                    <%@ include file="includes/restaurant/aside.jsp" %>
                </aside>
                
            </div>
        </section>

        <footer id="footer">
            <div id="footer_box">
                <%@ include file="includes/restaurant/footer.jsp" %>
            </div>		
        </footer>
    </div>
</body>
</html>
