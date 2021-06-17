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
      
      <link rel="stylesheet" href="/css/admin/menu_manage.css">
      <script src="/vendor/jquery/jquery.min.js"></script>

  </head>
  <body>
        <%@include file="../includes/admin/header.jsp"%>
            
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>메뉴 관리</span></div>
            </div>
        
        <%@include file="../includes/admin/footer.jsp"%>

        <script>

            $(document).ready(function(){

                let eResult = '<c:out value="${insert_result}"/>';

                checkResult(eResult);

                function checkResult(result){
                    if(result === ''){
                        return;
                    }
                    alert("메뉴'"+ eResult +"'를 등록하였습니다.");
                }
            });

        </script>

  </body>
  </html>