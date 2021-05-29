<%@page import="vo.SeatRevVO"%>
<%@page import="vo.SeatUpdateVO"%>
<%@page import="dao.SeatDAO"%>
<%@page import="dao.ReservationDAO"%>
<%@page import="vo.ReservationInsertVO"%>
<%@page import="vo.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
   		request.setCharacterEncoding("UTF-8");
    
    	String movie = request.getParameter("movie");	
		String movieDate = request.getParameter("date");
		String movieTime = request.getParameter("time");
		
		String[] selectSeat = request.getParameterValues("selectSeat");
		
		ReservationInsertVO riVO = new ReservationInsertVO("lee3",selectSeat.length);
		ReservationDAO rDAO = new ReservationDAO ();
		boolean revInsert = rDAO.insertReservation(riVO);
		String rev_no = rDAO.selectRevNO();
		
		
		SeatDAO sDAO = new SeatDAO();
		SeatUpdateVO suVO = null;
		for(int i = 0; i < selectSeat.length; i++){
			suVO = new SeatUpdateVO(movie, movieDate, movieTime, selectSeat[i], rev_no);
			boolean seatUpdate = sDAO.updateSeat(suVO);
		}		
    %>
   
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예매확인</title>

    <!-- 부트스트랩 -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    	 <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 <script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
    
        width : 900px;
        margin : 10px auto;
        padding-left : 100px
      }
	
	td{font-size: 15px}
	
	#resultReservation-table{margin-left : 60px; width: 600px; height: 500px;text-align: center}
	.resultReservation-table-td{text-align : right; width: 200px}
	
	#resultReservation-mainBtn{width : 150px; height: 50px; background-color: #dfdfdf ; color : #000000;}
 </style>
<script type="text/javascript">
	function mainBtn(){
		window.location.href = "../main.jsp";
	}//mainBtn

</script>
</head>
<body>
<%
	ReservationVO rVO = rDAO.selectReservation(rev_no,movie,movieDate,movieTime);
%>

<% 
	/* Calendar cal = Calendar.getInstance();
	DateFormat df = new SimpleDateFormat("YYYY년 MM월");
    String Month = df.format(cal.getTime()); */
    
    String date = rVO.getSchDate();
    String year = date.substring(0,4) + "년";
    String month = date.substring(5,7) + "월";
    String day = date.substring(8,10) + "일";
   
    
%>
	<div id="wrap">
		<!-- wrap 900(w) x 1000(h) -->
		
		<%@ include file="../header.jsp" %>
		
		<div style = "height: 700px">
		<div id ="main" >
			<div  >
		
			<table id="resultReservation-table">
			<thead  style = "">
				<tr>
					<td colspan="3" style = "height : 40px"> <h1>예매가 완료 되었습니다.</h1></td>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td colspan="2" style ="height : 40px"></td>
					
				</tr>
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>예매 번호</strong></h4></td>
					<td><%=rVO.getRevNo() %></td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>영화</strong></h4></td>
					<td><%=rVO.getMvTitle() %></td>
				</tr>
				
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>영화일자</strong></h4></td>
					<td><%=year %> <%=month %> <strong><%=day %> <%=rVO.getSchStime() %> ~ <%=rVO.getSchEtime() %></strong></td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td"><h4><strong>인원수</strong></h4></td>
					<td><%=rVO.getRevAdultCnt() %> 명</td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>좌석번호</strong></h4></td>
					<td>
					<%
					String seat = null;
					for ( SeatRevVO srVO :rVO.getSeatList()){ 
					%>
					
						<%= srVO.getSeatName() %> 
						
					<%
					}//end for
					%>
					</td>
				</tr>
	
			</tbody>		
			</table>
			</div>
			
			<!-- 버튼위치 -->
			<div style = "text-align:right">
				<input id = "resultReservation-mainBtn" type="button" value ="메인으로" class="btn" onclick = "mainBtn()"/> 
			</div>
		</div>
		</div>
		<%@ include file="../footer.jsp" %>
	</div>



</body>
</html>