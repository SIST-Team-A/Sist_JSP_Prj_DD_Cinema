<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- bootstrap -->
    <link href="http://localhost/real/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="http://localhost/jsp_prj/common/css/adminHeaderFooter.css"  rel="stylesheet">
    
    <!-- JQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap -->
    <script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    
    
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');
</style>
<style type="text/css">
	/* container 시작 */
		#container{width: 900px; height: 700px; position:relative; margin-top: px;margin: 0px auto;}
		#taTitle{text-align: center;font-size: 38px;font-family: 'Nanum Gothic', sans-serif;}
		#ta{width: 900px;height: 250px;margin: 0px auto;font-family: 'Nanum Gothic', sans-serif;font-size: 20px; height: 350px; overflow: auto;}
		#num{width: 100px}
		#id{width: 150px}
		#name{width: 130px}
		#birth{width: 100px}		
	/* container 끝 */
	
	/* modal */
		#modal{
				display: none;
		
			   position:fixed;
			   top:0px;
			   width: 900px; 
			   height: 750px; 
			   z-index: 1}
			   
		#modal .modal_content{width: 600px; 
							  margin: 100px auto;
							  padding: 20px 10px;
							  background: #fff;
							  border: 2px solid #666;}
							  
		#modal .modal_layer{position: fixed;
							top: 0px;
							left: 0px;
							width: 100%;
							height: 100%;
							background: rgba(0,0,0,0.5);
							z-index: -1;}
							
		#selectTitle{font-size: 28px; text-align: center; margin-top: 20px;}
		th{text-align: center; font-size: 20px}
		#selectTa{width: 500px;border-spacing: 40px;border-collapse: separate;}
		#grBtn{text-align: center;}
	
</style>



<script type="text/javascript">
	
	$(function() {
		
		$("table tbody tr").click(function() {
			
			/* 
			기존의 팝업창
			window.open("ad_mem_select.jsp","pop","width=420px,height=640px,top="+(window.screenTop+100)+",left="+(window.screenLeft+100));
			}); 
			 */
			
			$("#modal").attr("style", "display:block");//modal
		});//click
		
		
		$("#modal_edit_btn").click(function() {
			confirm("수정하시겠습니까?");
		});//click
		
		$("#modal_delete_btn").click(function() {
			confirm("삭제하시겠습니까?");
		});//click
		
		$("#modal_close_btn").click(function() {
			$("#modal").fadeOut();//attr("style", "display:none");//modal
		});//click
		
	})//ready
</script>
</head>
<body>
	<div id="wrap">
		<%@include file="adminHeader.jsp" %>
		
		<div id="taTitle">회원 관리</div>
		<div id="ta">
		<table class="table table-bordered table-hover" id="table">
			<thead>
			<tr>
				<th id="num">번호</th>
				<th id="id">아이디</th>
				<th id="name">이름</th>
				<th id="birth">생년월일</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			<tr>
				<td>1234567</td>
				<td>sist1234</td>
				<td>홍길동</td>
				<td>1995-12-11</td>
			</tr>
			
			</tbody>
		</table>
		
		<!-- 모달  -->
		<div id="modal">
			<div class="modal_content">
				<div id="selectTitle">회원관리</div>
				<table id="selectTa">
					<tr>
						<th>번호</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf"></td>
					</tr>		
					<tr>
						<th>아이디</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf"></td>
					</tr>		
					<tr>
						<th>이름</th>
						<td><input type="text"></td>
					</tr>		
					<tr>
						<th>생년월일</th>
						<td><input type="text"></td>
					</tr>		
					<tr>
						<th>성별</th>
						<td><input type="radio" name="gender">남 <input type="radio" name="gender">여</td>
					</tr>		
					<tr>
						<th>이메일</th>
						<td><input type="text"></td>
					</tr>		
					<tr>
						<th>연락처</th>
						<td><input type="text"></td>
					</tr>		
					<tr>
						<th>가입일</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf"></td>
					</tr>		
				</table>
				<div id="grBtn">
					<input type="button" class="btn btn-primary btn-lg" value="수정" id="modal_edit_btn"/>
					<input type="button" class="btn btn-danger btn-lg" value="삭제" id="modal_delete_btn"/>
					<input type="button" class="btn btn-default btn-lg" value="취소" id="modal_close_btn"/>
				</div>
			</div>
			<div class="modal_layer"></div>
		</div>
		</div>
	 <%@ include file="adminFooter.jsp" %>
	</div>
	
	
	
	
	
</body>
</html>