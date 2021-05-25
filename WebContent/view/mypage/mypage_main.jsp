<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이페이지</title>
    <!-- bootstrap -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- JQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap -->
    <script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    
<style type="text/css">
	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
        padding-left : 65px;
        width : 900px;
        margin : 10px auto
      }
    #header{margin-bottom: 0px;}
      
	#title{font-size: 36px;}
	#navibar{width: 100% ;border-bottom: 1px solid #333; font-size: 15px ; }
	#taHead{background-color: #EAEAEA;}
</style>
<script type="text/javascript">
	$(function() {
		$(".detailBtn").click(function() {
			window.location="http://localhost/movie_reservation/view/mypage/mypage_res_detail.jsp";
		});//click
		
	});//ready
</script>
</head>
<body>
	<div id="wrap">
	
	<%@include file="../header.jsp" %>
	
	<div id="main">
	<div id="title">My page</div>
	<div id="navibar">
		<ul class="nav nav-pills">
		  <li role="presentation"><a	href="mypage_res_detail.jsp">예매내역</a></li>
		<li role="presentation"><a href="change_infor1.jsp">정보 수정</a></li>
		<li role="presentation"><a	href="change_pass1.jsp">비밀번호	변경</a></li>
		</ul>
	</div>
	<br/>
	<br/>
	<div>
	<table class="table table-hover">
		<thead>
		<tr id="taHead">
			<th>No.</th>
			<th>영화</th>
			<th>상세보기</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>21051601</td>
			<td>괴물</td>
			<td class="detailBtn"><input type="button" value="상세보기" class="btn btn-primary"></td>
		</tr>
		<tr>
			<td>21051602</td>
			<td>인셉션</td>
			<td class="detailBtn"><input type="button" value="상세보기" class="btn btn-primary"></td>
		</tr>
		<tr>
			<td>21051603</td>
			<td>테넷</td>
			<td class="detailBtn"><input type="button" value="상세보기" class="btn btn-primary"></td>
		</tr>
		<tr>
			<td>21051604</td>
			<td>미나리</td>
			<td class="detailBtn"><input type="button" value="상세보기" class="btn btn-primary"></td>
		</tr>
		
		</tbody>
		
	</table>
	</div>

	</div>
	
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>