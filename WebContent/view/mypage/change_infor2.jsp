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
$(function(){
	$("#id").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});
	$("#name").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#gender").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#birth").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#phone").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#email").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#btn").click(function(){ 
		chkNull();
	});
});
function chkNull(){
	
	if( $("#name").val() ==""){
		alert("이름는 필수 입력");
		$("#name").focus();
	return;
	}//end if
	if( $("#gender").val() ==""){
		alert("성별는 필수 입력");
		$("#gender").focus();
	return;
	}//end if
	if( $("#birth").val() ==""){
		alert("생일은 필수 입력");
		$("#birth").focus();
	return;
	}//end if
	if( $("#phone").val() ==""){
		alert("전화번호는 필수 입력");
		$("#phone").focus();
	return;
	}//end if
	if( $("#email").val() ==""){
		alert("이메일은 필수 입력");
		$("#email").focus();
	return;
	}//end if
	$("#frm").submit();
};
function home(){
		location.href="../main.jsp" ;
}

</script>
</head>
<body>
<div id="wrap">
<%@ include file="../header.jsp" %>
<form action="change_infor2_process.jsp" method="post" id= "frm">
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
		  		<td><input type ="text" id="id" name="id" readonly="readonly" value ="<%=(String)session.getAttribute("id")%>"style="border-color : #C8C8C8 ;background-color: #C8C8C8 "/></td>
		  </tr>
		  <tr >
		  		<td>이름</td>
		  		<td><input type ="text" id="name" name="name"  placeholder="이름"/> </td>
		  </tr>
		  <tr >
		  		<td>성별</td>
		  		<td> <input type ="radio" id="gender" name="gender" value= "M" checked ="checked"/>남자
						<input type ="radio" id="gender" name="gender" value= "F" />여자</td>
		  </tr>
		  <tr >
		  		<td>생년월일</td>
		  		<td><input type ="text" id="birth"  name ="birth"  placeholder="생년 월 일 "/> </td>
		  </tr>
		  <tr >
		  		<td>연락처</td>
		  		<td><input type ="text" id="phone" name ="phone"  placeholder="연락처"/> </td>
		  </tr>
		  <tr >
		  		<td>이메일 </td>
		  		<td style="width : 500px" ><input type ="text"  id= "emailid" name ="emailid" placeholder="이메일"/> @ 
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
				style="width : 120px ;background-color: #828282 ; color : white " name="btn" id="btn" /> 
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
