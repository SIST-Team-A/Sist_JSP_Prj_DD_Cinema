<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>좌석선택</title>

    <!-- 부트스트랩 -->
    <link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    	 <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 <script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

 <style type="text/css">
 
.btn {
	border: 1px solid #E9E9E9;
	background-color: #FFFFFF;
	padding-left: 7px;
	padding-right: 7px;
	height: 30px;
	font-weight: bold;
	cursor: pointer
}
.inputBox {
	border: 1px solid #E9E9E9;
	background-color: #FFFFFF;
	padding-left: 7px;
	padding-right: 7px;
	height: 30px;
}
input, select, textarea, button {
	border-radius: 5px;
	vertical-align: middle
}

 
	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
        padding-left : 65px;
        width : 900px;
        margin : 10px auto
      }
      
      
      #selectSeat{border : 1px solid #333; width : 800px; height : 300px; margin : 10px auto; margin-top: 30px; background-color : #FFFFFF; }

	  #tableSeat{margin : 30px auto; width : 800px; margin-left : 40px;}
	
	
	
	.선택됨, .seatBtn{ width :50px; height: 50px; margin-bottom: 30px}
	
	#cntLabel{margin-left: 50px; font-size : 20px}
	#cntInput{text-align : right; height : 40px}
	
	#plusBtn {border: 1px solid #333; width: 30px}
	#minusBtn{border: 1px solid #333; width: 30px}
	
	#backBtn {width : 150px; height: 50px; background-color: #333333 ;margin-left : 185px; color : #FFFFFF}
	#reservationBtn {width : 150px; height: 50px; background-color: #333333 ; color : #FFFFFF}

</style>
<script type="text/javascript">

	$(function(){
		cnt = $("#cntInput").val();
		$("#plusBtn").click(function(){
			
			cnt ++;
			if( cnt >4){
				alert("인원선택은 총 4명까지 가능합니다.");
				return;
			}
			$("#cntInput").val(cnt);
			
		});//click
		
		
		$("#minusBtn").click(function(){
			
			if($(".선택됨").length == cnt){
		
				if (cnt == 0){
					alert("인원선택을 다시 설정해 주세요.");
					return;
				}
				alert("선택한 좌석을 선택해지하고 인원수를 줄여주십시요,");
			
				return;
			}
			cnt --;
			
			$("#cntInput").val(cnt);
			
		
		
		});//click
	
		
		seat = new Array();
		$(".seatBtn").click(function(event){
			
			if(($(event.target).attr("class"))!="선택됨"){
			
				$(event.target).css("background-color","#7B68EE");
				$(event.target).removeClass($(event.target).attr("class")).addClass("선택됨");
				seat.push($(event.target).val());

				if(!(cnt >= $(".선택됨").length)){
				
					alert("인원수와 선택한좌석이 일치하지 않습니다.");
					$(event.target).removeClass($(event.target).attr("class")).addClass("seatBtn");
					$(event.target).css("background-color","#efefef");
					var idx = seat.indexOf($(event.target).val());
					seat.splice(idx,1);
				}//end if
					
			
			}else{
				$(event.target).removeClass($(event.target).attr("class")).addClass("seatBtn");
				$(event.target).css("background-color","#efefef");
				var idx = seat.indexOf($(event.target).val());
				seat.splice(idx,1);
			
				
			}//end if else
			
			
		});
		
		$("#reservationBtn").click(function(){
			if($(".선택됨").length != cnt ){
				alert("인원수와 좌석을 맞춰주세요");
		
			}else{
				if(cnt == 0){
					alert("인원수를 다시설정해주세요");	
					return;
				}//end if
				location.href = "resultReservation.jsp";
			}
		});//click
		
	
	
	});//ready
	
	function back(){
		console.log(seat)
	}//test
</script>
</head>
<body>


	
	<div id="wrap">
		<!-- wrap 900(w) x 1000(h) -->
		
		
		<%@ include file="../header.jsp" %>
		
		<div style = "height: 700px">
		<div id ="main">
		
			<div>
				<h4>예매 > <a href="http://localhost/jsp_prj/day0514/reservation.jsp" >영화선택 </a> > <strong>좌석선택</strong></h4>
				<!-- 좌석선택 div -->
				 <div id ="selectSeat">
				 	<!-- 영화 스크린 정보 표시 -->
				 		<div style = "text-align : center;"> 
				 			<h3> screan </h3>
				 		</div>
				 	<!-- 영화 스크린 정보 표시/div -->
				 	 <!-- 영화 좌석 버튼 div -->
				 		<div >
				 			<table id="tableSeat">
				 				<tr>
				 					<td>
				 						<%for ( int i =1; i < 4; i ++) {%>
				 						<input type = "button" class = "seatBtn" value = "A-<%=i %>" > 
				 						<%}//end for %>
				 					</td>
				 					<td style ="padding-left : 30px">
				 						<%for ( int i =4; i < 8; i ++) {%>
				 						<input type = "button"  class = "seatBtn" value = "A-<%=i %>" > 
				 						<%}//end for %>
				 					</td>
				 					<td>
				 						<%for ( int i =8; i < 11; i ++) {%>
				 						<input type = "button" class = "seatBtn" value = "A-<%=i %>" > 
				 						<%}//end for %>
				 					</td>
				 				</tr>
				 				<tr>
				 					<td>
				 						<%for ( int i =11; i < 14; i ++) {%>
				 						<input type = "button" class = "seatBtn" value = "A-<%=i %>" >
				 						<%}//end for %>
				 					</td>				 					
				 					<td style ="padding-left : 30px">
				 						<%for ( int i =14; i < 18; i ++) {%>
				 						<input type = "button" class = "seatBtn" value = "A-<%=i %>" >
				 						<%}//end for %>
				 					</td>				 					
				 					<td>
				 						<%for ( int i =18; i < 21; i ++) {%>
				 						<input type = "button" class = "seatBtn" value = "A-<%=i %>" > 
				 						<%}//end for %>
				 					</td>				 					
				 				</tr>
				 				
				 				<tr>
				 				
				 					<td colspan = "3" style = "padding-left : 700px">입구</td>
				 				</tr>
				 			</table>
				 		</div>
				 	<!-- 영화 좌석버튼 /div -->
				 		
				 </div>
				 
				<!--  좌석선택  /div -->
			
			</div>
			<div>
				<label id="cntLabel">인원수 : </label> <input type = "text" id = "cntInput" value = "1" class="inputBox" readonly="readonly"/>  <button type = "button" class="btn" id="plusBtn">+</button> <button type = "button" class="btn" id="minusBtn">-</button>
			
			</div>
			
			<div>
			<input type="text" readonly="readonly" style = "width :20px; height:20px; background-color :#efefef"> :예매 가능좌석 &nbsp;
			<input type="text" readonly="readonly" style = "width :20px; height:20px; background-color :#7B68EE"> :선택한 좌석 &nbsp;
			<input type="text" readonly="readonly" style = "width :20px; height:20px; background-color :#000000"> :예매된 좌석
			
				<input type="button" value ="뒤로가기" id = "backBtn"class="btn" onclick= "back()" > &nbsp;
				<button id = "reservationBtn" class="btn" >예매하기</button>
			</div>

		</div>
		</div>
		<%@ include file="../footer.jsp" %>

		
	</div>


</body>
</html>