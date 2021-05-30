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
#main {  background-color : #FFFFFF ;   padding-left : 0px;  width: 1200px ;height: 600px; margin: auto ; text-align: center ; }
#find_head{  font-size: 40px; width: 1200px; height: 50px;   }
#find{  position:relative ; height: 300px;  margin: 50px auto ;  width: 1200px}
#id_table{  height: 100px; position: absolute; left: 10% ;top :10%}
#pass_table{  height: 100px; position: absolute; left: 60% ;}
#id_button{ width:100px; margin-left: 30px ;   }
#pass_button{    width:100px;margin-left: 30px ;}
input{height : 35px; width : 200px}
</style>
<script type="text/javascript">

function findid(){
	if( $("#ID_name").val()==""){
		alert("이름 입력은 필수 입력입니다.");
		$("#ID_name").focus();
		return ;
	}
	if($("#ID_email").val()==""){
		alert("이메일 입력은 필수 입력입니다.");
		$("#ID_email").focus();
		return ;
	}
	$("#frmId").submit();
};

function findpass(){
	
	if( $("#PASS_name").val()==""){
		alert("이름 입력은 필수 입력입니다.");
		$("#PASS_name").focus();
		return;
	}; 

	if( $("#PASS_id").val()== ""){
		alert("아이디 입력은 필수 입력입니다.");
		$("#PASS_id").focus();
		return;
	};
	
	if( $("#PASS_email").val()== ""){
		alert("이메일 입력은 필수 입력입니다.");
		$("#PASS_email").focus();
		return;
	}; 
	$("#frmPass").submit();
};
</script>
</head>
<body>
<!--  top: 45%;  transform: translateX(-50%) translateY(-50%)  top: 45%;  transform: translateX(-50%) translateY(-50%) -->
   <div id="wrap">
   <%@ include file="../header.jsp" %>
		<div id ="main">
		<div  style ="background-color : #E4E4E4;height : 500px; padding : 20px" >
         <div id ="find_head">아이디 비밀번호 찾기</div>
         <div  id ="find">
         <div id = "change_infor" >
		 <form action="find_id_process.jsp" id="frmId" method="post">
            <table id ="id_table">
            	<tr>
            		<td colspan ="2">
            			<h2><strong>아이디 찾기</strong></h2>
            		</td>
            	</tr>
               <tr>
                  <td style="height : 60px; width : 100px; font-size: 20px; ">이름</td>
                  <td><input  type ="text"  name="ID_name"value ="" placeholder="이름 입력"/></td>
               </tr>
               <tr>
                   <td style="height : 60px; width : 100px; font-size: 20px; ">이메일</td>
                  <td> <input  type ="text"  name="ID_email" value ="" placeholder="이메일 입력"/></td>
               </tr>   
               <tr>
               		<td colspan ="2"  style="padding :10px"><button type="button" class="btn btn-default  btn-lg" id= "id_button" onclick="findid();">확인</button></td>
               </tr>   
            </table>  
          </form>  
		 <form action="find_process.jsp" id="frmPass" method="post">
            <table id ="pass_table">
            	<tr>
            		<td colspan ="2">
            			<h2><strong>비밀번호 찾기</strong></h2>
            		</td>
            	</tr>
               <tr>
                  <td style="height : 60px; width : 120px; font-size: 20px; ">이름</td>
                  <td><input  type ="text" id="PASS_name" name="PASS_name" value ="" placeholder="이름 입력"/></td>
               </tr>
               <tr>
                   <td style="height : 60px; width : 120px; font-size: 20px; ">아이디</td>
                  <td> <input  type ="text" id="PASS_id" name="PASS_id" value ="" placeholder="아이디 입력"/></td>
               </tr>   
               <tr>
                   <td style="height : 60px; width : 120px; font-size: 20px; ">이메일</td>
                  <td> <input  type ="text" id="PASS_email"  name="PASS_email" value ="" placeholder="이메일 입력"/></td>
               </tr>   
               <tr>
               		<td colspan ="2" style="padding :10px">
               			<button type="button" class="btn btn-default  btn-lg" id= "pass_button" onclick="findpass();">확인</button>
               		</td>
               </tr>   
            </table> 
   	</form>
         </div>
         </div>
   	</div>
   	</div>
		<%@ include file="../footer.jsp" %>
		</div>
</body>
</html>