<%@page import="java.util.ArrayList"%>
<%@page import="vo.AdminMovieMainVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="dao.AdminMovieDAO" %>
     <% 
     AdminMovieDAO amdao=AdminMovieDAO.getInstance();
     List<AdminMovieMainVO> soonList =new ArrayList<AdminMovieMainVO>(); 
 
  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>    
    <link href="../common/css/adminHeaderFooter.css" rel="stylesheet"/>
    <link href="../common/css/adminModal.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  
    <style>   
    </style>
 
    <script>
    
 window.onload=function(){

    function showPopup(){
		var xPos = (document.body.offsetWidth/2) - (750/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (document.body.offsetHeight/2) - (500/2);
		window.open("", "popupwin", "width=750, height=1200,left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes"); 	
    }
    
    <% for(int i=0; i<amdao.selectMovieAll("N").size();i++){%>
   $("#table tbody #tr<%=i%>").click(function(){
		showPopup();
		$("#myform<%=i%>").submit();
   });  
   <%}%>
   
    $("#addBtn").click(function(){
    	var xPos = (document.body.offsetWidth/2) - (750/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (document.body.offsetHeight/2) - (500/2);
		window.open("admin_popup_add.jsp", "addPopup", "width=750, height=1200,left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes"); 	 	
    });
   
 };    
    </script>
  </head>
  <body>
    <div id="wrap">
<%@ include file="adminHeader.jsp" %>
      <div id="main">
        <div id="table-header">개봉예정작품</div>

        <div id="table-area">
          <table id="table">
          <tbody>
            <tr id="table-bar">
              <td class="title-bar">번호</td>
              <td class="title-bar">영화제목</td>
              <td class="title-bar">감독</td>
              <td class="title-bar">출연</td>
            </tr>
                 	<%soonList=amdao.selectMovieAll("N");
                for(int i=0; i<soonList.size();i++){%>
             <form id="myform<%=i %>" method="post" action="admin_popup_soon.jsp" target="popupwin">               
      		<tr id="tr<%=i %>">
      			<td class="movie-num"><input type="text" id="test<%=i %>" name="test" value="<%=soonList.get(i).getMvNo() %>"readonly="readonly" style=" width:80px; height:15px; text-align: center; border: 0px solid #333 "/></td>                             
      			<td class="movie-title"><%=soonList.get(i).getMvTitle()%></td>
      			<td class="director"><%=soonList.get(i).getMvDirector()%></td>
      			<td class="cast"><%for(int j=0; j<soonList.get(i).getActName().size(); j++){ %>
      			<%=soonList.get(i).getActName().get(j).getActName() %>
      			<% }%>
      			</td>
      		</tr>    	
      		</form>
      		<%}%>   
         </tbody>
          </table>
        </div>
		<div id="div-addBtn">
        <input type="button" value="추가"  name="addBtn"  id="addBtn" />
        </div>
      </div>
      <%@ include file="adminFooter.jsp" %>
    </div>
  </body>
</html>


















    