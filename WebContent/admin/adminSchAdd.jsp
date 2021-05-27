<%@page import="java.util.List"%>
<%@page import="dao.AdminSchMovieDAO"%>
<%@page import="vo.AdminMovieListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
 
    
    <title>관리자 페이지(스케쥴추가)</title>

    <!-- 부트스트랩 -->
   
    
    <!--  jQuery CDN(contents Delivery Network) --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    	<!--  bootstrap  -->
 <script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
 
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <!-- timepicker -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
   
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

<%
	AdminSchMovieDAO asmDAO = new AdminSchMovieDAO();
	List<AdminMovieListVO> amlList = asmDAO.selectSchMovieAll();
	
%>
	<script type="text/javascript">
	
	 
		function adminMovieList(){ //영화목록 onchange함수
			schMovieList = $("#adminMovieList option:selected").val();//영화목록에서 선택한 항목을 schMovieList에 저장

			$("#titleMovie").val(schMovieList);
			
			<% for ( AdminMovieListVO amlVO : amlList){%>
					if("<%=amlVO.getMvTitle().replace(":","").replace(" ","")%>" == schMovieList.replace(":","").replace(" ","")){
						$("#startMovie").val("<%=amlVO.getMvOpenDate()%>");
					}//end if
			<%}//end for%>
			
			
		}//adminMovieList
	
	
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
			        defaultTime: '09',
			        startTime: '9:00',
			        dynamic: false,
			        dropdown: true,
			        scrollbar: true
			    });
			    
			    
			   
			    
			    
			    
			    
			    $("#addBtn").click(function(){
			    	
			    	var startMovie = $("#startMovie").val().substring(5,7) * 30 + $("#startMovie").val().substring(8,10) ;
			    	var endMovie = $("#endMovie").val().substring(5,7)* 30 + $("#endMovie").val().substring(8,10);
			        var  dateMovie = $("#dateMovie").val().substring(5,7)* 30 + $("#dateMovie").val().substring(8,10);
	    			var sTime = $("#sTime").val().substring(0,2) * 60 + $("#sTime").val().substring(3,5);
	    			var eTime = $("#eTime").val().substring(0,2) * 60 + $("#eTime").val().substring(3,5);
			        //개봉일보다 상영종료일이 더 앞선 날짜일경우
			
			        if( startMovie > endMovie){
			        	alert("개봉일보다 상영종료일이 먼저일수는 없습니다.");
			        	$("#endMovie").val("");
			        	return;
			        	
			        }else if(!(startMovie <= dateMovie && endMovie >= dateMovie)){
			        	alert("상영일은 개봉일과 상영종료일 사이여야합니다.");
			        	$("#dateMovie").val("");
			        	return;
			    	}else if(sTime >= eTime){
			        	alert("상영시간을 확인해 주세요");
			        	$("#eTime").val("09:00");
			        	return;
			    		
			    	}else{
					   	$("#frm").submit();
					    alert("추가되었습니다.")
			    	}//end if~else
						
						
						
			    });
		});//ready
		
		
		
/* 	
	    	
		 */

		
		
		
	</script>
	
</head>


<body>

	<div id="wrap" >
		<!-- wrap 900(w) x 1000(h) -->
			<%@ include file="adminHeader.jsp" %>
			
	
		
		<div id ="main" style = "background-color : #EBEDED; width : 500px; margin:  auto;">
			<div style ="text-align:center">
			<h2>영화 스케줄 추가</h2>
			</div>
			<div style = "width : 900px; height : 450px;  padding-left : 10px; ">
				<!-- 영화리스트 -->
				<div style=" float :left; width : 300px; height : 450px; margin-left : 140px">
				<div style = "font-size : 16px">
					<strong>영화목록</strong>
				</div>
					<select id="adminMovieList" multiple class="form-control" style = "height : 90%"  onchange="adminMovieList()">
						<%for (AdminMovieListVO amlVO : amlList){ %>
						<option id = "<%=amlVO.getMvNo()%>"> <%= amlVO.getMvTitle()%></option>
						<%} %>
						
					</select>
				</div>
				<!-- 테이블 -->
			<form action = "adminSchMain.jsp" id ="frm" method="post">
				<div style="float :left; width : 400px; height : 450px; padding-left : 20px">
					<table style = "width : 90%; height : 100%; ">
						<tr>
							<td>영화제목</td>
							<td><input type ="text" id="titleMovie"  name ="titleMovie" readonly="readonly" class="inputBox" style = "background-color :#dfdfdf ;width :240px" ></td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td><input type ="text" id="startMovie" name = "startMovie"readonly="readonly" style = "background-color :#dfdfdf"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영종료일</td>
							<td><input type ="text" id = "endMovie" name = "endMovie"class="datepicker" > <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영일</td>
							<td> <input type ="text" id = "dateMovie" name = "dateMovie"class="datepicker"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
						</tr>
						<tr>
							<td>상영시간</td>
							<td> <input type ="text" class="timepicker"  id="sTime" name ="sTime"style ="width  :100px;" > ~ <input type = "text" id="eTime" name="eTime"class="timepicker"  style ="width  :100px; "></td>
						</tr>
					
					</table>
				</div>
			</form>
				
			</div>
			<div >
				<button  id = "addBtn"class ="btn" style ="width : 150px; height: 50px; background-color: #333333 ; color : #FFFFFF">추가하기</button>
			</div>

		</div>
		<%@ include file="adminFooter.jsp" %>
		
	</div>
		

</body>
</html>

