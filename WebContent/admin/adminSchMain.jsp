<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- botstrap -->
    <link href="../common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <style type="text/css">
 
    </style>
    <script type="text/javascript">
    $(function(){
    	
    	$("#addBtn").click(function(){
			location.href = "adminSchAdd.jsp";
		})
		
		$(".movie-title").click(function(){
			location.href="adminSchModify.jsp";
		})
    }); //ready
    
    </script>
  </head>
  <body>
    <div id="wrap">
      	<%@ include file="adminHeader.jsp" %>
      
      <div id="main">
        <div id="table-header">영화 스케줄 관리</div>
        <div>
        <div id="table-area">
          <table id="table">
            <tr>
              <td class="title-bar">번호</td>
              <td class="title-bar">제목</td>
              <td class="title-bar">영화상영일</td>
              <td class="title-bar">영화시작시간</td>
              <td class="title-bar">영화종료시간</td>
            </tr>
            <tr>
              <td class="movie-num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="movie-num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
            <tr>
              <td class="num">1</td>
              <td class="movie-title">2</td>
              <td class="director">3</td>
              <td class="cast">4</td>
              <td class="audience">5</td>
            </tr>
          </table>
        </div>
        <div style = "text-align: right;  ">
				<button id = "addBtn" style ="width : 150px; height: 50px; background-color: #333333 ; color : #FFFFFF">추가하기</button>
		</div>
		</div>
      </div>
      
      	<%@ include file="adminFooter.jsp" %>
    </div>
  </body>
</html>

