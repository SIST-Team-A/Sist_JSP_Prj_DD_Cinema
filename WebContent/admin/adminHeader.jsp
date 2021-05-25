<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel = "stylesheet" type = "text/css" href="http://localhost/movie_reservation/common/css/adminHeaderFooter.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" />

<div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="">D.D Cinema</a></div>
          <div id="login">
            <a href="http://localhost/movie_reservation/admin/admin_login.jsp">로그아웃</a> <!-- 링크 변경 예정 -->
            <a href="http://localhost/movie_reservation/admin/admin_change_pass.jsp"">비밀번호변경</a> <!-- 링크 변경 예정 -->
          </div>
        </div>
        <div id="header-bottom">
          <ul class="header-bottom-ul">
            <li>
              <a href="admin_cur_movie.html">현재상영작관리</a>
            </li>
            <li>
              <a href="admin_soon_movie.html">개봉예정작관리</a>
            </li>
            <li><a href="adminSchMain.jsp">영화스케쥴관리</a></li>
            <li><a href="ad_mem_mian.jsp">회원관리</a></li>
          </ul>
        </div>
      </div>