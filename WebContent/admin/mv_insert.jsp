<%@page import="vo.MovieUpdateInsertVO"%>
<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style type="text/css">

</style>
<script type="text/javascript">

alert("추가되었습니다.");
window.onload=function(){
	window.close();
	opener.location.reload();
} 

</script>
</head>
<body>

<div>
<%
AdminMovieDAO amdao=AdminMovieDAO.getInstance();
String mvNo=request.getParameter("mv-no");
String mvPoster=request.getParameter("mv-poster");
String mvPosterSoon=request.getParameter("mv-poster-soon");
String mvTitle=request.getParameter("mv-title");
String mvGenre=request.getParameter("mv-genre");
String mvDirector=request.getParameter("mv-director");
String[] mvLead=request.getParameter("mv-lead").split(",");
String[] mvSub=request.getParameter("mv-sub").split(",");
String mvSt=request.getParameter("mv-story");
String mvRuntime=request.getParameter("mv-runtime");
String mvTrailer=request.getParameter("mv-trailer");
String mvOpendate=request.getParameter("mv-opendate");
String mvOpenornot=request.getParameter("opennot");
String mvRegdate=request.getParameter("mv-regdate");
String mvClosedate=request.getParameter("mv-closedate");

MovieUpdateInsertVO muiVO=new MovieUpdateInsertVO(mvNo,mvPoster,mvPosterSoon,mvTitle,mvDirector,mvLead,mvSub,mvSt,mvRuntime,mvTrailer,mvOpendate,mvOpenornot,mvGenre,mvClosedate);
amdao.insertMovie(muiVO);
%>

</div>

</body>
</html>

















    