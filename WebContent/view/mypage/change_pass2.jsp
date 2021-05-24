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
#main {  background-color : #FFFFFF ;   padding-left : 0px;  width: 600px ;height: 400px; margin: auto ; }

#body_head{  font-size: 30px ;   }

a{color:black ;background-color: transparent !important;  }
li:hover{border-bottom : 1px solid #E89795 } 

table{height : 100px; width : 500px; margin: 50px auto; text-align: center}
td{height : 60px; width:600px; font-size: 20px;   }
#btn{width : 120px ;margin :25px;  }
</style>

<script type="text/javascript">
function changepass(){
	
	var obj = document.frm;
	
	if(obj.con_pass.value == obj.pass.value){
		alert("비밀번호가 변경되었습니다.");
		window.close();  
	}else{
		alert("잘못된 정보입니다. 다시 입력 해 주세요 !");
		obj.pass.value="";
		obj.con_pass.value="";
	}
	
};
</script>
</head>
<body>
		<div id="wrap">
		 <form action="#" name = "frm">
		<div id ="main">
			<div style ="background-color : #E4E4E4; height : 400px; width : 600px; padding : 20px">
			<table >
			<tr>
			<td colspan="2">
			<h1>비밀번호 변경</h1>
			<br/>
			</td>
			</tr>
				<tr>
					<td>비밀번호 </td>
					<td><input	type="password" name="pass" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input	type="password" name="con_pass"placeholder="비밀번호 확인" /></td>
				</tr>
				<tr>
					<td colspan="2"  style="text-align: center;"><input type="button" value="확인"	class="btn btn-default  btn-lg""  id="btn" onclick="changepass()" /></td>
				</tr>
			</table>
			</div>
		</div>
		</form>
		</div>
</body>
</html>