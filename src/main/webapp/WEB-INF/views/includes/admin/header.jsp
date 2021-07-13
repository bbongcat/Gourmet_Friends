<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>


 <!-- 우편주소  -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
          