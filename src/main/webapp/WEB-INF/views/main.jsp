<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/css/main.css">
    <script src="/vendor/jquery/jquery.min.js"></script>

</head>
<body>
    <div class="wrapper">
        <div class="wrap">
            <div class="top_area">
                <div class="login_area">
                    <!-- 로그인 하지 않는 상태 -->
                    <c:if test="${loginUser == null}">
                        <div class="login_button"><a href="/user/login">로그인</a></div>
                        <span><a href="/user/sign_up">회원가입</a></span>
                    </c:if>

                    <!-- 로그인한 상태 -->
                    <c:if test="${loginUser != null}">
                        <div class="login_success_area">
                            <span>회원 : ${loginUser.userName}</span>
                            <span>회원등급 : ${loginUser.userRank}</span>
                            <span>회원권한 : ${loginUser.userAuth}</span>
                        </div>
                    </c:if>
                    
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
    </div>
</body>
</html>