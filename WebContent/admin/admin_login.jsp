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
    <link href="http://localhost/movie_reservation/common/css/adminHeaderFooter.css" rel= "stylesheet">
<style type="text/css">
body{font-family: "Noto Sans KR", sans-serif;}
h1{text-align: center}
#main {     /* margin: auto 0; */  background-color : #FFFFFF ;    padding-left : 0px;  width : 1200px;       margin : 10px auto      }
td{height : 40px; font-size: 23px; width : 150px }
#login_table{ height: 180px; ;margin: 0px auto ; }
#login_button{   height: 100px; width: 100px; margin-left: 30px ;   }
input{height : 35px; }
</style>

<script type="text/javascript">
function login(){
	var obj = document.frm;
	var iddata = 12;
	var passdata = 12;
	if(obj.id.value==""){
		alert("아이디를 입력하세요!");
	}else if(obj.pass.value==""){
		alert("비밀번호를 입력하세요!");
	}else{
	if(iddata==obj.id.value){
		if(passdata==obj.pass.value){
				alert("로그인 성공");
				location.href="#" ;
		}
	}else{
		alert("잘못된 정보입니다. 다시 입력 해 주세요 !");
	}
	}
}
</script>
</head>

<body>
   <div id="wrap">
    <%@ include file="adminHeader.jsp" %>
    <form action="#" name = "frm">
   		<div id ="main" >
   			<!-- head -->
			 <div >
			 <h1>관리자 로그인</h1>
			 <br/>
			</div>
            <table id ="login_table">
               <tr>
               	<td id="id_pass_text" style = "padding :15px">아이디 </td>
                  <td><input  type ="text"  name="id" value ="" placeholder="아이디 입력"/></td>
                  <td rowspan ="2"><button type="button" class="btn btn-default" id= "login_button"  onclick="login()">로그인</button></td>
               </tr>
               <tr>	
               		<td  id="id_pass_text" style = "padding :15px">비밀번호 </td>
                   <td> <input  type ="password"  id="pass" value ="" placeholder="비밀번호 입력"/></td>
               </tr>   
               <tr>	
               		<td  colspan="3" style="text-align: center"><br/><a href="admin_change_pass.jsp " >비밀번호 변경</a></td>
               </tr>   
            </table>   
  	 </div>
  	 </form>
  	  <%@ include file="adminFooter.jsp" %>
  	  </div>
</body>
</html>