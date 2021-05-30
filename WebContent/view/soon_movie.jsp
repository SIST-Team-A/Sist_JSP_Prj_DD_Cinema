<%@page import="vo.MovieMainVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MovieDAO mvDAO = MovieDAO.getInstance();
	List<MovieMainVO> list = mvDAO.selectMainPoster("N");
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
        width: 100%;
        min-width: 1150px;
        max-width: 950px;
        display: flex;
        flex-direction: row;
        justify-content: center;
        flex-wrap: wrap;
        padding-bottom: 20px;
      }
      #main-title {
        width: 100%;
        text-align: center;
        padding: 15px 0;
      }

      .item {
        width: 300px;
        height: 500px;
        margin: 10px;
        border: 1px solid black;
        text-align: center;
      }
      
      .item img{
      	width: 300px;
        height: 500px;
      }

      #unfold {
        width: 100%;
        padding: 25px 0;
        display: flex;
        flex-direction: row;
        justify-content: center;
      }

      .hidden {
        display: none;
      }
    </style>
    <script>
      window.onload = function () {
        const btn = document.getElementById("btn-unfold");
        btn.addEventListener("click", () => {
          let cnt = 3;
          const items = document.querySelectorAll(".item");
          for (const item of items) {
            if (cnt) {
              if (item.classList.contains("hidden")) {
                item.classList.remove("hidden");
                cnt--;
              }
            }
          }
        });
      };
    </script>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="./header.jsp" %>
      <div id="main">
        <div id="main-title">
          <h3>개봉예정작</h3>
        </div>
        <%for(int i = 0; i<list.size();i++){ 
        	if(i<3){
        	%>
        <div class="item"><a href="movie_info.jsp?mvNo=<%= list.get(i).getMvNo() %>"><img src="<%= list.get(i).getMvPoster() %>"/></a></div>
        <% 	}else{ %>
        <div class="item hidden"><a href="movie_info.jsp?mvNo=<%= list.get(i).getMvNo() %>"><img src="<%= list.get(i).getMvPoster() %>"/></a></div>
        <% } %>
        <% } %>
        <div id="unfold">
          <input
            type="button"
            class="btn btn-default"
            id="btn-unfold"
            value="펼쳐보기"
          />
        </div>
      </div>
      <%@ include file="./footer.jsp" %>
    </div>
  </body>
</html>