<%@page import="vo.AdminMemberVO"%>
<%@page import="dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="vo.AdminMemberMainVO"%>
<%@page import="java.util.List"%>
	
	<%
	request.setCharacterEncoding("UTF-8");

	AdminMemberDAO amDAO = new AdminMemberDAO();
	List<AdminMemberMainVO> list = new ArrayList<AdminMemberMainVO>();
	list = amDAO.selectMemberAll();
	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- bootstrap -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="http://localhost/movie_reservation/common/css/adminHeaderFooter.css"  rel="stylesheet">
    
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
		
		#modal .close-area {
            display: inline;
            float: right;
            margin-right: 50px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: black;
        }
			   
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
		
		$("table tbody tr").click(function(e) {
			let targetId = e.target.parentElement.id;
			$.ajax({
				type:"get",
				async:true,
				url:"admin_member_json.jsp",
				data:{id:$("#"+targetId+" .ta_id").text()},
				dataType:"json",
				success:function(json){
					$("#modal_num").val(json.num);
					$("#modal_id").val(json.id);
					$("#modal_name").val(json.name);
					$("#modal_birth").val(json.birth);
					$("input:radio[name='gender'][value="+json.gender+"]").prop("checked",true);
					$("#modal_email").val(json.email);
					$("#modal_phone").val(json.phone);
					$("#modal_reg_date").val(json.regdate);
				},
				error:function(){
					alert("정보를 가져오던 중 문제가 발생하였습니다.");
				}
			});
			
			$("#modal").fadeIn();//attr("style", "display:block");//modal
		});//click
		
		
		$("#modal_edit_btn").click(function() {
			var edit=confirm("수정하시겠습니까?");
			if(edit){
				$("#modal_frm").submit();
				
			}else{
				return;
			}
		});//click
		
		$("#modal_delete_btn").click(function() {
			var del = confirm("삭제하시겠습니까?");
			if(dal){
				$("#modal_frm").submit();
			}else{
				return;
			}
			
		});//click
		
		$("#modal_close_btn").click(function() {
			$("#modal").fadeOut();//attr("style", "display:none");//modal
		});//click
		
		$(".close-area").click(function() {
			$("#modal").fadeOut();//attr("style", "display:none");//modal
		});//click
		
		//window.addEventListener("keyup", function() {
		//	$("#modal").fadeOut();//attr("style", "display:none");//modal
		//});    ESC누르면 자동으로 나가
		
		
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
		<%for(int i=0;i<list.size();i++){ %>
			<tr id="tr_<%=i%>">
				<td class="ta_num"><%= list.get(i).getMemNo()%></td>
				<td class="ta_id"><%= list.get(i).getMemId()%></td>
				<td class="ta_name"><%= list.get(i).getMemName()%></td>
				<td class="ta_birth"><%= list.get(i).getMemBirth()%></td>
			</tr>
			<%
			} 
			%>
			<tr>
			</tbody>
		</table>
		
		<!-- 모달  -->
		<div id="modal">
			<div class="modal_content">
				<div id="selectTitle">회원관리</div>
				 <div class="close-area" id="close-area">X</div>
				 <form id="modal_frm" method="post">
				
				<table id="selectTa"> 
					<tr>
						<th>번호</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf" id="modal_num" name="modal_num" value=""></td>
					</tr>		
					<tr>
						<th>아이디</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf" id="modal_id" name="modal_id"></td>
					</tr>			
					<tr>
						<th>이름</th>
						<td><input type="text" id="modal_name" name="modal_name"></td>
					</tr>		
					<tr>
						<th>생년월일</th>
						<td><input type="text" id="modal_birth" name="modal_birth"></td>
					</tr>		
					<tr>
						<th>성별</th>
						<td><input type="radio" name="gender" value="M">남 <input type="radio" name="gender" value="F">여</td>
					</tr>		
					<tr>
						<th>이메일</th>
						<td><input type="text" id="modal_email" name="modal_email"></td>
					</tr>		
					<tr>
						<th>연락처</th>
						<td><input type="text" id="modal_phone" name="modal_phone"></td>
					</tr>		
					<tr>
						<th>가입일</th>
						<td><input type="text" readonly="readonly" style="background-color: #dfdfdf" id="modal_reg_date" name="modal_reg_date"></td>
					</tr>		
				</table>
				<div id="grBtn">
					<input type="submit" class="btn btn-primary btn-lg" value="수정" id="modal_edit_btn" formaction="admin_member_modify.jsp"/>
					<input type="submit" class="btn btn-danger btn-lg" value="삭제" id="modal_delete_btn" formaction="admin_member_delete.jsp"/>
					<input type="button" class="btn btn-default btn-lg" value="취소" id="modal_close_btn"/>
				</div>
				 </form>
			</div>
			<div class="modal_layer"></div>
		</div>
		</div>
	 <%@ include file="adminFooter.jsp" %>
	</div>
</body>
</html>