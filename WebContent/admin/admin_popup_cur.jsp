<%@page import="vo.AdminMovieSelectVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.MovieUpdateInsertVO"%>
<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
AdminMovieDAO amdao = AdminMovieDAO.getInstance();
String mvNO = request.getParameter("test");
List<AdminMovieSelectVO> amsList=new ArrayList<AdminMovieSelectVO>();
amsList=amdao.selectMovie(mvNO);

%>
<!-- 주연 조연 구분 코드 -->
<%
StringBuilder lead = new StringBuilder();
StringBuilder sub = new StringBuilder();


for (int i = 0; i < amsList.get(0).getActorList().size(); i++) {
	if (amsList.get(0).getActorList().get(i).getActMainOrSub().equals("M")) {
		lead.append(amsList.get(0).getActorList().get(i).getActName() + " ");
	} else {
		sub.append(amsList.get(0).getActorList().get(i).getActName() + " ");
	}
}

String opennot1="";
String opennot2="";
//String opennot3=""; //이거는 상영종료 넣을꺼면 사용

if(amsList.get(0).getMvOpenOrNot().equals("O")){
	opennot1="checked";
	opennot2="";
}else{
	opennot1="";
	opennot2="checked";
}

//insert
//update
//delete
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
width:700px;
height:850px;
border: 1px solid #333;
}

#popup-table{
margin:0 auto;
width:700px;
height:850px;

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
width:500px;
text-align: center;
}

.table-text{
width:500px;
}


</style>

<script type="text/javascript">

function closeWindow(){
	self.close();
	opener.location.reload();
}

function updat(){

	if(confirm("정말로 수정 하시겠습니까?")){
		document.getElementById('Frm1').submit();		
	}else{
		return;
	}
}

function del(){
	if(confirm("정말로 삭제 하시겠습니까?")){
		document.getElementById('Frm2').submit();		
	}else{
		return;
	}
	
}
</script>
</head>
<body>

<div id="wrap">
     
<form action="mv_update.jsp" id="Frm1" method="post"><!-- 폼으로 삭제요청 -->   
  <table id="popup-table">
             <tr id="tr-header">
                <td colspan="2"><h3>현재상영작관리</h3></td>
            </tr>
            <tr>
              <td class="td-first">번호</td>
              <td class="td-second"><input type="text" name="mv-no" id="mv-no"value="<%=mvNO %>" readonly="readonly" class="table-text" /></td>            
            </tr>
            
            <tr>     	 
              <td class="td-first">상영작포스터</td>
              <td class="td-second"><input type="text"  name="mv-poster" id="mv-poster-cur" value="<%=amsList.get(0).getMvPoster()%>" class="table-text" /></td>
            </tr>
            
            <tr>     	 
              <td class="td-first">개봉예정포스터</td>
              <td class="td-second"><input type="text" name="mv-poster-soon" id="mv-poster-soon" value="<%=amsList.get(0).getMvPosterSoon() %>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second"><input type="text" name="mv-title" id="mv-title" value="<%=amsList.get(0).getMvTitle()%>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">장르</td>
              <td class="td-second"><input type="text"  name="mv-genre" id="mv-genre" value="<%=amdao.selectMovie(mvNO).get(0).getMvGenre() %>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second"><input type="text" name="mv-director" id="mv-director" value="<%=amsList.get(0).getMvDirector()%>" class="table-text" /></td>

            </tr>         
              		
            <tr>
              <td class="td-first">주연</td>
              <td class="td-second" id="table-lead"><input type="text" name="mv-lead" id="mv-lead" value="<%=lead %>" class="table-text" name="lead"/></td>
           

            </tr>
            <tr>
              <td class="td-first">조연</td>
              <td class="td-second" id="table-sub"><input type="text" name="mv-sub" id="mv-sub" value="<%=sub %>" class="table-text" name="sub"/></td>
             

            </tr>
            <tr>
              <td class="td-first">줄거리</td>
              <td class="td-second"><input type="text"  name="mv-story" id="mv-story" value="<%=amsList.get(0).getMvSt()%>" class="table-text" style="height:100px" /></td>
            </tr>
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" name="mv-runtime" id="mv-runtime" value="<%=amsList.get(0).getMvRuntime()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second"><input type="text"  name="mv-trailer" id="mv-trailer" value="<%=amsList.get(0).getMvTrailer()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" name="mv-opendate" id="mv-opendate" value="<%=amsList.get(0).getMvOpenDate()%>" class="table-text" /></td>
  
            </tr>
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              	<input type="radio" id="mv-open-radio" name="opennot" <%=opennot1 %>/>개봉&emsp;<input type="radio"  id="mv-noopen-radio" name="opennot" <%=opennot2 %>/>미개봉&nbsp;<input type="radio"  id="mv-close-radio" name="opennot"/>상영종료
         	  </td>             
            </tr>
               
			<tr id="tr-bottom">
			   		<td>
			  		   <input type="button" value="수정"  id="motifyBtn" onclick="updat()"/></td>
			  		   </form>
			   		<form action="mv_del.jsp" id="Frm2" method="post"><!-- 폼으로 삭제요청 -->
					<td><input type="hidden" name="delNum" value="<%=mvNO%>">
					   <input type="button" value="삭제"  id="deleteBtn" onclick="del()"></td>
				   </form>
			  		  <td> <input type="button" value="취소" id="cencelBtn" onclick="closeWindow()"></td>
			   
			</tr>           
              </table> 

</div>

</body>
</html>

















    