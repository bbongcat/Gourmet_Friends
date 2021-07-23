<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin/header.jsp" %>


<div class="jumbotron d-flex align-items-center">
    <div class="container">
        <div class="section-content">

            <div class="row">
                <div class="col-md-8 offset-md-2 contact-form-holder mt-4">
                    <form id="modifyForm" action="/admin/rest_modify" method="POST" enctype="multipart/form-data">

                        <h3>음식점 수정</h3>
                        <br><br>

                        <span>음식점 번호 > ${restInfo.restNo}</span>
                        <br>
                        <br>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 카테고리</label>
                            </div>
                            <div class="form_section_content">
                                <div class="cate_wrap">
                                    <span>대분류</span>
                                    <select class="cate1">
                                        <option selected value="none">선택</option>
                                    </select>
                                </div>
                                <div class="cate_wrap">
                                    <span>중분류</span>
                                    <select class="cate2">
                                        <option selected value="none">선택</option>
                                    </select>
                                </div>
                                <div class="cate_wrap">
                                    <span>소분류</span>
                                    <select class="cate3" name="cateCode">
                                        <option selected value="none">선택</option>
                                    </select>
                                </div>
                                <%--                                <span class="warn_cateCode">카테고리를 선택해주세요</span>--%>
                            </div>
                        </div>
                        <br>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 이름</label>
                            </div>
                            <div class="form_section_content">
                                <input class="input_block" name="restName"
                                       value="<c:out value='${restInfo.restName}'></c:out>">
                                <%--                                <span id="warn_restName">음식점 이름을 입력해주세요.</span>--%>
                            </div>
                        </div>
                        <br>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 전화번호</label>
                            </div>
                            <div class="form_section_content">
                                <input class="input_block" name="restPh"
                                       value="<c:out value='${restInfo.restPh}'></c:out>">
                                <%--                                <span id="warn_restPh">음식점 전화번호를 입력해주세요.</span>--%>
                            </div>
                        </div>
                        <br>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 영업시간</label>
                            </div>
                            <div class="form_section_content">
                                <input class="input_block" name="restTime"
                                       value="<c:out value='${restInfo.restTime}'></c:out>">
                                <%--                                <span id="warn_restTime">음식점 영업시간을 입력해주세요.</span>--%>
                            </div>
                        </div>
                        <br>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 주소</label>
                            </div>
                            <div class="form_section_content">
                                <input type="text" class="form-control" placeholder="우편번호" name="restOaddress"
                                       id="restOaddress" readonly>
                            </div>
                            <button type="button" class="btn btn-default" onclick='execPostCode();'>
                                <i class="fa fa-search"></i>우편번호 찾기
                            </button>
                        </div>

                        <div class="form_section">
                            <div class="form_section_content">
                                <br>
                                <input type="text" class="form-control" placeholder="도로명 주소" name="restAddress"
                                       id="restAddress"
                                       readonly>
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_content">
                                <input type="text" class="form-control" placeholder="상세주소" name="restDetailaddress"
                                       id="restDetailaddress">
                                <%--                                <span id="warn_restDetailaddress">음식점 상세주소를 입력해주세요.</span>--%>
                            </div>
                        </div>
                        <br>

                        <%--<div class="form_section">
                            <div class="form_section_title">
                                <label>음식점 주소</label>
                            </div>
                            <div class="form_section_content">
                                <input class="input_block" name="restOaddress" readonly
                                       value="<c:out value='${restInfo.restOaddress}'></c:out>">
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_content">
                                <input class="input_block" name="restAddress" readonly
                                       value="<c:out value='${restInfo.restAddress}'></c:out>">
                            </div>
                        </div>

                        <div class="form_section">
                            <div class="form_section_content">
                                <input class="input_block" name="restDetailaddress"
                                       value="<c:out value='${restInfo.restDetailaddress}'></c:out>">
                                <span id="warn_restDetailaddress">음식점 상세주소를 입력해주세요.</span>
                            </div>
                        </div>--%>

                        <div class="form_section">
                            <div class="form_section_title">
                                <label for="restImg">음식점 메인 이미지</label>
                                <br>
                                <input type="file" id="restImg" name="file">
                            </div>
                            <div class="select_img">
                                <img src="${restInfo.restImg}">
                                <input type="hidden" name="restImg" value="${restInfo.restImg}">
                                <input type="hidden" name="restThumbImg" value="${restInfo.restThumbImg}">
                            </div>
                        </div>
                        <br>
                        <br>

                        <div class="btn_section">
                            <button id="cancelBtn" type="button" class="btn btn-brown">취소</button>
                            <button id="modifyBtn" type="button" class="btn btn-brown">수정</button>
                            <button id="deleteBtn" type="button" class="btn btn-brown">삭제</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<form id="moveForm" method="GET">
    <input type="hidden" name="restNo" value='<c:out value="${restInfo.restNo}"/>'>
    <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
</form>

<%@include file="../includes/admin/footer.jsp" %>


<script>

    //우편번호 찾기
    function execPostCode() {
        daum.postcode.load(function () {

            new daum.Postcode({
                oncomplete: function (data) {
                    //팝업에서 검색결과 항목을 클릭했을 때 실행 할 코드를 작성하는 부분

                    //도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    //내려오는 변수가 값이 없는 경우엔 공백('') 값을 가지므로, 이를 참고하여 분기 한다.
                    let fullRoadAddr = data.roadAddress;//도로명 주소 변수
                    let extraRoadAddr = '';//도로명 조합형 주소 변수

                    //법정동명이 있을 경우 추가한다.(법정리는 제외)
                    //법정동의 경우 마지막 문자가 '동/로/가'로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    //건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    //도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ') ';
                    }
                    //도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }

                    //우편번호와 주소정보를 해당필드에 넣는다.
                    console.log(data.zonecode);
                    console.log(fullRoadAddr);

                    $('[name=restOaddress]').val(data.zonecode);
                    $('[name=restAddress]').val(fullRoadAddr);

                    document.getElementById('restOaddress').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('restAddress').value = fullRoadAddr;

                }
            }).open();
        });
    }


    let moveForm = $('#moveForm');
    let modifyForm = $('#modifyForm');

    //음식점 관리 페이지 이동 버튼
    $("#cancelBtn").on("click", function (e) {
        e.preventDefault();
        moveForm.attr("action", "/admin/rest_detail");
        moveForm.submit();
    });

    //음식점 삭제
    $("#deleteBtn").on("click", function (e) {
        e.preventDefault();
        moveForm.find("input").remove();
        moveForm.append('<input type="hidden" name="restNo" value="${restInfo.restNo}">');
        moveForm.attr("action", "/admin/rest_delete");
        moveForm.attr("method", "post");
        moveForm.submit();
    });

    //음식점 수정 페이지 이동 버튼 & 유효성 검사
    $("#modifyBtn").on("click", function (e) {
        let restName = $(".form_section_content input[name='restName']").val();
        let restPh = $(".form_section_content input[name='restPh']").val();
        let restTime = $(".form_section_content input[name='restTime']").val();
        let restAddress = $(".form_section_content input[name='restDetailaddress']").val();
        let cateCode = $(".form_section_content select[name='cateCode']").val();

        let nameCheck = false;
        let phCheck = false;
        let timeCheck = false;
        let addressCheck = false;
        let cateCodeCheck = false;

        e.preventDefault();

        if (!restName) {
            $('#warn_restName').css('display', 'block');
        } else {
            $('#warn_restName').css('display', 'none');
            nameCheck = true;
        }

        if (!restPh) {
            $('#warn_restPh').css('display', 'block');
        } else {
            $('#warn_restPh').css('display', 'none');
            phCheck = true;
        }

        if (!restTime) {
            $('#warn_restTime').css('display', 'block');
        } else {
            $('#warn_restTime').css('display', 'none');
            timeCheck = true;
        }

        if (!restAddress) {
            $('#warn_restDetailaddress').css('display', 'block');
        } else {
            $('#warn_restDetailaddress').css('display', 'none');
            addressCheck = true;
        }

        if (!cateCode) {
            $('#warn_cateCode').css('display', 'block');
        } else {
            $('#warn_cateCode').css('display', 'none');
            cateCodeCheck = true;
        }

        if (nameCheck && phCheck && timeCheck && addressCheck && cateCodeCheck) {
            modifyForm.submit();
        } else {
            return false;
        }


    });

    $(document).ready(function () {
        /* 카테고리 */
        let cateList = JSON.parse('${cateList}');

        let cate1Array = new Array();
        let cate2Array = new Array();
        let cate3Array = new Array();
        let cate1Obj = new Object();
        let cate2Obj = new Object();
        let cate3Obj = new Object();

        let cateSelect1 = $(".cate1");
        let cateSelect2 = $(".cate2");
        let cateSelect3 = $(".cate3");

        /* 카테고리 배열 초기화 메서드 */
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

        /* 배열 초기화 */
        makeCateArray(cate1Obj, cate1Array, cateList, 1);
        makeCateArray(cate2Obj, cate2Array, cateList, 2);
        makeCateArray(cate3Obj, cate3Array, cateList, 3);


        let targetCate2 = '';
        let targetCate3 = '${restInfo.cateCode}';

        /* 소분류 */
        for (let i = 0; i < cate3Array.length; i++) {
            if (targetCate3 === cate3Array[i].cateCode) {
                targetCate3 = cate3Array[i];
            }
        }

        for (let i = 0; i < cate3Array.length; i++) {
            if (targetCate3.cateParent === cate3Array[i].cateParent) {
                cateSelect3.append("<option value='" + cate3Array[i].cateCode + "'>" + cate3Array[i].cateName + "</option>");
            }
        }

        $(".cate3 option").each(function (i, obj) {
            if (targetCate3.cateCode === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });

        /* 중분류 */
        for (let i = 0; i < cate2Array.length; i++) {
            if (targetCate3.cateParent === cate2Array[i].cateCode) {
                targetCate2 = cate2Array[i];
            }
        }

        for (let i = 0; i < cate2Array.length; i++) {
            if (targetCate2.cateParent === cate2Array[i].cateParent) {
                cateSelect2.append("<option value='" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
            }
        }

        $(".cate2 option").each(function (i, obj) {
            if (targetCate2.cateCode === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });


        /* 대분류 */
        for (let i = 0; i < cate1Array.length; i++) {
            cateSelect1.append("<option value='" + cate1Array[i].cateCode + "'>" + cate1Array[i].cateName + "</option>");
        }

        $(".cate1 option").each(function (i, obj) {
            if (targetCate2.cateParent === obj.value) {
                $(obj).attr("selected", "selected");
            }
        });
    });

</script>

<script>
    $(document).ready(function () {

        /* 카테고리 */
        let cateList = JSON.parse('${cateList}');

        let cate1Array = new Array();
        let cate2Array = new Array();
        let cate3Array = new Array();
        let cate1Obj = new Object();
        let cate2Obj = new Object();
        let cate3Obj = new Object();

        let cateSelect1 = $(".cate1");
        let cateSelect2 = $(".cate2");
        let cateSelect3 = $(".cate3");

        /* 카테고리 배열 초기화 메서드 */
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

        /* 배열 초기화 */
        makeCateArray(cate1Obj, cate1Array, cateList, 1);
        makeCateArray(cate2Obj, cate2Array, cateList, 2);
        makeCateArray(cate3Obj, cate3Array, cateList, 3);


        /* 중분류 <option> 태그 */
        $(cateSelect1).on("change", function () {

            let selectVal1 = $(this).find("option:selected").val();

            cateSelect2.children().remove();
            cateSelect3.children().remove();

            cateSelect2.append("<option value='none'>선택</option>");
            cateSelect3.append("<option value='none'>선택</option>");

            for (let i = 0; i < cate2Array.length; i++) {
                if (selectVal1 === cate2Array[i].cateParent) {
                    cateSelect2.append("<option value='" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
                }
            }// for

        });

        /* 소분류 <option>태그 */
        $(cateSelect2).on("change", function () {

            let selectVal2 = $(this).find("option:selected").val();

            cateSelect3.children().remove();

            cateSelect3.append("<option value='none'>선택</option>");

            for (let i = 0; i < cate3Array.length; i++) {
                if (selectVal2 === cate3Array[i].cateParent) {
                    cateSelect3.append("<option value='" + cate3Array[i].cateCode + "'>" + cate3Array[i].cateName + "</option>");
                }
            }

        });
    });

    //음식점 메인 이미지
    $("#restImg").change(function () {
        if (this.files && this.files[0]) {
            let reader = new FileReader;
            reader.onload = function (data) {
                $(".select_img img").attr("src", data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
</script>