<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gourmet Friends</title>

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
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Restaurant</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/review/rev_list">Review</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/food_friends/ff_list">Food Friends</a>
                        </li>
                        <c:if test="${sessionScope.loginUser == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="/user/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/user/sign_up">sign-up </a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.loginUser != null}">
                            <c:if test="${loginUser.userAuth == 'ADMIN'}">
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/manager">Admin</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="#">${loginUser.userName} Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Settings</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/user/logout">Logout</a>
                            </li>
                        </c:if>
                        <!--  이름, 등급, 권한 뜨게 (메인페이지에 넣어서 안 이쁠 경우 게시판 들어갔을때만 보이게)  -->
                    </ul>
                </div>
            </div>
        </nav>
    </nav>
        <%--<ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>

                <c:if test="${sessionScope.loginUser == null}">
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/user/login"><i class="fa fa-gear fa-fw"></i> Login </a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/user/sign_up"><i class="fa fa-sign-out fa-fw"></i> sign-up </a>
                        </li>
                    </ul>
                </c:if>

                <c:if test="${sessionScope.loginUser != null}">
                    <ul class="dropdown-menu dropdown-user">
                        <c:if test="${loginUser.userAuth == 'ADMIN'}">
                            <li><a href="/admin/manager">관리자 페이지</a></li>
                        </c:if>
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> ${loginUser.name} Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/user/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </c:if>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->--%>

<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>