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
    <nav id="gtco-header-navbar" class="navbar navbar-expand-lg py-4">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <span class="title-logo">Gourmet Friends</span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-nav-header"
                    aria-controls="navbar-nav-header" aria-expanded="false" aria-label="Toggle navigation">
                <span class="lnr lnr-menu"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar-nav-header">
                <ul class="navbar-nav ml-auto k-font">
                    <li class="nav-item">
                        <a class="nav-link" href="/main/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Restaurant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Review</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/food_friends/ff_list/">Food Friends</a>
                    </li>

                    <!-- 로그인 하지 않은 상태 -->
                    <c:if test="${loginUser == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="/user/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/sign_up">Sign-up</a>
                        </li>
                    </c:if>

                    <!-- 로그인한 상태 -->
                    <c:if test="${loginUser != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="/user/logout">Logout</a>
                        </li>
                        <li class="nav-item">
                            <span class="nav-link">회원 : ${loginUser.userName}</span>
                            <span class="nav-link">회원등급 : ${loginUser.userRank}</span>
                            <span class="nav-link">회원권한 : ${loginUser.userAuth}</span>
                        </li>
                    </c:if>
                    <!--  이름, 등급, 권한 뜨게 (메인페이지에 넣어서 안 이쁠 경우 게시판 들어갔을때만 보이게)  -->
                </ul>
            </div>
        </div>
    </nav>

    <div class="jumbotron d-flex align-items-center" style="background-image: url(img/bg-5.jpg)">
        <div class="container text-center">
            <h1 class="display-2 mb-4">Gourmet ?</h1>
            <p class="k-font">
                Gourmet Friends는 미식가를 뜻하는 Gourmet과 Friends를 합쳐 만든 단어로
                <br>맛을 아는 친구들이 함께 모여 서로의 맛집 정보를 공유하는 플랫폼이 되고자 합니다.
            </p>
        </div>
    </div>

    <section id="gtco-who-we-are" class="bg-white">
        <div class="container">
            <div class="section-content">
                <div class="title-wrap">
                    <h2 class="section-title k-font-title">맛있는 음식과 <br>좋은 친구를 함께 얻는 방법</h2>
                    <p class="k-font">먹고 싶은 음식이 있어도 혼자 먹기 너무 많아 망설여졌던 기억이 있다면<br>
                        맛집을 알아도 혼밥때문에 망설여졌다면 <br>답은 <b>고메프렌즈</b>입니다.</p>
                </div>

                <div class="row text-center k-font">
                    <div class="col-md-4 col-sm-6 ">
                        <img class="" src="icons/18-location-pin-outline.gif" alt="Generic placeholder image"
                             width="120" height="120">
                        <h5 class="k-font-subtitle">내 근처의 밥친구</h5>
                        <p class="k-font">위치 기반으로 가장 가까운 곳의 밥친구를 자동 매칭하여 <br>멀리 이동할 필요가 없습니다.</p>
                    </div>
                    <!-- /.col-md-4 col-sm-6  -->
                    <div class="col-md-4 col-sm-6 ">
                        <img class="" src="icons/409-tool-outline.gif" alt="Generic placeholder image"
                             width="120" height="120">
                        <h5 class="k-font-subtitle">무엇보다도 안전</h5>
                        <p class="k-font">신고 시스템을 통해 신고가 누적된 유저는 밥친구 매칭이 불가합니다.
                            <br>유저들이 다 함께 매너있는 고메프렌즈를 만들어갑니다.</p>
                    </div>
                    <!-- /.col-md-4 col-sm-6  -->
                    <div class="col-md-4 col-sm-6 ">
                        <img class="" src="icons/13-pizza-outline.gif" alt="Generic placeholder image"
                             width="120" height="120">
                        <h5 class="k-font-subtitle">메뉴까지 추천</h5>
                        <p class="k-font">무엇을 먹을지 모르겠지만 배는 고프다면? 일단 매칭부터 받아보세요.
                            근처의 맛집까지 알아서 추천해줍니다.<br>랜덤 쿠폰은 보너스!</p>
                    </div>
                    <!-- /.col-md-4 col-sm-6  -->
                </div>
                <!-- /.row -->
            </div>
        </div>
    </section>        <!-- Counter Section -->
    <section id="gtco-counter" class="overlay bg-fixed">
        <div class="container">
            <div class="section-content">
                <div class="row">
                    <!-- Counter Item -->
                    <div class="col-md-3 col-sm-6 counter-item">
                        <i class="lnr lnr-users"></i>
                        <span class="number" data-from="0" data-to="34" data-refresh-interval="100">1,583</span>
                        <h4 class="k-font">회원</h4>
                    </div>
                    <!-- End of Counter Item -->
                    <!-- Counter Item -->
                    <div class="col-md-3 col-sm-6 counter-item">
                        <i class="lnr lnr-store"></i>
                        <span class="number" data-from="0" data-to="32" data-refresh-interval="100">620</span>
                        <h4 class="k-font">음식점</h4>
                    </div>
                    <!-- End of Counter Item -->
                    <!-- Counter Item -->
                    <div class="col-md-3 col-sm-6 counter-item">
                        <i class="lnr lnr-heart"></i>
                        <span class="number" data-from="0" data-to="38" data-refresh-interval="100">971</span>
                        <h4 class="k-font">연결된 밥친구</h4>
                    </div>
                    <!-- End of Counter Item -->
                    <!-- Counter Item -->
                    <div class="col-md-3 col-sm-6 counter-item">
                        <i class="lnr lnr-dinner"></i>
                        <span class="number" data-from="0" data-to="29" data-refresh-interval="100">3,594</span>
                        <h4 class="k-font">누적 주문 수</h4>
                    </div>
                    <!-- End of Counter Item -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of Counter Section -->

    <section id="gtco-blog" class="bg-grey">
        <div class="container">
            <div class="section-content">
                <div class="title-wrap mb-5">
                    <h2 class="section-title">Best Review</h2>
                </div>
                <div class="row">
                    <!-- Blog -->
                    <div class="col-md-12 blog-holder">
                        <div class="row">
                            <!-- Blog Item -->
                            <div class="col-md-4 blog-item-wrapper">
                                <div class="blog-item">
                                    <div class="blog-img">
                                        <a href="single.html"><img src="img/blog-1.jpg" alt=""></a>
                                    </div>
                                    <div class="blog-text">
                                        <div class="blog-tag">
                                            <a href="#"><h6><small>food friends</small></h6></a>
                                        </div>
                                        <div class="blog-title">
                                            <a href="#"><h4 class="k-font-subtitle">나와 입맛이 딱 맞는 밥친구!</h4></a>
                                        </div>
                                        <div class="blog-meta">
                                            <p class="blog-date">2021. 04. 30</p> /
                                            <p class="blog-comment"><a href="">38 Comments</a></p>
                                        </div>
                                        <div class="blog-desc k-font">
                                            <p>갑자기 저녁 약속이 취소되는 바람에 혹시나 하는 마음으로 밥친구 게시판에 글을 올렸더니
                                                10분도 안되어 매칭이 되었습니다. 고메프렌즈가 아니었다면 집 근처에 사는 맛잘알 친구를
                                                만날 기회가 절대 없었을 거에요.</p>
                                        </div>
                                        <div class="blog-author">
                                            <p>user: dwkk****</p>
                                        </div>
                                        <div class="blog-share-wrapper">
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-facebook-square"></i>
                                            </a>
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Blog Item -->
                            <!-- Blog Item -->
                            <div class="col-md-4 blog-item-wrapper">
                                <div class="blog-item">
                                    <div class="blog-img">
                                        <a href="#"><img src="img/blog-2.jpg" alt=""></a>
                                    </div>
                                    <div class="blog-text">
                                        <div class="blog-tag">
                                            <a href="#"><h6><small>order</small></h6></a>
                                        </div>
                                        <div class="blog-title">
                                            <a href="#"><h4 class="k-font-subtitle">근처 맛집을 누구보다 잘 아는 앱</h4></a>
                                        </div>
                                        <div class="blog-meta">
                                            <p class="blog-date">2021. 05. 04.</p> /
                                            <p class="blog-comment"><a href="">23 Comments</a></p>
                                        </div>
                                        <div class="blog-desc k-font">
                                            <p>배는 고픈데 어디서 주문해야 할지 고민했던 경험이 많은 저로서는
                                                고메프렌즈의 맛집 추천 시스템이 정말 딱입니다. 고민할 필요 없이 알아서 맛집을 추천해주고
                                                회원들의 리뷰까지 함께 보여주니까요!</p>
                                        </div>
                                        <div class="blog-author">
                                            <p>user: soiv****</p>
                                        </div>
                                        <div class="blog-share-wrapper">
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-facebook-square"></i>
                                            </a>
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Blog Item -->
                            <!-- Blog Item -->
                            <div class="col-md-4 blog-item-wrapper">
                                <div class="blog-item">
                                    <div class="blog-img">
                                        <a href="#"><img src="img/blog-3.jpg" alt=""></a>
                                    </div>
                                    <div class="blog-text">
                                        <div class="blog-tag">
                                            <a href="#"><h6><small>review</small></h6></a>
                                        </div>
                                        <div class="blog-title">
                                            <a href="#"><h4 class="k-font-subtitle">나도 어느새 이 동네 맛집 전문가</h4></a>
                                        </div>
                                        <div class="blog-meta">
                                            <p class="blog-date">2021. 05. 10.</p> /
                                            <p class="blog-comment"><a href="">29 Comments</a></p>
                                        </div>
                                        <div class="blog-desc k-font">
                                            <p>고메프렌즈의 리뷰들은 정말 정성 넘치고 자세합니다. 왜냐면 리뷰에 따라 할인 쿠폰을 제공하니까요!
                                                동네 친구들에게 메뉴 추천받는 기분으로 리뷰들을 하나하나 구경하다보면 어느새 맛집 전문가가 되어있을거에요.</p>
                                        </div>
                                        <div class="blog-author">
                                            <p>user: eped****</p>
                                        </div>
                                        <div class="blog-share-wrapper">
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-facebook-square"></i>
                                            </a>
                                            <a class="blog-share" href="google.com">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Blog Item -->
                        </div>
                    </div>
                    <!-- End of Blog -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of Blog Section -->        <!-- Portfolio Section -->
    <section id="gtco-portfolio" class="bg-white">
        <div class="container">
            <div class="section-content">
                <!-- Section Title -->
                <div class="title-wrap">
                    <h2 class="section-title">Best Photo Review</h2>
                </div>
                <!-- End of Section Title -->
                <div class="row">
                    <!-- Portfolio Holder -->
                    <div class="col-md-12 portfolio-holder">
                        <!-- Btn Filter -->
                        <div class="filter-button-group btn-filter d-flex justify-content-center">
                            <a tabindex="0" class="is-checked" data-filter="*">Show All</a>
                            <a tabindex="0" data-filter=".dessert">Dessert</a>
                            <a tabindex="0" data-filter=".western-food">Western Food</a>
                            <a tabindex="0" data-filter=".k-food">Korean Food</a>
                        </div>
                        <!-- End of Btn Filter -->
                        <!-- Portfolio Content -->
                        <div class="grid-portfolio">
                            <div class="grid-sizer"></div>
                            <div class="gutter-sizer"></div>
                            <!-- Portfolio Item -->
                            <div class="grid-item western-food">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-1.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-1.jpg"
                                               title="Snack and beer">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>Snack and beer</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                            <!-- Portfolio Item -->
                            <div class="grid-item dessert">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-6.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-6.jpg"
                                               title="Cupcake">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>Cupcake</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                            <!-- Portfolio Item -->
                            <div class="grid-item western-food grid-item-height">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-2.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-2.jpg"
                                               title="Sandwich">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>Sandwich</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                            <!-- Portfolio Item -->
                            <div class="grid-item dessert">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-5.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-5.jpg"
                                               title="Bread">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>Bread</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                            <!-- Portfolio Item -->
                            <div class="grid-item k-food">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-3.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-3.jpg"
                                               title="닭갈비">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>닭갈비</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                            <!-- Portfolio Item -->
                            <div class="grid-item k-food">
                                <div class="grid-item-wrapper">
                                    <img src="img/photo-4.jpg" alt="portfolio-img" class="portfolio-item">
                                    <div class="grid-info">
                                        <div class="grid-link d-flex justify-content-center">
                                            <a class="img-pop" data-rel="lightcase" href="img/photo-4.jpg"
                                               title="비빔밥">
                                                <span class="lnr lnr-move"></span>
                                            </a>
                                            <a class="ext-link" href="https://unsplash.com/" target="_blank">
                                                <span class="lnr lnr-link"></span>
                                            </a>
                                        </div>
                                        <div class="grid-title">
                                            <h4>비빔밥</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Portfolio Item -->
                        </div>
                        <!-- End of Portfolio Content -->
                    </div>
                    <!-- End of Portfolio Holder -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of Portfolio Section -->

    <footer class="mastfoot mb-3 bg-white py-4 border-top">
        <div class="inner container">
            <div class="row">
                <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
                    <p class="mb-0">© 2021 Gourmet Friends. All rights reserved.</p>
                </div>

                <div class="col-md-6">
                    <nav class="nav nav-mastfoot justify-content-md-end justify-content-center">
                        <a class="nav-link" href="#">
                            <i class="icon-facebook"></i>
                        </a>
                        <a class="nav-link" href="#">
                            <i class="icon-twitter"></i>
                        </a>
                        <a class="nav-link" href="#">
                            <i class="icon-instagram"></i>
                        </a>
                        <a class="nav-link" href="#">
                            <i class="icon-linkedin"></i>
                        </a>
                        <a class="nav-link" href="#">
                            <i class="icon-youtube"></i>
                        </a>
                        <a class="nav-link" href="#">
                            <i class="icon-pinterest"></i>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- External JS -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="vendor/bootstrap/popper.min.js"></script>
<script src="vendor/bootstrap/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js "></script>
<script src="vendor/owlcarousel/owl.carousel.min.js"></script>
<script src="vendor/isotope/isotope.min.js"></script>
<script src="vendor/lightcase/lightcase.js"></script>
<script src="vendor/waypoints/waypoint.min.js"></script>
<script src="vendor/countTo/jquery.countTo.js"></script>

<!-- Main JS -->
<script src="/js/app.min.js"></script>
<script src="//localhost:35729/livereload.js"></script>
</body>
</html>