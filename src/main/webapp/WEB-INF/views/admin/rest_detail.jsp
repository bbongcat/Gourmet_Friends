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

                    <h3>음식점 상세 페이지</h3>
                    <br>

                    <span>음식점 번호 > ${restInfo.restNo}</span><br>
                    <span>카테고리 > ${restInfo.cateName}</span>

                    <div class="detail-title">
                        <span>${restInfo.restName}</span>
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-phone-handset"></span>&nbsp;
                        <span>전화번호 : ${restInfo.restPh}</span>
                   </div>
                    <br>

                    <div>
                        <span class="lnr lnr-clock"></span>&nbsp;
                        <span>영업시간 : ${restInfo.restTime}</span>
                    </div>
                    <br>

                    <div>
                        <span class="lnr lnr-map-marker"></span>&nbsp;
                        <span>주소 : (${restInfo.restOaddress}) ${restInfo.restAddress} ${restInfo.restDetailaddress}</span>
                    </div>
                    <br>

                    <div>
                        <img src="${restInfo.restImg}" class="oriImg">
                    </div>

                    <div class="btn_section">
                        <button id="cancelBtn" type="button" class="btn btn-brown">목록</button>
                        <button id="modifyBtn" type="button" class="btn btn-brown">수정</button>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<form id="moveForm" action="/admin/rest_manage" method="GET">
    <input type="hidden" name="restNo" value='<c:out value="${restInfo.restNo}"/>'>
    <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
</form>

<%@include file="../includes/admin/footer.jsp" %>


<script>
    let moveForm = $('#moveForm');

    //음식점 관리 페이지 이동 버튼
    $("#cancelBtn").on("click", function (e) {
        e.preventDefault();
        $("input[name=restNo]").remove();
        moveForm.attr("action", "/admin/rest_manage");
        moveForm.submit();
    });

    //음식점 수정 페이지 이동 버튼
    $("#modifyBtn").on("click", function (e) {
        e.preventDefault();
        moveForm.attr("action", "/admin/rest_modify");
        moveForm.submit();
    });

    $(document).ready(function () {
        let cateList = JSON.parse('${cateList}');

        let cate1Array = new Array();
        let cate2Array = new Array();
        let cate3Array = new Array();
        let cate1Obj = new Object();
        let cate2Obj = new Object();
        let cate3Obj = new Object();

        let cateSelect1 = $('.cate1');
        let cateSelect2 = $('.cate2');
        let cateSelect3 = $('.cate3');

        function makeCateArray(obj, array, cateList, tier) {
            for (let i = 0; i < cateList.length; i++) {
                if (cateList[i].tier === tier) {
                    obj = new Object();

                    obj.cateName = cateList[i].cateName;
                    obj.cateCode = cateList[i].cateCode;
                    obj.cateParent = cateList[i].cateParent;

                    array.push(obj);
                }
            }
        }

        makeCateArray(cate1Obj, cate1Array, cateList, 1);
        makeCateArray(cate2Obj, cate2Array, cateList, 2);
        makeCateArray(cate3Obj, cate3Array, cateList, 3);

        let targetCate2 = '';
        let targetCate3 = '${restInfo.cateCode}';

        for (let i = 0; i < cate3Array.length; i++) {
            if (targetCate3 === cate3Array[i].cateCode) {
                targetCate3 = cate3Array[i];
            }
        }

        for (let i = 0; i < cate3Array.length; i++) {
            if (targetCate3.cateParent === cate3Array[i].cateParent) {
                cateSelect3.append("<option value = '" + cate3Array[i].cateCode + "'>" + cate3Array[i].cateName + "</option>");
            }
        }

        $(".cate3 option").each(function (i, obj) {
            if (targetCate3.cateCode === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });

        for (let i = 0; i < cate2Array.length; i++) {
            if (targetCate2.cateParent === cate2Array[i].cateParent) {
                cateSelect2.append("<option value = '" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
            }
        }

        $(".cate2 option").each(function (i, obj) {
            if (targetCate2.cateCode === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });

        for (let i = 0; i < cate1Array.length; i++) {

            cateSelect1.append("<option value = '" + cate1Array[i].cateCode + "'>" + cate1Array[i].cateName + "</option>");

        }

        $(".cate1 option").each(function (i, obj) {
            if (targetCate2.cateParent === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });
    });

</script>

</body>
</html>