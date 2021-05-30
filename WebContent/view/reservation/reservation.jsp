<%@page import="dao.SeatDAO"%>
<%@page import="vo.SeatVO"%>
<%@page import="vo.SchMovieDateTimeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="vo.SchMovieDateVO"%>
<%@page import="vo.MovieListVO"%>
<%@page import="dao.SchMovieDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <% String mvNo = request.getParameter("mvNo"); %>
 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>영화예매하기</title>

    <!-- 부트스트랩 -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
   	 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <!--  jQuery CDN(c
    ontents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 <script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
        padding-left : 65px;
        width : 900px;
        margin : 10px auto
      }

	#selectMovie, #selectDate, #selectTime, #movie-select, #movie-date, #movie-time{ border: 1px solid #333; float:left;  font-size: 15px; }
	
	
    #movie-select, #movie-date, #movie-time{margin-top:0px}
	 
	.col-head {
    position: relative;
    height: 33px;
    line-height: 33px;
    text-align: center;
    background-color: #333333;
    background-repeat: no-repeat;
    background-position: 50% 50%;
	background-position: 50% 8px;
	color:#FFFFFF
}

	#selectMovie{ margin: center; width: 30%; margin-left: 50px; text-align: center }
	#selectDate{ margin: center; width: 20%; text-align: center}
	#selectTime{margin:center;width: 30%; text-align: center}
	
	#movie-select {margin: center; width: 30%;  height : 520px ;margin-left: 50px; text-align: left; background-color : #FFFFFF; font-size:15px }
	#movie-date {margin: center; width: 20%; height : 520px ;text-align: center; background-color :#FFFFFF /*#e8dccd*/; overflow: auto}
	#movie-time {width: 30%; height : 520px ; text-align: center; background-color : #FFFFFF}
	
	#mainBtn{width : 150px; height: 50px; background-color: #dfdfdf ; margin-left : 410px;color : #000000;}
	#seatBtn{width : 150px; height: 50px; background-color: #333333 ; color : #FFFFFF}
	
	#movieList,#dateList{line-height: 2}

	option { height : 30px}
</style>
	<%
		SchMovieDAO smDAO = new SchMovieDAO();
			List<MovieListVO> list = smDAO.selectSchMovie();
			MovieListVO mlVO = new MovieListVO();
			
			List<SchMovieDateVO> smdList = new ArrayList<SchMovieDateVO>();
			String[] movieNo = new String[list.size()]; 
			
			for( int i =0; i < list.size(); i ++){
				mlVO = list.get(i);
				movieNo[i] = mlVO.getMvNo();
			
				
			}//end for

			SchMovieDateVO smdVO = new SchMovieDateVO();
		 	for( int i = 0; i < movieNo.length; i++){
				smdList.addAll(smDAO.selectSchDate(movieNo[i]));
			}
			String[] schDate = new String[smdList.size()];
			String[] schMvNo = new String[smdList.size()];
			String[] schNo = new String[smdList.size()];
			for ( int i = 0 ; i< smdList.size();i++){
				smdVO = smdList.get(i);
				schDate[i] = smdVO.getSchDate();
				schMvNo[i] = smdVO.getMvNo();
				schNo[i] = smdVO.getSchNo();
			}//endfor
		%>

	<script type="text/javascript">
		$(function(){
			
			var mvNo = "<%=mvNo %>";
			
			if( mvNo!= "null"){
				
				//for (var i = 0 ; i < $("#movieList").lenght; i++){
					$("#movieList option").css("background-color","#000000");
					$("#movieList option").attr("disabled",true);
					$("#nonValue").css("background-color","#FFFFFF");

				//}
				
				if(mvNo != $("#movieList option").attr("class")){
					$("."+mvNo).css("background-color","#ffffff");
					$("."+mvNo).attr("disabled", false);
					$("."+mvNo).attr("selected", true);
					
					var movie = $("#movieList option:selected").attr("class");
					
					
					var schDate = new Array();
					var schMvNo = new Array();
					
					
					<%for( int i= 0 ; i < schDate.length ; i++){%>
				 	schDate[<%=i%>]="<%=schDate[i]%>"
					
				 <%}%>
					<%for( int i= 0 ; i < schMvNo.length ; i++){%>
					schMvNo[<%=i%>]="<%=schMvNo[i]%>"
					
				 <%}%>
					
			    $(".date").css("background-color", "#4C4C4C");
				for( var i = 0 ; i< schMvNo.length; i++){
						$("#"+schDate[i]).prop("disabled",true);
				

						if( schMvNo[i] == movie){
								if(schDate[i] == $("#"+schDate[i]).val()){
									$("#"+schDate[i]).css("background-color", "#FFFFFF");
									$("#"+schDate[i]).prop("disabled",false);
								}//end if
						}//end fi
					
				}
				}
			}
			});//ready	
	
		function movieSelectBox(){
			var movie = $("#movieList option:selected").attr("class");
	
			var schDate = new Array();
			var schMvNo = new Array();
			
			
			$("#timeList option").remove();
			$("#dateList option").attr("selected",false);
			$("#timeList option").attr("selected",false);
			<%for( int i= 0 ; i < schDate.length ; i++){%>
		 	schDate[<%=i%>]="<%=schDate[i]%>"
			
		 <%}%>
			<%for( int i= 0 ; i < schMvNo.length ; i++){%>
			schMvNo[<%=i%>]="<%=schMvNo[i]%>"
			
		 <%}%>
			
	    $(".date").css("background-color", "#4C4C4C");
		for( var i = 0 ; i< schMvNo.length; i++){
				$("#"+schDate[i]).attr("disabled",true);
		

				if( schMvNo[i] == movie){
						if(schDate[i] == $("#"+schDate[i]).val()){
							$("#"+schDate[i]).css("background-color", "#FFFFFF");
							$("#"+schDate[i]).prop("disabled",false);
						}//end if
				}//end fi
								
				
				
				
			 	if(reservation[0]==null){
					reservation.push(movie);
				}else{
					if(reservation[0] != $("#movieList option:selected").val()){
						reservation[0] = $("#movieList option:selected").val();
					}//end if
				}//end if ~ else 
				
		}//end for
			
		
			
			
		}//movieSelectBox
</script>
<%
List<SchMovieDateTimeVO> smdtList = new ArrayList<SchMovieDateTimeVO>();
	for( int i =0; i < schNo.length; i++){
		smdtList.addAll(smDAO.selectSchTime(schNo[i]));
	}
	
	String[] mvTitle = new String[smdtList.size()];
	String[] sDate = new String[smdtList.size()];
	String[] schStime = new String[smdtList.size()];
	
	SchMovieDateTimeVO smdtVO = new SchMovieDateTimeVO();
	
	SeatDAO sDAO = new SeatDAO();
	
	List<SeatVO> sList = new ArrayList<SeatVO>();
	SeatVO sVO = new SeatVO();
	
	int ff = 0;
	for ( int i = 0 ; i< smdtList.size();i++){
		smdtVO = smdtList.get(i);
		
		mvTitle[i] = smdtVO.getMvTitle();
		sDate[i] = smdtVO.getSchDate();
		schStime[i] = smdtVO.getSchStime();
		
		
		
	}//endfor
	

%>


<script type="text/javascript">	

	
		function dateSelectBox(){
			var date = $("#dateList option:selected").val();
			var sDate = new Array();
			var schStime = new Array();
			
			
			<%for( int i= 0 ; i < sDate.length ; i++){%>
				sDate[<%=i%>]="<%=sDate[i]%>"	
			
		    <%}%>
			
			<%for( int i= 0 ; i < schStime.length ; i++){%>
				schStime[<%=i%>]="<%=schStime[i]%>"
	        <%}%>
	       
	        $("#timeList").children("option").remove();
	        
	        for ( var i = 0; i < schStime.length; i++){
	        	if(sDate[i] == date){
	        		$("#timeList").append("<option value ='"+schStime[i]+"'>"+schStime[i]+" </option>");
	        	
	        	}//end if
	        }//end for
	        
	        if(reservation[0]==null){
	        	reservation.push("0");
	        }
	        if(reservation[1]==null){
	    		reservation.push(date);
	    	}else{
	    		if(reservation[1] != $("#dateList option:selected").val()){
	    			reservation[1] = $("#dateList option:selected").val();
	    		}//end if
	    	}//end if ~ else 
	    	
	     
		}//dateSelectBox

		$(function(){
			
			
			
			$("#mainBtn").click(function(){
				console.log(reservation);
				//location.href = "http://localhost/movie_reservation/view/main.jsp";
			})
		
			$("#seatBtn").click(function(){
				//window.location.href = "seat.jsp";//+url.replaceAll("#","");
				
				if(reservation[1] != null && reservation[2] != null){
					$("#frm").submit();
				}else{
					alert("상영일과 상영시간을 다시 선택해주세요.");
				}
			});//click
		});//ready
		
		
	</script>
<script type="text/javascript">
 reservation = new Array();
/* 
function movieSelectBox(){
	var movie = $("#movieList option:selected").val();
 			
		
 	if(reservation[0]==null){
		reservation.push(movie);
	}else{
		if(reservation[0] != $("#movieList option:selected").val()){
			reservation[0] = $("#movieList option:selected").val();
		}//end if
	}//end if ~ else 
		
	
	 
	
}//movieSelectBox


function dateSelectBox(){
	var date = $("#dateList option:selected").val()
	 if(reservation[1]==null){
		reservation.push(date);
	}else{
		if(reservation[1] != $("#dateList option:selected").val()){
			reservation[1] = $("#dateList option:selected").val();
		}//end if
	}//end if ~ else 
	if(reservation[0] == null){
		alert("영화를먼저 선택해주세요.");
		return;
	}
}//dateSelectBox  */


function timeSelectBox(){
	var time = $("#timeList option:selected").val()
 if(reservation[2]==null){
		reservation.push(time);
	}else{
		if(reservation[2] != $("#timeList option:selected").val()){
			reservation[2] = $("#timeList option:selected").val();
		}//end if
	}//end if ~ else 
	}//timeSelectBox


</script>
</head>
<body>
<%-- <%if( session.getAttribute("id") != null){ %> --%>

	<div id="wrap" >

		<%@ include file="../header.jsp" %>
		
		<div style = "height: 700px">
		<div id ="main" >
			<div>
				<h4>예매 > <strong>영화선택</strong></h4>
			<!-- head -->
			 <div >
				<div id="selectMovie" class="col-head">
					영화선택
				</div> 
				<div id="selectDate" class="col-head">
					날짜
				</div>
				<div id="selectTime" class="col-head">
				상영시간
				</div>
			</div>
			<!-- 내용 -->
			<form action = "seat.jsp" method ="get"	id = "frm" >
			<div >
				<!-- container 900(w) x 700(h)-->
				<div id="movie-select">
			

					<select id="movieList" name = "movie" multiple class="form-control" style= " height:100%"  onchange="movieSelectBox()">
					<%if(list.isEmpty()){ %>
						<option>영화가 준비중입니다.</option>
					<%}//end if %>
						<option id ="nonValue" style = "height : 1px; " disabled="disabled"></option>
					<%for(MovieListVO MainMlVO : list){ %>
						<option  class="<%=MainMlVO.getMvNo() %>" ><%=MainMlVO.getMvTitle() %></option>
					
					<%}//end for %>
					</select>
	
				</div>

				<div id="movie-date" >
				<%-- 	<ul id="dateList"style ="font-size: 15px">
										<% for(int i =1; i < 31; i ++){ %> 
 										 <li id ="date<%=i %>" class="date" value ="<%=i %>"> <%=i %>일</li>
										<%} %>
					</ul> --%>
					
					<% Calendar cal = Calendar.getInstance();
					DateFormat df = new SimpleDateFormat("YYYY-MM");
					  // int Year = cal.get(Calendar.YEAR);
					  
					   String Month = df.format(cal.getTime());
					  
						
					%>
					<select id = "dateList"  name = "date" multiple class="form-control" style ="height : 100%; text-align :center" onchange="dateSelectBox()" >
						
						<%for(int i =1; i < cal.getMaximum(Calendar.DAY_OF_MONTH); i ++){ 
							if(i < 10){
						%> 
 							<option   class = "date" id = "<%=Month %>-0<%=i%>" value = "<%=Month %>-0<%=i%>" disabled="disabled"><%=i %>일</option>
						<%	}else{ %>
 							<option  class="date" id = "<%=Month %>-<%=i%>" value = "<%=Month %>-<%=i%>" disabled="disabled"><%=i %>일</option>
						<%	}// end if
							
							}//end for
						%>
					
					</select>
				</div>
				<div id="movie-time">
					<select id="timeList"  name ="time" multiple class="form-control" style= " height:100%" onchange="timeSelectBox()" >
						
					
					</select>
				</div>
				
				
			</div>
			</form>
			
				<!-- button -->
				
				<div>
						<input type="button" id ="mainBtn" value ="메인으로" class="btn"/> &nbsp;
						<input type="button" value ="좌석 선택" id="seatBtn"class="btn"/> 
				</div>
			</div>
			
		</div>
		</div>
		
		<%@ include file="../footer.jsp" %>
	</div>
<%-- <%}else{%>		
	<script type="text/javascript">
	$(function(){
		
	alert("로그인 해주세요");
	 location.href="http://localhost/movie_reservation/admin/admin_login.jsp" ;
	})	
	</script>
<% }%> --%>

</body>
</html>