<%@page import="dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%
	String res_num = request.getParameter("res_num");
	ReservationDAO rDAO = new ReservationDAO();
	
	rDAO.delectReservation(res_num);
	


%>
	alert("예매가 취소되었습니다.");
	location.href="mypage_main.jsp";

</script>
</head>
<body>

</body>
</html>