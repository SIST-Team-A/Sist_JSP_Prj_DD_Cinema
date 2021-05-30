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
    <link href="common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!--  jQuery CDN(contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--  bootstrap  -->
 	<script src="common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"      rel="stylesheet"    />
     
 <style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
h1{text-align: center}
#main {     /* margin: auto 0; */  background-color : #FFFFFF ;    padding-right : 150px;  width : 1200px;       margin : 0px auto      }
#login_table{ height: 180px; ;margin: 0px auto ; }
#login_button{   height: 100px; width: 100px; margin-left: 30px ;   }
input{height : 35px; }
</style>

<script type="text/javascript">
$(function(){
	$("#id").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#pass").keydown(function(evt){ 
		if(evt.which == 13){
			chkNull();
		}//end if
	});	
	$("#login_button").click(function(){ 
		chkNull();
	});	
});

function chkNull(){
	if( $("#id").val() ==""){
		alert("아이디는 필수 입력");
		$("#id").focus();
		return;
	}//end if
	if( $("#pass").val() ==""){
		alert("비밀번호는 필수 입력");
		$("#pass").focus();
		return;
	}//end if
	$("#loginFrm").submit();
}//chkNull
</script>
</head>
<body>
   <div id="wrap">
   <%@ include file="../header.jsp" %>
   <form method="post" id="loginFrm"  action ="login_process.jsp">
		<div id ="main">
			<div  style ="background-color : #E4E4E4 ; width : 100%;  ;height : 300px; padding : 80px;  ">
			<h1 >회원 로그인</h1>
			<br/>
            <table id ="login_table">
               <tr>
                  <td style="height : 60px; width : 100px; font-size: 20px; ">아이디</td>
                  <td><input  type ="text"  id=id name="id" value ="" placeholder="아이디 입력"/></td>
                  <td rowspan ="2"><input type="button"  class="btn btn-default btn-lg"  id= "login_button"  tabindex="3" value="로그인"/></td>
               </tr>
               <tr>
                   <td style="height : 60px; width : 100px; font-size: 20px; ">비밀번호</td>
                  <td> <input  type ="password"  id ="pass" name="pass"value ="" placeholder="비밀번호 입력"/></td>
               </tr>   
               <tr>
               		<td colspan="3"  style="text-align : center"><a href="http://localhost/movie_reservation/view/login/find.jsp"> 아이디 비밀번호 찾기</a> | <a href="http://localhost/movie_reservation/view/login/sign_Up.jsp"> 회원가입</a> </td>
               </tr>   
            </table>   
         </div>
         </div>
         </form>
   <%@ include file="../footer.jsp" %>
   </div>
</body>
</html>