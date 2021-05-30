<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.AdminMemberDAO"%>

<%

	request.setCharacterEncoding("UTF-8");
	String id     = request.getParameter("modal_id");
	String name   = request.getParameter("modal_name");
	String birth  = request.getParameter("modal_birth");
	String gender = request.getParameter("gender");
	String email  = request.getParameter("modal_email");	
	String phone  = request.getParameter("modal_phone");
	
	AdminMemberDAO admDAO = new AdminMemberDAO();
	
	boolean result = admDAO.delectMember(id);
	
%>

