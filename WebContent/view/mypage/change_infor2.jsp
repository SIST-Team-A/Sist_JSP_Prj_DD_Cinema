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
 	
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"      rel="stylesheet"  />
     
<style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
#main {  background-color : #FFFFFF ;    padding-left : 0px;  width: 1200px ;height: 600px; margin: 10px auto ; }
#body_head{  font-size: 30px ;   }

a{color:black ;background-color: transparent !important;  }
li:hover{border-bottom : 1px solid #E89795 } 

table{width : 100%;border-top: 2px solid #333; margin: 50px auto;}
td{width : 200px; height : 50px;font-size :20px ;border-bottom: 1px solid #C8C8C8; color : #747474; }
#btn{width : 120px ;margin :25px}
</style>

<script type="text/javascript">
function changeinfor(){
	var obj = document.frm ;
	answer = confirm("정보를 수정 하시겠습니까?");
if(answer){
	if(obj.Name.value==""){
		alert("이름 필수입력");
		obj.Name.focus();
	}else	if(obj.Birth.value==""){
		alert("생일 필수입력");
		obj.Birth.focus();
	}else	if(obj.Phone.value==""){
		alert("폰번호 필수입력");
		obj.Phone.focus();
	}else if(obj.Email.value==""){
		alert("이메일 필수입력");
		obj.Email.focus();
	}else	if(obj.gender.value==""){
		alert("성별 필수입력");
		obj.gender.focus();
	}else{
		alert("정보가 수정 되었습니다.");
		location.href="../log/login.jsp" ;
	}
 }else{
	 location.href="change_infor1.jsp" ;
 }
}
</script>
</head>
<body>
<div id="wrap">
<%@ include file="../header.jsp" %>
<form action="#" name = "frm">
	<div id ="main">
	   	  <div id="body_head">My page > 정보 수정</div>
  		  <div id="navibar">
     		 <ul class="nav nav-pills" style="display: table;  ">
      			<li role="presentation"><a href="mypage_res_detail.jsp">예매내역</a></li>
    		    <li role="presentation" ><a href="change_infor1.jsp">정보 수정</a></li>
    		    <li role="presentation" ><a href="change_pass1.jsp" >비밀번호 변경</a></li>
    		  </ul>
		  </div>
	
	<div id = "change_infor"  style ="height : 500px; padding : 20px">
		<table >
		  <tr >
		  		<td>아이디</td>
		  		<td><input type ="text" name="id" readonly="readonly" style="border-color : #C8C8C8 ;background-color: #C8C8C8 "/> </td>
		  </tr>
		  <tr >
		  		<td>이름</td>
		  		<td><input type ="text" name="Name"  placeholder="이름"/> </td>
		  </tr>
		  <tr >
		  		<td>성별</td>
		  		<td> <input type ="radio" name="gender" value= "M" checked ="checked"/>남자
						<input type ="radio" name="gender" value= "F" />여자</td>
		  </tr>
		  <tr >
		  		<td>생년월일</td>
		  		<td><input type ="text" name ="Birth"  placeholder="생년 월 일 "/> </td>
		  </tr>
		  <tr >
		  		<td>연락처</td>
		  		<td><input type ="text" name ="Phone"  placeholder="연락처"/> </td>
		  </tr>
		  <tr >
		  		<td>이메일 </td>
		  		<td style="width : 500px" ><input type ="text"   name ="Email" placeholder="이메일"/> @ 
		  		<select name = "domain" size="1">
				<option value="daum.net">다음</option>
				<option value="naver.com">네이버</option>
				<option value="google.com" >지메일 </option>
				<option value="hotmail.com">핫메일</option>
				</select>
		  		 </td>
		  </tr>
		  <tr>
		 	 <td   id="btn" colspan="2" style="border-bottom: 0px solid #333; text-align:center ;" ><br/>
				<input type ="button" value ="수정" class="btn btn-default btn-lg" 
				style="width : 120px ;background-color: #828282 ; color : white "  onclick="changeinfor()"/> 
			</td>
		  </tr>
		</table>
		</div>
	</div>
	</form>
	<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>
