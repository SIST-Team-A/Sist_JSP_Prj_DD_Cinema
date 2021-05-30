<%@page import="vo.ActorVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MovieSelectVO"%>
<%@page import="dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String mvNo = request.getParameter("mvNo");
	MovieDAO mvDAO = MovieDAO.getInstance();
	MovieSelectVO mvSelectVO = mvDAO.selectMovie(mvNo);
	List<ActorVO> list = mvSelectVO.getActList(); 
	%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- botstrap -->
    <link
      href="../common/bootstrap-3.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <style>

      #main {
        width: 50%;
        max-width: 800px;
        min-width: 750px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        margin: 50px 0;
      }

      #main-info {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
      }

      #movie-info {
        display: flex;
        flex-direction: column;
        width: 45%;
      }

      #movie-title {
        border-bottom: 1px solid #ccc;
      }

      #movie-detail {
      	display:flex;
      	flex-direction:column;
      	justify-content:space-between;
      	align-items:center;
        margin-top: 50px;
        width: 100%;
        height: 100%;
      }
      #btn-reservation{
      }
      #movie-poster{
      	width: 349px;
      	height: 500px;
      }
      #movie-poster img{
      	width:100%;
      	height:100%;
      }

      #story {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
      }

      #story-label {
        width: 15%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        border-bottom: 1px solid #ccc;
      }

      #trailer {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        margin-top: 15px;
      }

      #trailer-title {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 50%;
        margin-bottom: 20px;
        border-bottom: 1px solid #ccc;
      }

      #trailer-video {
        width: 100%;
        height: 500px;
      }
      #btn-main {
        margin-top: 40px;
      }
      .hidden {
        display: none;
      }
    </style>
    <script></script>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="./header.jsp" %>
      <div id="main">
        <div id="main-info">
          <div id="movie-poster"><img src="<%=mvSelectVO.getMvPoster() %>" /></div>
          <div id="movie-info">
            <div id="movie-title"><h2><%=mvSelectVO.getMvTitle() %></h2></div>
            	<div id="movie-detail">
            		<div id= "movie-detail-info">
              			장르 : <%=mvSelectVO.getMvGenre() %>/ <%=mvSelectVO.getMvOpenDate() %> 개봉 / <%=mvSelectVO.getMvRuntime()%><br />
              			감독 : <%=mvSelectVO.getMvDirector()%><br />
              			출연 : <% for(int i = 0; i<list.size(); i++){
            	  					if(i!=list.size()-1){%> 
              							<%=list.get(i).getActName()%><%=list.get(i).getActMainOrSub().equals("M")?"(주연), ":"(조연), "%>
              						<%}else{ %>
              							<%=list.get(i).getActName()%><%=list.get(i).getActMainOrSub().equals("M")?"(주연)":"(조연)"%>
              						<%} %>
              					<%} %>
              		</div>
              		 <%
          				if(session.getAttribute("id")==null){
          			 %>
          			 		<div id="btn-reservation" ><a class="btn btn-default" role="button" onclick="alert('로그인을 해주세요');">예매하기</a></div>
          				<% }else{%>
          					<div id="btn-reservation" ><a class="btn btn-default" role="button" href="http://localhost/movie_reservation/view/reservation/reservation.jsp?mvNo=<%=mvNo %>">예매하기</a></div>
          				<%} %>
            </div>
          </div>
        </div>
        <div id="story">
          <div id="story-label">
            <h3>소개</h3>
          </div>
          <br />
          <%= mvSelectVO.getMvSt() %>
        </div>
        <div id="trailer">
          <div id="trailer-title">
            <h3>트레일러</h3>
          </div>
          <iframe
            id="trailer-video"
            src="<%= mvSelectVO.getMvTrailler() %>"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>
        </div>
        <input
          type="button"
          id="btn-main"
          class="btn btn-default"
          value="메인으로"
          onclick="location.href='main.jsp'"
        />
      </div>
      <%@ include file="./footer.jsp" %>
    </div>
  </body>
</html>