<%@page import="vo.AdminSchMovieUpdateVO"%>
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
    	String mvTitle = (request.getParameter("addTitleMovie") == null) ? "" :request.getParameter("addTitleMovie");
    	String mvOpenDate = (request.getParameter("addStartMovie") == null) ? "" : request.getParameter("addStartMovie");
		String mvCloseDate = (request.getParameter("addEndMovie") == null) ? "" : request.getParameter("addEndMovie");
		String schDate = (request.getParameter("addDateMovie") == null) ? "" : request.getParameter("addDateMovie");
		String schStime = (request.getParameter("addsTime") == null) ? "" : request.getParameter("addsTime");
		String schEtime = (request.getParameter("addeTime") == null) ? "" : request.getParameter("addeTime");
		
		 AdminSchMovieDAO asmDAO = new AdminSchMovieDAO();
		 SeatDAO sDAO = new SeatDAO();
		if(!mvTitle.equals("") && !mvOpenDate.equals("") && !mvCloseDate.equals("") && !schDate.equals("") && !schStime.equals("") && !schEtime.equals("") ){
			
			AdminSchMovieInsertVO asmiVO = new AdminSchMovieInsertVO(mvTitle, mvOpenDate, schDate, schStime, schEtime);
			boolean insertFlag = asmDAO.insertSchMovie(asmiVO);
			//AdminMovieCloseUpdateVO amcuVO =  new AdminMovieCloseUpdateVO(mvTitle, mvOpenDate, mvCloseDate);
			boolean updateFlag = asmDAO.updateMovieClose(mvTitle, mvCloseDate);
			
			
			AddSeatVO asVO = new AddSeatVO(mvTitle, mvOpenDate, schDate, schStime, schEtime);
			for( int i = 1; i < 21; i ++){
				int cnt = sDAO.insertAddSeat(asVO, String.valueOf(i));
			}
		}
		
    	String SchNo = (request.getParameter("schNo") == null) ? "" : request.getParameter("schNo");
    	
		
	
    	
		
    	

    		if(!(SchNo).equals("")){
    	   		
    			boolean flag = sDAO.deleteSeat(SchNo);
    			boolean flag1 = asmDAO.deleteSchMovie(SchNo);
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
 
    <%
 
    	List<AdminSchMovieMainVO> asmmList = asmDAO.selectSchMoavieMainAll();
    	
    %>
    <script type="text/javascript">
    $(function(){
    	
    	$("#addBtn").click(function(){
			location.href = "adminSchAdd.jsp";
		})
		
		$(".movie-title").click(function(){
			$("#frm").submit();
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
        <form id = "frm" action = "adminSchModify.jsp" >
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
              <td class="movie-num" name="SchNo" value="<%=asmmVO.getSchNo() %>"><%=asmmVO.getSchNo() %></td>
              <td class="movie-title"><a href ="adminSchModify.jsp?SchNo=<%=asmmVO.getSchNo() %>"><%=asmmVO.getMvTitle() %></a></td>
              <td class="director"><%=asmmVO.getSchDate() %></td>
              <td class="cast"><%=asmmVO.getSchStime() %></td>
              <td class="audience"><%=asmmVO.getSchEtime() %></td>
            </tr>
            <%} %>
          </table>
        </div>
        </form>
        <div style = "text-align: right;  ">
				<button id = "addBtn" style ="width : 150px; height: 50px; background-color: #333333 ; color : #FFFFFF">추가하기</button>
		</div>
		</div>
      </div>
      
      	<%@ include file="adminFooter.jsp" %>
    </div>
  </body>
</html>
