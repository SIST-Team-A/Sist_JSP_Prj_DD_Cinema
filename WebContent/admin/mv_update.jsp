<%@page import="vo.MovieUpdateInsertVO"%>
<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>

    <!-- botstrap -->
    <link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    <!-- botstrap -->
    <script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    
<style type="text/css">

</style>

<script type="text/javascript">
window.onload=function(){
	alert("넘어왔네");
}
</script>
</head>
<body>

<div>
<%

	request.setCharacterEncoding("UTF-8");
	AdminMovieDAO amdao=AdminMovieDAO.getInstance();
	String mvNo=request.getParameter("mv-no");
	String mvTitle=request.getParameter("mv-title");
	String mvPoster=request.getParameter("mv-poster-cur");
	String mvDirector=request.getParameter("mv-director");
	String mvSt=request.getParameter("mv-story");
	String mvTrailer=request.getParameter("mv-trailer");
	String mvOpendate=request.getParameter("mv-opendate");
	String mvRuntime=request.getParameter("mv-runtime");
	String mvOpenornot=request.getParameter("opennot");
	if(mvOpenornot.equals("on")){
		mvOpenornot="O";
	}
	MovieUpdateInsertVO muiVO=new MovieUpdateInsertVO(mvNo,mvPoster,mvTitle,mvDirector,mvSt,mvRuntime,mvTrailer,mvOpendate,mvOpenornot);
	amdao.updateMovie(muiVO); 
%>
<%=mvOpenornot %>
</div>

</body>
</html>

















    