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
	String Name = request.getParameter("PASS_name");
	String Id = request.getParameter("PASS_id");
	String Pass = request.getParameter("PASS_email");
	
	MemberPassFindVO mpfVO = new MemberPassFindVO(Name,Id,Pass);
	
	MemberDAO mDAO = new MemberDAO();
	boolean result = mDAO.memberPassFind(mpfVO);
	if(result==true){
		%>
		location.href='find_pass_reset.jsp';
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