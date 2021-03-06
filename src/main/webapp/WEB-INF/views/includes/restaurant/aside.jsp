<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <nav> --%>
<h3 style="display:flex; margin-bottom: 20px; justify-content:center; align-items: center;">Category</h3>

<ul class="cate-tier1">
    <li><a href="/restaurant/rest_list?c=100000&l=1" style="margin-bottom: 30px;">음식점업</a>

        <ul class="cate-tier2">
            <li>
                <span class="lnr lnr-chevron-down">&nbsp;</span>
                <a href="/restaurant/rest_list?c=101000&l=2">일반 음식점</a>

                <ul class="cate-tier3">
                    <li><a href="/restaurant/rest_list?c=101001&l=3">한식</a></li>
                    <li><a href="/restaurant/rest_list?c=101002&l=3">중식</a></li>
                    <li><a href="/restaurant/rest_list?c=101003&l=3">일식</a></li>
                    <li><a href="/restaurant/rest_list?c=101004&l=3">양식</a></li>
                    <li><a href="/restaurant/rest_list?c=101005&l=3">기타 외국식</a></li>
                </ul>

            </li>

            <li>
                <span class="lnr lnr-chevron-down">&nbsp;</span>
                <a href="/restaurant/rest_list?c=102000&l=2">기타 음식</a>

                <ul class="cate-tier3">
                    <li><a href="/restaurant/rest_list?c=102001&l=3">제과점</a></li>
                    <li><a href="/restaurant/rest_list?c=102002&l=3">피자, 햄버거, 샌드위치</a></li>
                    <li><a href="/restaurant/rest_list?c=102003&l=3">치킨</a></li>
                    <li><a href="/restaurant/rest_list?c=102004&l=3">분식</a></li>
                    <li><a href="/restaurant/rest_list?c=102005&l=3">그 외 기타</a></li>
                </ul>
            </li>
        </ul>
    </li>

    <li>
        <a href="/restaurant/rest_list?c=200000&l=1"  style="margin-top: 30px;">주점 및 비알콜음료점업</a>

        <ul class="cate-tier2">
            <li>
                <span class="lnr lnr-chevron-down">&nbsp;</span>
                <a href="/restaurant/rest_list?c=201000&l=2">주점</a>

                <ul class="cate-tier3">
                    <li><a href="/restaurant/rest_list?c=201001&l=3">일반 유흥</a></li>
                    <li><a href="/restaurant/rest_list?c=201002&l=3">무도 유흥</a></li>
                    <li><a href="/restaurant/rest_list?c=201003&l=3">기타 유흥</a></li>
                </ul>
            </li>

            <li>
                <span class="lnr lnr-chevron-down">&nbsp;</span>
                <a href="/restaurant/rest_list?c=202000&l=2">비알콜음료점업</a>

                <ul class="cate-tier3">
                    <li><a href="/restaurant/rest_list?c=202001&l=3">카페</a></li>
                </ul>
            </li>
        </ul>
    </li>
</ul>
<%-- </nav> --%>

<script>


</script>