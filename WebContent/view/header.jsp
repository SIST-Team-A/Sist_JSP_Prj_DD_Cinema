<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <link rel = "stylesheet" type = "text/css" href="http://localhost/movie_reservation/common/css/header.css">

      <div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="http://localhost/movie_reservation/view/main.jsp">D.D Cinema</a></div>
          <div id="login">
          
          <%
          	if(session.getAttribute("id")==null){
          		%>
          		
            <a href="../login/login.jsp">로그인</a>
            
            <a href="../login/login.jsp">회원가입</a>
          	<% }else{%>
          	<form method ="post" action="main.jsp">
            <a href="../login/logout.jsp">로그아웃</a>
            </form>
            <a href="../login/login.jsp">회원가입</a>
          	<%
          		}      
          		%>
          </div>
        </div>
        
        <div id="header-bottom">
          <ul class="header-bottom-ul">
            <li>
              <a href="http://localhost/movie_reservation/view/reservation/reservation.jsp">예매</a>
            </li>
            <li>
              <a href="http://localhost/movie_reservation/view/cur_movie.jsp">현재상영작</a>
            </li>
            <li><a href="http://localhost/movie_reservation/view/soon_movie.jsp">개봉예정작</a></li>
          </ul>
        </div>
      </div>
