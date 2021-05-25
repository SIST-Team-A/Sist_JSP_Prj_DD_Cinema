<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예매확인</title>

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
	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
    
        width : 900px;
        margin : 10px auto;
        padding-left : 100px
      }
	
	td{font-size: 15px}
	
	#ressultReservation-table{margin-left : 60px; width: 600px; height: 500px;text-align: center}
	.resultReservation-table-td{text-align : right; width: 200px}
	
	#resultReservation-mainBtn{width : 150px; height: 50px; background-color: #dfdfdf ; color : #000000;}
 </style>
<script type="text/javascript">


</script>
</head>
<body>

	<div id="wrap">
		<!-- wrap 900(w) x 1000(h) -->
		
		<%@ include file="../header.jsp" %>
		
		<div style = "height: 700px">
		<div id ="main" >
			<div  >
		
			<table id="ressultReservation-table">
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
					<td>r_00000001</td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>영화</strong></h4></td>
					<td>백두산?</td>
				</tr>
				
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>영화일자</strong></h4></td>
					<td>2021년 5월 <strong>21일 15:00 ~ 17:00</strong></td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td"><h4><strong>인원수</strong></h4></td>
					<td>성인 2 명</td>
				</tr>
				<tr>
					<td class = "resultReservation-table-td" ><h4><strong>좌석번호</strong></h4></td>
					<td>A-1, A-2</td>
				</tr>
	
			</tbody>		
			</table>
			</div>
			
			<!-- 버튼위치 -->
			<div style = "text-align:right">
				<input id = "resultReservation-mainBtn" type="button" value ="메인으로" class="btn" /> 
			</div>
		</div>
		</div>
		<%@ include file="../footer.jsp" %>
	</div>



</body>
</html>