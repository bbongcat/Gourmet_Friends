<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <ul class="menu-wrap">
                        <c:forEach items="${restMenuList}" var="restMenuList">
                            <li class="menu-list">
                                <div>
                                    <span class="lnr lnr-dinner"></span>&nbsp;
                                    <span>메뉴명 : ${restMenuList.menuName}</span>
                                </div>
                                <div>
                                    <span class="lnr lnr-layers"></span>&nbsp;
                                    <span>가격 : ${restMenuList.menuPrice}원</span>
                                </div>
                                <div>
                                    <span class="lnr lnr-bullhorn"></span>&nbsp;
                                    <span>메뉴 소개 :</span><br>
                                        ${restMenuList.menuIntro}
                                </div>
<%--                                <div class="name">${restMenuList.menuName}</div>--%>
<%--                                <div class="price">가격: ${restMenuList.menuPrice}</div>--%>
<%--                                <div class="intro">소개: ${restMenuList.menuIntro}</div>--%>
                            </li>
                        </c:forEach>
                    </ul>

                    <aside id="aside">
                        <%@ include file="../includes/restaurant/aside.jsp" %>
                    </aside>
                </article>
            </div>
        </div>
    </div>
</section>

                    <script>
                        $(document).ready(function () {

                            // 메뉴 소개
                            ClassicEditor
                                .create(document.querySelector('#menuIntro_textarea'))
                                .then(editor => {
                                    console.log(editor);
                                    editor.isReadOnly = true;
                                })
                                .catch(error => {
                                    console.error(error);
                                });

                        });
                    </script>

<%@include file="../includes/footer.jsp" %>