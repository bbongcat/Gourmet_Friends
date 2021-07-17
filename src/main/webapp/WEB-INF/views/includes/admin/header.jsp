<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <style>
        @font-face {
            font-family: 'Caviar Dreams';
            font-style: normal;
            font-weight: 300;
            src: local('Caviar Dreams'), url('https://fonts.cdnfonts.com/s/77/CaviarDreams.woff') format('woff');
        }

    </style>

    <!-- External CSS -->
    <link rel="stylesheet" href="/vendor/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/vendor/select2/select2.min.css">
    <link rel="stylesheet" href="/vendor/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/vendor/lightcase/lightcase.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Work+Sans:300,400,700" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
          rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/style.min.css">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link href="https://file.myfontastic.com/7vRKgqrN3iFEnLHuqYhYuL/icons.css" rel="stylesheet">

<%--    <link rel="stylesheet" href="/css/admin/rest_manage.css">--%>

    <!-- Modernizr JS for IE8 support of HTML5 elements and media queries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="/vendor/jQueryValidation/jquery.validate.min"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- 우편주소  -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>

</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">

<div class="boxed-page">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

        <nav id="gtco-header-navbar" class="navbar navbar-expand-lg py-4">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="/main">
                    <span class="title-logo">Gourmet Friends</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-nav-header"
                        aria-controls="navbar-nav-header" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="lnr lnr-menu"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar-nav-header">
                    <ul class="navbar-nav ml-auto k-font">
                        <li class="nav-item">
                            <a class="nav-link" href="/main">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/menu_insert">메뉴 등록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/menu_manage">메뉴 관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/rest_insert">음식점 등록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/rest_manage">음식점 관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/logout">Logout</a>
                        </li>

                        <%--<!-- 로그인 하지 않은 상태 -->
                        <c:if test="${sessionScope.loginUser == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="/user/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/user/sign_up">sign-up </a>
                            </li>
                        </c:if>--%>

                    </ul>
                </div>
            </div>
        </nav>
    </nav>
<%--

    <div class="wrapper">
        <div class="wrap">
            <!-- gnb_area -->
            <div class="top_gnb_area">
                <ul class="list">
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="/user/logout">로그아웃</a></li>
                    <li>고객센터</li>
                </ul>
            </div>

            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
            </div>

            <!-- contents_area -->
            <div class="admin_wrap">
                <!-- navi_area -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li>
                            <a href="/admin/menu_insert" class="admin_list_01">메뉴 등록</a>
                        </li>
                        <li>
                            <a href="/admin/menu_manage" class="admin_list_02">메뉴 관리</a>
                        </li>
                        <li>
                            <a href="/admin/rest_insert" class="admin_list_03">음식점 등록</a>
                        </li>
                        <li>
                            <a href="/admin/rest_manage" class="admin_list_04">음식점 관리</a>
                        </li>
                        <li>
                            <a class="admin_list_05">회원 관리</a>
                        </li>
                    </ul>
                </div>
          --%>
