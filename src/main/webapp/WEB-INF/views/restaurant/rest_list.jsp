<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


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

<%@include file="../includes/footer.jsp" %>