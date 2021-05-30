<%@page import="vo.AdminVO"%>
<%@page import="dao.AdminDAO"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"    rel="stylesheet"    />
    <link href="http://localhost/movie_reservaion/common/css/adminHeaderFooter.css" rel= "stylesheet">
<style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
h1{text-align: center}
#main {     /* margin: auto 0; */  background-color : #FFFFFF ;    padding-left : 0px;  width : 1200px;       margin : 250px auto      }
td{height : 40px; font-size: 23px; width : 150px }
#login_table{ height: 180px; ;margin: 0px auto ; }
#login_button{   height: 110px; width: 100px; margin-left: 30px ;   }
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
	$("#adminloginFrm").submit();
};	
</script>
</head>

<body>
   <div id="wrap">
    <form  method="post" id="adminloginFrm"  action ="admin_login_process.jsp">
   		<div id ="main">
   			<!-- head -->
			 <div >
			 <h1>관리자 로그인</h1>
			 <br/>
			</div>
            <table id ="login_table">
               <tr>
               	<td id="id_pass_text" style = "padding :15px">아이디 </td>
                  <td><input  type ="text"  id= "id" name="id" value ="" placeholder="아이디 입력" tabindex="1"/></td>
                  <td rowspan ="2"><button type="button" class="btn btn-default" id= "login_button"  tabindex="3">로그인</button></td>
               </tr>
               <tr>	
               		<td  id="id_pass_text" style = "padding :15px">비밀번호 </td>
                   <td> <input  type ="password"  id="pass" name ="pass" value ="" placeholder="비밀번호 입력" tabindex="2"/></td>
               </tr>   
               <tr>	
               </tr>   
            </table>   
  	 </div>
  	 </form>
  	  </div>
</body>
</html>