<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberIdFindVO"%>
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
    
    <!-- JQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap -->
    <script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    
<style type="text/css">
	%>
</style>
<script type="text/javascript">
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("ID_name");
	String email = request.getParameter("ID_email");
	
	
	MemberIdFindVO mifVO = new MemberIdFindVO(name, email);
	
	MemberDAO mDAO = new MemberDAO();
	String id = mDAO.memberIdFind(mifVO);
	%>
		alert("<%=name %>님의 아이디는 <%=id%> 입니다.");
		location.href="login.jsp";
	<%
		if(id == null){
	%>
		alert("입력하신 정보가 일치하지 않습니다. 다시 한번 입력해주세요.");
		location.href='find.jsp';
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