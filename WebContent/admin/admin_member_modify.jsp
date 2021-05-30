<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="vo.AdminUpdateMemberVO"%>
<%@page import="dao.AdminMemberDAO"%>

<%

	request.setCharacterEncoding("UTF-8");
	String id     = request.getParameter("modal_id");
	String name   = request.getParameter("modal_name");
	String birth  = request.getParameter("modal_birth");
	String gender = request.getParameter("gender");
	String email  = request.getParameter("modal_email");	
	String phone  = request.getParameter("modal_phone");

	AdminUpdateMemberVO aumVO = new AdminUpdateMemberVO(id,name,birth,gender,email,phone);
	
	AdminMemberDAO admDAO = new AdminMemberDAO();
	
	int cnt = admDAO.updateMember(aumVO);
	if(cnt > 0 ){
		%>
		<script type="text/javascript">
		location.href="admin_member_main.jsp";
		</script>
		
		<%
	}
	
%>

<%=id  %> <%= gender %>