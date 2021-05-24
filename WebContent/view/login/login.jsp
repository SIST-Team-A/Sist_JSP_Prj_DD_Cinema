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
 	
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"      rel="stylesheet"    />
 <style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
h1{text-align: center}
#main {     /* margin: auto 0; */  background-color : #FFFFFF ;    padding-left : 0px;  width : 1200px;       margin : 10px auto      }
#login_table{ height: 180px; ;margin: 0px auto ; }
#login_button{   height: 100px; width: 100px; margin-left: 30px ;   }
input{height : 35px; }
</style>

<script type="text/javascript">

function login(){
	var obj = document.frm;
	var iddata =12;
	var passdata =12;
	if(obj.id.value==""){
		alert("아이디를 입력하세요!");
	}else if(obj.pass.value==""){
		alert("비밀번호를 입력하세요!");
	}else{
	if((iddata==obj.id.value)&(passdata==obj.pass.value)){
				alert("로그인 성공");
				location.href="#" ;
	}else{
		alert("잘못된 정보입니다. 다시 입력 해 주세요 !");
	}
	}
}
</script>
</head>
<body>
   <div id="wrap">
   <%@ include file="../header.jsp" %>
   <form action="#" name = "frm">
		<div id ="main">
			<div  style ="background-color : #E4E4E4 ; width : 100%;  ;height : 500px; padding : 80px;  ">
			<h1 >회원 로그인</h1>
			<br/>
            <table id ="login_table">
               <tr>
                  <td style="height : 60px; width : 100px; font-size: 20px; ">아이디</td>
                  <td><input  type ="text"  name="id" value ="" placeholder="아이디 입력"/></td>
                  <td rowspan ="2"><button type="button" class="btn btn-default btn-lg" id= "login_button" onclick=" login()">로그인</button></td>
               </tr>
               <tr>
                   <td style="height : 60px; width : 100px; font-size: 20px; ">비밀번호</td>
                  <td> <input  type ="text"  name="pass"value ="" placeholder="비밀번호 입력"/></td>
               </tr>   
               <tr>
               		<td colspan="3"  style="text-align : center"><a href="http://localhost/sec_project/find.jsp"> 아이디 비밀번호 찾기</a> | <a href="http://localhost/sec_project/sign_Up.jsp"> 회원가입</a> </td>
               </tr>   
            </table>   
         </div>
         </div>
         </form>
   <%@ include file="../footer.jsp" %>
   </div>
</body>
</html>