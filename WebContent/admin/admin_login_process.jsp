<%@page import="dao.AdminDAO"%>
<%@page import="vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title></title>
 <!-- bootstrap -->
 <link href="http://localhost/movie_reservation/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">

 <!-- jQuery CDN(Contents Delivery Network) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- bootstrap -->
<script src="http://localhost/movie_reservation/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	AdminVO aVO=new AdminVO(id,pass);
	//DAO단의 클래스를 사용하여 DB작업 수행
	AdminDAO aDAO=new AdminDAO();
	boolean result= aDAO.adminLogin(aVO); //DB
	if(result ){
		session.setMaxInactiveInterval(60*60);//요청이 끝난 다음에 다음 요청이 발생하기전까지의 시간.
		session.setAttribute("id",id);//세션에 값을 저
		response.sendRedirect( "admin_cur_movie.jsp");
	}else{
%>
		alert("아이디 비밀번호를 확인해주세요.")
		location.href = "admin_login.jsp";
<%
	}
%>
</script>
</head>
<body>
<div>

</div>
</body>
</html>