<%@page import="vo.AdminSchMovieSelectVO"%>
<%@page import="dao.AdminSchMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
 
    <title>관리자 페이지(스케쥴수정)</title>

	
   <!-- 부트스트랩 -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
   
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	<!--  bootstrap  -->
 <script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <!-- timepicker -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" />
   
 <%
   	String SchNo = request.getParameter("SchNo");
   
   AdminSchMovieDAO asmDAO = new AdminSchMovieDAO();
   AdminSchMovieSelectVO asmsVO = asmDAO.selcetSchMovie(SchNo);
   %>

   
<style type="text/css">

	


	td{text-align : left;font-size : 16px; font-weight: bold; }
	
		
	input {
	border: 1px solid #E9E9E9;
	background-color: #FFFFFF;
	padding-left: 7px;
	padding-right: 7px;
	height: 30px;
	width:130px
}
       
       
</style>

	<script type="text/javascript">
	$(function(){

	    $( ".datepicker" ).datepicker({
	     /*  showOn: "button",
	      buttonImage: "images/calendar_ico.png", */
	      buttonText: "Select date",
	      autoSize: true,
	      changeMonth: true,
	      changeYear : true,
	      currentText : "오늘",
	      dateFormat :"yy-mm-dd",
	      dayNamesMin : ["일","월","화","수","목","금","토"],
	      monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	      monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	    });
	    
	    $('.timepicker').timepicker({
	        timeFormat: 'HH:mm',
	        interval: 60,
	        minTime: '09',
	        maxTime: '23:00',
	        startTime: '9:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true
	    });
	    
	    $("#modifyBtn").click(function(){
	    	alert("수정이 완료되었습니다.");
	    	location.href = "adminSchMain.jsp"
	    });
	
	   
});//ready
		
		function deleteClick(){
    		alert("삭제가  완료되었습니다.");
			$("#frm").submit();
		}
		
		function backClick(){
			window.history.back();
		}
	</script>
	
</head>
<body>


	<div id="wrap" >
		<!-- wrap 900(w) x 1000(h) -->
		
		<%@ include file="adminHeader.jsp" %>
		
		<div id ="main" style = "background-color : #EBEDED; width : 500px; margin: 10px auto;">
			<div style ="text-align:center">
			<h2>영화 스케줄 수정</h2>
			</div>
			<div style=" width : 480px; height : 550px; margin-left: 240px">
			<form action ="adminSchMain.jsp" id = "frm" >
					<table style = "width : 80%; height : 550px ">
						<tr>
							<td>스케줄 코드</td>
							<td> <input type ="text" readonly="readonly" name = "SchNo" value = "<%=SchNo %>" style = "background-color :#dfdfdf" ></td>
						</tr>
						<tr>
							<td>영화코드</td>
							<td> <input type ="text" readonly="readonly" value = "<%=asmsVO.getMvNo() %>"style = "background-color :#dfdfdf"></td>
						</tr>
						<tr>
							<td>영화제목</td>
							<td> <input type ="text" readonly="readonly" value = "<%=asmsVO.getMvTitle() %>" style = "background-color :#dfdfdf"></td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td> <input type ="text" readonly="readonly" value = "<%=asmsVO.getMvOpenDate() %>" style = "background-color :#dfdfdf"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영종료일</td>
							<td> <input type ="text"  class="datepicker" value = "<%=asmsVO.getMvCloseDate()%>"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영일</td>
							<td> <input type ="text"  class="datepicker" value = "<%=asmsVO.getSchDate() %>" ><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영시간</td>
							<td > <input type ="text" class="timepicker"  value = "<%=asmsVO.getSchStime() %>"style =" width  :100px;"> ~ <input type = "text"  class = "timepicker" value = "<%=asmsVO.getSchEtime() %>" style ="width  :100px;"></td>
						</tr>
					
					</table>
			</form>
				</div>
			<div >
				<button id = "backBtn"class ="btn" style ="margin-left : 500px;width : 120px; height: 50px; background-color: #333333 ; color : #FFFFFF" onclick = "backClick()">뒤로가기</button>
				<button id = "deleteBtn"class ="btn" style ="width : 120px; height: 50px; background-color: #333333 ; color : #FFFFFF" onclick = "deleteClick()">삭제하기</button>
				<button id = "modifyBtn"class ="btn" style ="width : 120px; height: 50px; background-color: #333333 ; color : #FFFFFF">수정하기</button>
			</div>
		</div>


		<%@ include file="adminFooter.jsp" %>
		
		
	</div>

</body>
</html></html>