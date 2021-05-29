<%@page import="org.json.simple.JSONObject"%>
<%@page import="vo.AdminMemberVO"%>
<%@page import="dao.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AdminMemberDAO amDAO = new AdminMemberDAO();
	String id = request.getParameter("id");
	AdminMemberVO amVO = amDAO.selectMember(id);
	JSONObject json = new JSONObject();
	
	json.put("id",id);
	json.put("num", amVO.getMemNo());
	json.put("name", amVO.getMemName());
	json.put("birth", amVO.getMemBirth());
	json.put("gender", amVO.getMemGender());
	json.put("email", amVO.getMemEmail());
	json.put("phone", amVO.getMemPhone());
	json.put("regdate",amVO.getMemRegdate());
	
	String jsonString = json.toJSONString();
	out.println(jsonString);
%>