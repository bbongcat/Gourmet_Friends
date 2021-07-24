<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


<div class="jumbotron d-flex align-items-center" style="background-image: url(/img/blog-1.jpg);">
    <div class="container text-center">
        <h1 class="display-2 mb-4 eng-font-title" style="color: #FFFFFF;
background: transparent;
text-shadow: #FFF 0px 0px 5px, #FFF 0px 0px 10px, #FFF 0px 0px 15px, #FF2D95 0px 0px 20px, #FF2D95 0px 0px 30px, #FF2D95 0px 0px 40px, #FF2D95 0px 0px 50px, #FF2D95 0px 0px 75px;">
            Restaurant</h1>
    </div>
</div>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">

                    <ul style="padding: 0;">
                        <c:forEach items="${restCateList}" var="restCateList">
                            <li class="rest-list">
                                <div class="detail-title">
                                    <a href="/restaurant/menu_list?restNo=${restCateList.restNo}">${restCateList.restName}</a>
                                </div>
                                <div>
                                    <span class="lnr lnr-phone-handset"></span>&nbsp;
                                    <span>전화번호 : ${restCateList.restPh}</span>
                                </div>
                                <div>
                                    <span class="lnr lnr-clock"></span>&nbsp;
                                    <span>영업시간 : ${restCateList.restTime}</span>
                                </div>
                                <div>
                                    <span class="lnr lnr-map-marker"></span>&nbsp;
                                    <span>주소 : ${restCateList.restAddress} ${restCateList.restDetailaddress}</span>
                                </div>
                                <br>
                                <div>
                                    <img src="${restCateList.restImg}" class="oriImg">
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <br>
                    <br>

                    <aside id="aside">
                        <%@ include file="../includes/restaurant/aside.jsp" %>
                    </aside>

                </article>
            </div>
        </div>
    </div>
</section>

<%@include file="../includes/footer.jsp" %>