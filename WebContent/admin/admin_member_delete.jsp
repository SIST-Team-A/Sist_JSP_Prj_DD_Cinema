<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.AdminMemberDAO"%>

<%

	request.setCharacterEncoding("UTF-8");
	int cnt=0;
	String id = request.getParameter("modal_id");
	
	AdminMemberDAO admDAO = new AdminMemberDAO();
	
	cnt = admDAO.delectMember(id);
	if(cnt > 0 ){
		%>
		<script type="text/javascript">
		location.href="admin_member_main.jsp";
		</script>
		
		<%
	}
	
%>

