<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>


<nav id="nav">
    <div id="nav_box">
        <%@include file="../includes/restaurant/nav.jsp" %>
    </div>
</nav>

<section id="container">
    <div id="container_box">

        <section id="content">
            <ul>
                <c:forEach items="${restMenuList}" var="restMenuList">
                    <li>
                        <div class="thumb">
                            <img src="${restMenuList.menuThumbImg}">
                        </div>
                        <div class="name">${restMenuList.menuName}</div>
                        <div class="price">가격: ${restMenuList.menuPrice}</div>
                        <div class="intro">소개: ${restMenuList.menuIntro}</div>
                    </li>
                </c:forEach>
            </ul>
        </section>

        <aside id="aside">
            <%@ include file="../includes/restaurant/aside.jsp" %>
        </aside>

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