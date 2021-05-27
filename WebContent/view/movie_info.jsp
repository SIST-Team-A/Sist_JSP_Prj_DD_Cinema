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
      body,
      html {
        width: 100%;
        height: 100%;
        font-family: "Noto Sans KR", sans-serif;
      }
      body {
        margin: 0;
        overflow-x: hidden;
        overflow-y: overlay;
      }
      div {
        /* border: 1px solid black; */
      }
      a {
        text-decoration: none;
        color: black;
      }
      a:hover {
        text-decoration: none;
        color: black;
      }
      #wrap {
        display: flex;
        width: 100%;
        height: 100%;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
      }
      ul {
        list-style: none;
      }
      #header {
        width: 100%;
        min-width: 950px;
        height: 122px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        /* margin-bottom: auto; */
      }
      #header-top {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0px;
      }
      #header-bottom {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 85%;
        border-top: 1px solid #b2b2b2;
        font-size:14px;
        margin: 0 auto;
      }
      #header-bottom ul {
        text-align: center;
        margin: 0px;
        padding: 0px;
      }
      #header-bottom ul li {
        margin: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
        float: left;
      }

      #left {
        width: 25%;
      }
      #title {
        font-size: 36px;
        font-family: "Noto Sans KR", sans-serif;
      }
      #login {
        width: 25%;
        text-align: center;
      }
      #login a {
        color: #656565;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 12px;
      }
      #login a:hover {
        color: #656565;
      }

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

      #main div {
        /* border: 1px solid black; */
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
        margin-top: 50px;
        width: 100%;
        height: 100%;
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
      #footer {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        width: 100%;
        min-width: 950px;
        min-height: 140px;
        background-color: black;
        /* margin-top: auto; */
      }
      #footertxt {
        color: #a2a2a2;
        font-size: 12px;
      }
      #footer-right {
        width: 20%;
      }

      .header-bottom-ul li {
        float: left;
        margin-right: 5px;
      }

      .header-bottom-ul li::before {
        padding-left: 5px;
        color: #b2b2b2;
        content: "｜";
      }

      .header-bottom-ul li:first-child::before {
        content: "";
      }

      .hidden {
        display: none;
      }
    </style>
    <script></script>
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="main.jsp">D.D Cinema</a></div>
          <div id="login">
            <a href="">로그인</a>
            <a href="">회원가입</a>
          </div>
        </div>
        <div id="header-bottom">
          <ul class="header-bottom-ul">
            <li>
              <a href="">예매</a>
            </li>
            <li>
              <a href="cur_movie.jsp">현재상영작</a>
            </li>
            <li><a href="soon_movie.jsp">개봉예정작</a></li>
          </ul>
        </div>
      </div>
      <div id="main">
        <div id="main-info">
          <div id="movie-poster"><img src="<%=mvSelectVO.getMvPoster() %>" /></div>
          <div id="movie-info">
            <div id="movie-title"><h2><%=mvSelectVO.getMvTitle() %></h2></div>
            <div id="movie-detail">
              장르 : / <%=mvSelectVO.getMvOpenDate() %> 개봉 / <%=mvSelectVO.getMvRuntime()%><br />
              감독 : <%=mvSelectVO.getMvDirector()%><br />
              출연 : <% for(int i = 0; i<list.size(); i++){
            	  if(i!=list.size()-1){%> 
              		<%=list.get(i).getActName()%><%=list.get(i).getActMainOrSub().equals("M")?"(주연), ":"(조연), "%>
              		<%}else{ %>
              		<%=list.get(i).getActName()%><%=list.get(i).getActMainOrSub().equals("M")?"(주연)":"(조연)"%>
              		<%} %>
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
      <div id="footer">
        <div id="footertxt">
          Double Dragon Cinema<br />
          서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터 고객센터
          1544<br />
          조장 한상민 사업자등록번호 000-00-000000 개인정보 보호 최고 책임자
          한상민<br />
          COPYRIGHT©Double Dragon Cinema.
        </div>
        <div id="footer-right"></div>
      </div>
    </div>
  </body>
</html>