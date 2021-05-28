<%@page import="vo.AddSeatVO"%>
<%@page import="dao.SeatDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.AdminSchMovieMainVO"%>
<%@page import="vo.AdminMovieCloseUpdateVO"%>
<%@page import="vo.AdminSchMovieInsertVO"%>
<%@page import="dao.AdminSchMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
    	request.setCharacterEncoding("UTF-8");
    	String mvTitle = (request.getParameter("titleMovie") == null) ? "" :request.getParameter("titleMovie");
    	String mvOpenDate = (request.getParameter("startMovie") == null) ? "" : request.getParameter("startMovie");
		String mvCloseDate = (request.getParameter("endMovie") == null) ? "" : request.getParameter("endMovie");
		String schDate = (request.getParameter("dateMovie") == null) ? "" : request.getParameter("dateMovie");
		String schStime = (request.getParameter("sTime") == null) ? "" : request.getParameter("sTime");
		String schEtime = (request.getParameter("eTime") == null) ? "" : request.getParameter("eTime");
		
		 AdminSchMovieDAO asmDAO = new AdminSchMovieDAO();
		 SeatDAO sDAO = new SeatDAO();
		if(!mvTitle.equals("") && !mvOpenDate.equals("") && !mvCloseDate.equals("") && !schDate.equals("") && !schStime.equals("") && !schEtime.equals("") ){
			
			AdminSchMovieInsertVO asmiVO = new AdminSchMovieInsertVO(mvTitle, mvOpenDate, schDate, schStime, schEtime);
			boolean insertFlag = asmDAO.insertSchMovie(asmiVO);
			AdminMovieCloseUpdateVO amcuVO =  new AdminMovieCloseUpdateVO(mvTitle, mvOpenDate, mvCloseDate);
			boolean updateFlag = asmDAO.updateMovieClose(amcuVO);
			
			AddSeatVO asVO = new AddSeatVO(mvTitle, mvOpenDate, schDate, schStime, schEtime);
			for( int i = 1; i < 21; i ++){
				int cnt = sDAO.insertAddSeat(asVO, String.valueOf(i));
			}
		}
	
  %>
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
    
    <%
 
    	List<AdminSchMovieMainVO> asmmList = asmDAO.selectSchMoavieMainAll();
    	
    %>
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
            
            <% for ( AdminSchMovieMainVO asmmVO : asmmList){ %>
            <tr>
              <td class="movie-num"><%=asmmVO.getSchNo() %></td>
              <td class="movie-title"><%=asmmVO.getMvTitle() %></td>
              <td class="director"><%=asmmVO.getSchDate() %></td>
              <td class="cast"><%=asmmVO.getSchStime() %></td>
              <td class="audience"><%=asmmVO.getSchEtime() %></td>
            </tr>
            <%} %>
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
