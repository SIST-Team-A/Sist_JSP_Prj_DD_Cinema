<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel = "stylesheet" type = "text/css" href="http://localhost/movie_reservation/common/css/adminHeaderFooter.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" />

<div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="">D.D Cinema</a></div>
          <div id="login">
          <%
          	if(session.getAttribute("id") !=null){
          		%>
          	<form method ="post" action="main.jsp">
            <a href="admin_logout.jsp">로그아웃</a>
            </form>
            <!-- <a href="admin_change_pass.jsp">비밀번호 변경</a> -->
          	<%
          		}      
          		%>
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