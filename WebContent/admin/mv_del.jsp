<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style type="text/css">
</style>

<script type="text/javascript">

alert("삭제되었습니다.");
window.onload=function(){
	window.close();
	opener.location.reload();
} 

</script>
</head>
<body>

<div>
<%
AdminMovieDAO amdao=AdminMovieDAO.getInstance();
String mvNO=request.getParameter("delNum");
amdao.deleteMovie(mvNO);
%>
</div>

</body>
</html>
  