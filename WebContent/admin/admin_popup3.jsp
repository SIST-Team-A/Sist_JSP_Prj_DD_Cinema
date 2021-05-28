<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% 
	request.setCharacterEncoding("UTF-8");
    AdminMovieDAO amdao=AdminMovieDAO.getInstance();
	String mvNO=request.getParameter("test");
%>

<!-- 주연 조연 구분 코드 -->
<%
StringBuilder lead = new StringBuilder();
StringBuilder sub = new StringBuilder();

for (int i = 0; i < amdao.selectMovie(mvNO).get(0).getActorList().size(); i++) {
	if (amdao.selectMovie(mvNO).get(0).getActorList().get(i).getActMainOrSub().equals("M")) {
		lead.append(amdao.selectMovie(mvNO).get(0).getActorList().get(i).getActName() + " ");
	} else {
		sub.append(amdao.selectMovie(mvNO).get(0).getActorList().get(i).getActName() + " ");
	}
}
/* 개봉 미개봉 상영종료 코드*/
String opennot1="";
String opennot2="";
//String opennot3=""; //이거는 상영종료일 넣을꺼면 사용
if(amdao.selectMovie(mvNO).get(0).getMvOpenOrNot().equals("O")){
	opennot1="checked";
	opennot2="";
}else{
	opennot1="";
	opennot2="checked";
}
%>



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
      
<style type="text/css">

#wrap{
margin: 50px auto;
width:500px;
height:700px;
border: 1px solid #333;
}

#popup-table{
margin:0 auto;
width:500px;
height:700px;

}

#tr-header{
text-align: center;
}

#tr-bottom{
text-align: center;
}

.td-first{
width:100px;
text-align: center;
}

.td-second{
width:200px;
text-align: center;
}

.table-text{
width:250px;
}

#table-lead{
padding-left:28px;
}

#table-sub{
padding-left:28px;
}
</style>

<script type="text/javascript">
function closeWindow(){
	self.close();
}
</script>
</head>
<body>

<div id="wrap">


	
           
  <table id="popup-table">
             <tr id="tr-header">
                <td colspan="2"><h3>개봉예정작관리</h3></td>
            </tr>
            <tr>
              <td class="td-first">번호</td>
              <td class="td-second"><input type="text" value="<%=mvNO %>" readonly="readonly" class="table-text" /></td>
              
            </tr>
            
            <tr>     	 
              <td class="td-first">포스터</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvPoster()%>" class="table-text" /></td>
            </tr>
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvTitle()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvDirector()%>" class="table-text" /></td>

            </tr>          
              		
            <tr>
              <td class="td-first">주연</td>
              <td class="td-second" id="table-lead"><input type="text" value="<%=lead %>" class="table-text" />
              <input type="button" value="+" class=""/></td>

            </tr>
            <tr>
              <td class="td-first">조연</td>
              <td class="td-second" id="table-sub"><input type="text" value="<%=sub %>" class="table-text" />
              <input type="button" value="+" class=""/></td>

            </tr>
            <tr>
              <td class="td-first">줄거리</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvSt()%>" class="table-text" style="height:100px" /></td>
            </tr>
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvRuntime()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvTrailer()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" value="<%=amdao.selectMovie(mvNO).get(0).getMvOpenDate()%>" class="table-text" /></td>
  
            </tr>
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              	<input type="radio" name="opennot" <%=opennot1%>/>개봉&emsp;<input type="radio" name="opennot" <%=opennot2%>/>미개봉&nbsp;<input type="radio" name="opennot"/>상영종료
              </td>             
            </tr>      
			<tr id="tr-bottom">            
			   <td colspan="2" id="">
			   <input type="button" value="수정"  id="motifyBtn" />
			   <input type="button" value="삭제"   id="deleteBtn" />
			   <input type="button" value="취소" id="cencelBtn" onclick="closeWindow()"/>
			   </td>
			</tr>           
              </table> 
	
</div>

</body>
</html>

















    