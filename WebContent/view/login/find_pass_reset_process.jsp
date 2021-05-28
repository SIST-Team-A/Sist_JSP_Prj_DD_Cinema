<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberPassUpdateVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("getName");
		String id = request.getParameter("getId");
		String email = request.getParameter("getEmail");
		
		String pass = request.getParameter("pass");
		String conPass = request.getParameter("con_pass");
		
		MemberPassUpdateVO mpuVO = new MemberPassUpdateVO(name,id,email,pass);
		
		MemberDAO mDAO = new MemberDAO();
		boolean result = mDAO.memberPassReset(mpuVO);
		
		if(result==true){
		%>
		location.href="../main.jsp";
		<%	
		}
		%>
		
</script>
<body>
</body>
</html>