<%@page import="com.sun.jdi.Location"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberLoginVO"%>
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
 <link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">

 <!-- jQuery CDN(Contents Delivery Network) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- bootstrap -->
<script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
<%
String id =(String)session.getAttribute("id");
System.out.print(id);
String pass=request.getParameter("inpass");
MemberLoginVO mlVO=new MemberLoginVO(id,pass);
//DAO단의 클래스를 사용하여 DB작업 수행
MemberDAO mDAO=new MemberDAO();
boolean result= mDAO.memberLogin(mlVO); //DB
if(result){%>
	location.href ="change_infor2.jsp";
	<%}else{%>
	alert("비밀번호를 확인해주세요.");
	<%}
%>
</script>
</head>
<body>
<div>
</div>
</body>
</html>