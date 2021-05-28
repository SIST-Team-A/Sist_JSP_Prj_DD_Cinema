<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberPassFindVO"%>
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
	String name = request.getParameter("PASS_name");
	String id = request.getParameter("PASS_id");
	String email = request.getParameter("PASS_email");
	
	MemberPassFindVO mpfVO = new MemberPassFindVO(name,id,email);
	
	MemberDAO mDAO = new MemberDAO();
	boolean result = mDAO.memberPassFind(mpfVO);
	if(result==true){
		%>
		<jsp:forward page="find_pass_reset.jsp">
			<jsp:param name="PASS_name" value = "<%=name%>"/>
			<jsp:param name="PASS_id" value = "<%=id%>"/>
			<jsp:param name="PASS_email" value = "<%=email%>"/>
		</jsp:forward>
		/* location.href='find_pass_reset.jsp'; */
		<%
	}else{
		%>
		alert("입력하신 정보가 일치하지 않습니다. 다시 한번 입력해주세요.");
		location.href='find.jsp';
		<%
	}
	%>
	
</script>
<body>
	<div>
	
	</div>

</body>
</html>