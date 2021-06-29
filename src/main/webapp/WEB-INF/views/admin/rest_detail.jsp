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

    <link rel="stylesheet" href="/css/admin/rest_detail.css">
    <script src="/vendor/jQueryValidation/jquery.validate.min"></script>

</head>
<body>
    <%@include file="../includes/admin/header.jsp"%>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>음식점 상세</span></div>
            <div class="admin_content_main">

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 번호</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restNo" readonly value="<c:out value='${restInfo.restNo}'></c:out>">
                    </div>
                </div>
                
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 카테고리</label>
                    </div>
                    <div class="form_section_content">
                        <div class="cate_wrap">
                            <span>대분류</span>
                            <select class="cate1" disabled>
                                <option value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>중분류</span>
                            <select class="cate2" disabled>
                                <option value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>소분류</span>
                            <select class="cate3" name="cateCode" disabled>
                                <option value="none">선택</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 이름</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restName" readonly value="<c:out value='${restInfo.restName}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 전화번호</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restPh" readonly value="<c:out value='${restInfo.restPh}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 영업시간</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restTime" readonly value="<c:out value='${restInfo.restTime}'></c:out>">
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>음식점 주소</label>
                    </div>
                    <div class="form_section_content">
                        <input class="input_block" name="restOaddress" readonly value="<c:out value='${restInfo.restOaddress}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_content">
                        <input class="input_block" name="restAddress" readonly value="<c:out value='${restInfo.restAddress}'></c:out>">
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_content">
                        <input class="input_block" name="restDetailaddress" readonly value="<c:out value='${restInfo.restDetailaddress}'></c:out>">
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label for="restImg">음식점 메인 이미지</label>
                    </div>
                    <p>원본 이미지</p>
                    <img src="${restInfo.restImg}" class="oriImg">

                    <p>썸네일</p>
                    <img src="${restInfo.restThumbImg}" class="thumbImg">
                </div>

                <div class="btn_section">
                    <button id="cancelBtn" class="btn">음식점 목록</button>
                    <button id="modifyBtn" class="btn modify_btn">수 정</button>
                </div>

            </div>
        </div>
        <form id="moveForm" action="/admin/rest_manage" method="GET">
            <input type="hidden" name="restNo" value='<c:out value="${restInfo.restNo}"/>'>
            <input type="hidden" name="page" value='<c:out value="${cri.page}"/>'>
            <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
            <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
        </form>
        
    <%@include file="../includes/admin/footer.jsp"%>


    <script>
        let moveForm = $('#moveForm');

        //음식점 관리 페이지 이동 버튼 
        $("#cancelBtn").on("click",function(e){
            e.preventDefault();
            $("input[name=restNo]").remove();
            moveForm.attr("action","/admin/rest_manage");
            moveForm.submit();
        });

        //음식점 수정 페이지 이동 버튼 
        $("#modifyBtn").on("click",function(e){
            e.preventDefault();
            moveForm.attr("action","/admin/rest_modify");
            moveForm.submit();
        });

        $(document).ready(function(){
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

            function makeCateArray(obj, array, cateList, tier){
                for(let i = 0; i < cateList.length; i++ ){
                    if(cateList[i].tier === tier){
                        obj = new Object();

                        obj.cateName = cateList[i].cateName;
                        obj.cateCode = cateList[i].cateCode;
                        obj.cateParent = cateList[i].cateParent;

                        array.push(obj);
                    }
                }
            }

            makeCateArray(cate1Obj,cate1Array,cateList,1);
            makeCateArray(cate2Obj,cate2Array,cateList,2);
            makeCateArray(cate3Obj,cate3Array,cateList,3);

            let targetCate2 = '';
            let targetCate3 = '${restInfo.cateCode}';

            for(let i = 0; i < cate3Array.length; i++){
                if(targetCate3 === cate3Array[i].cateCode){
                    targetCate3 = cate3Array[i];
                }
            }

            for(let i = 0; i < cate3Array.length; i++){
                if(targetCate3.cateParent === cate3Array[i].cateParent){
                    cateSelect3.append("<option value = '" + cate3Array[i].cateCode + "'>" + cate3Array[i].cateName + "</option>");
                }
            }

            $(".cate3 option").each(function(i,obj){
                if(targetCate3.cateCode === obj.value){
                    $(obj).attr("selected","selected");
                }
            });

            for(let i = 0; i < cate2Array.length; i++){
                if(targetCate2.cateParent === cate2Array[i].cateParent){
                    cateSelect2.append("<option value = '" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
                }
            }

            $(".cate2 option").each(function(i,obj){
                if(targetCate2.cateCode === obj.value){
                    $(obj).attr("selected","selected");
                }
            });

            for(let i = 0; i < cate1Array.length; i++){
                
                    cateSelect1.append("<option value = '" + cate1Array[i].cateCode + "'>" + cate1Array[i].cateName + "</option>");
                
            }

            $(".cate1 option").each(function(i,obj){
                if(targetCate2.cateParent === obj.value){
                    $(obj).attr("selected","selected");
                }
            });
        });

    </script>
    
</body>
</html>