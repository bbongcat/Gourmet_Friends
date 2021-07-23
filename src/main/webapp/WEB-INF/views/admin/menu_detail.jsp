<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/admin/header.jsp" %>

<section id="gtco-contact-form" class="bg-white">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <article class="col-md-8 offset-md-2 contact-form-holder mt-4">

                    <h3>메뉴 상세 페이지</h3>
                    <br>

                    <span>메뉴 번호 > ${menuInfo.restNo}</span>
                    <br>
                    <br>

                    <div>
                        <span class="lnr lnr-dinner"></span>&nbsp;
                        <span>메뉴명 : ${menuInfo.menuName}</span>
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-store"></span>&nbsp;
                        <span>음식점 : ${menuInfo.restName}</span>
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-layers"></span>&nbsp;
                        <span>가격 : ${menuInfo.menuPrice}</span>
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-bullhorn"></span>&nbsp;
                        <span>메뉴 소개 :</span><br>
                        ${menuInfo.menuIntro}
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-picture"></span>&nbsp;
                        <span>메뉴 이미지</span><br>
                        <img src="${menuInfo.menuImg}" class="oriImg">
                    </div>
                    <br>

                    <div class="btn_section">
                        <button id="cancelBtn" type="button" class="btn btn-brown">목록</button>
                        <button id="modifyBtn" type="button" class="btn btn-brown">수정</button>
                    </div>

                    <form id="moveForm" action="/admin/menu_manage" method="GET">
                        <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
                        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                    </form>
                </article>
            </div>
        </div>
    </div>
</section>

<%@include file="../includes/admin/footer.jsp" %>

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

    $("#cancelBtn").on("click", function (e) {
        e.preventDefault();
        $("#moveForm").submit();
    });

    $("#modifyBtn").on("click", function (e) {
        e.preventDefault();
        let addInput = '<input type="hidden" name="menuNo" value="${menuInfo.menuNo}">';
        $("#moveForm").append(addInput);
        $("#moveForm").attr("action", "/admin/menu_modify");
        $("#moveForm").submit();
    });

</script>

</body>
</html>