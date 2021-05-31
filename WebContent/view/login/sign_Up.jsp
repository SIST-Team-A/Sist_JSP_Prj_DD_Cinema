<%@page import="java.sql.SQLException"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.InsertMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
 <!-- 부트스트랩 -->
    <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 	<script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
 	
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"      rel="stylesheet"    />    
<style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
#main {     /* margin: auto 0; */  background-color : #FFFFFF ;    padding-left : 0px;  width : 900px;       margin : 10px auto      }

#body_head{  font-size: 30px ;   }
table{width : 100%;border-top: 2px solid #333}
td{width : 200px; height : 60px;font-size :20px ;border-bottom: 1px solid #C8C8C8; color : #747474; }
#btn{width : 120px ;margin :25px}

</style>

<script type="text/javascript">
function signup(){
	var obj = document.frm;
		if(obj.Id.value==""){
		alert("아이디 필수입력");
		obj.Id.focus();
		}else if(obj.Pass.value==""){
			alert("비밀번호 필수입력");
			obj.Pass.focus();
		}else if(obj.ch_Pass.value==""){
			alert("비밀번호 확인 필수입력");
			obj.ch_Pass.focus();
		}else if(obj.Name.value==""){
			alert("이름 필수입력");
			obj.Name.focus();
		}else if(obj.Birth.value==""){
			alert("생일 필수입력");
			obj.Birth.focus();
		}else if(obj.Phone.value==""){
			alert("폰번호 필수입력");
			obj.Phone.focus();
		}else if(obj.EmailId.value==""){
			alert("이메일 필수입력");
			obj.EmailId.focus();
		}else if(obj.Gender.value==""){
			alert("성별 필수입력");
			obj.Gender.focus();
		}else{
			$("#frm").submit();
		}
	};
	
	
	<%	
	request.setCharacterEncoding("UTF-8");
	int cnt=0;
	String Id = request.getParameter("Id");
	String Pass = request.getParameter("Pass");
	String Name = request.getParameter("Name");
	String Gender = request.getParameter("Gender");
	String Birth = request.getParameter("Birth");
	String Phone = request.getParameter("Phone");
	String EmailId = request.getParameter("EmailId");
	String Domain = request.getParameter("Domain");
	
	String email = EmailId+"@"+Domain;
	
	InsertMemberVO imVO=new InsertMemberVO(Id, Pass, Name, Gender, Birth,Phone,email);
	
	MemberDAO mDAO = new MemberDAO();
	try{
		cnt=mDAO.insertMember(imVO);
		if(cnt>0){
		%>
			alert("회원가입이 완료되었습니다.");
			location.href="login.jsp"
		<% 
		
		}else if (cnt<=0){
		}
	}catch(SQLException se){
		se.printStackTrace();
		
	}
	
	%>
</script>
</head>
<body>
		<div id="wrap">
		<%@ include file="../header.jsp" %>
		 <form action="sign_Up.jsp" name = "frm" method = "post" id="frm">
		<div id ="main">
				<h3>
					<strong>인증 정보입력 </strong>
				</h3>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="Id" placeholder="아이디" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="Pass" placeholder="비밀번호" />
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="ch_Pass"
							placeholder="비밀번호 확인" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="Name" placeholder="이름" /></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="radio" name="Gender" value="M"
							checked="checked" />남자 <input type="radio" name="Gender"
							value="F" />여자</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="Birth" placeholder="생년월일 " /></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="Phone" placeholder="연락처" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td style="width: 500px"><input type="text" name="EmailId"
							placeholder="이메일" /> @ <select name="Domain" size="1">
								<option value="null">--이메일선택--</option>
								<option value="daum.net">daum.net</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="sist.co.kr">sist.co.kr</option>
						</select></td>
					</tr>
					<tr>
						<td id="btn" colspan="2"style="border-bottom: 0px solid #333; text-align: center;">
							<br />
							<input type="button" value="가입" class="btn btn-default btn-lg"		style="width: 120px; "  onclick="signup()"/> 
					</tr>
				</table>

			</div>
			</form>
	<%@ include file="../footer.jsp" %>
		</div>
</body>
</html>

	