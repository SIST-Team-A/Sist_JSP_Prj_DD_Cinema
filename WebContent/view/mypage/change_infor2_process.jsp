<%@page import="java.sql.SQLException"%>
<%@page import="vo.SelectUpdateMemberVO"%>
<%@page import="dao.MemberDAO"%>
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
<%
String id =(String)session.getAttribute("id");

MemberDAO mDAO = new MemberDAO();

request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
String emailId = request.getParameter("emailid");
String domain = request.getParameter("domain");

String email = emailId +"@"+domain;
String id2 =(String)session.getAttribute("id");

if(session.getAttribute("id")!=null){
	SelectUpdateMemberVO sumVO=new SelectUpdateMemberVO( id2,name, gender, birth, phone, email);
		mDAO.updateMember(sumVO);
		%> 
		alert("정보가 수정 되었습니다.");
		location.href='mypage_main.jsp';<%
}else{
System.out.print("실패") ;
}
%>
</script>
</head>
<body>
<div >
</div>
</body>
</html>
