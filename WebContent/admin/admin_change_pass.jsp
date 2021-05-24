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
    <link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 	<script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
 	<link href="http://localhost/sec_project/admin/adminHeaderFooter.css" rel= "stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"      rel="stylesheet"    />
<style type="text/css">
h1{text-align: center}
body{font-family: "Noto Sans KR", sans-serif;}
#login_table{ height:400px; width : 500px;left-padding :100px; margin: 0 auto}
td{height : 40px; font-size: 23px; width : 170px }
#btn{width : 120px ; height : 40px; margin :25px;}
button{ position:absolute; top:50%; left:50%;  width:120px; height:30px; margin-top:-15px; margin-left:-60px;
}


</style>

<script type="text/javascript">

function change(){
var obj = document.frm;
if ( obj.pass.value == obj.pass1.value){
	alert ("비밀번호가 변경 되었습니다");
	location.href="admin_login.jsp" ;
}else {
	alert ("잘못된 정보입니다. 다시 입력 해주세요");
	obj.pass.value="";
	obj.pass1.value="";
}
};

</script>
 <script type="text/javascript">
</script>
</head>

<body>
   <div id="wrap">
   <%@ include file="adminHeader.jsp" %>
<form action="#" name = "frm">
			<div id ="main" >
   			<!-- head -->
			 
            <table id ="login_table">
            	<tr>
					<td colspan="2"  style="text-align : center ;">
					<h1>비밀번호 변경</h1>
					 <br/>
					</td>
				</tr>
               <tr>
					<td>비밀번호 </td><td><input	type="password"  id="pass" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>	<td><input	type="password"  id="pass1" placeholder="비밀번호 확인" /></td>
				</tr>
				<tr>
					<td colspan="2"  style="text-align : center ;">
					<input type="button" value="확인"	class="btn btn-default"   id="btn"  onclick="change();" />
					</td>
				</tr>
            </table>  
         </div>
   </form>
         <%@ include file="adminFooter.jsp" %>
   </div>
</body>

</html>