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
AdminMovieSelectVO amsVO = new AdminMovieSelectVO();
amsVO = amdao.selectMovie(mvNO);

%>
<!-- 주연 조연 구분 코드 -->
<%
List<String> leadList = new ArrayList<String>();
List<String> subList = new ArrayList<String>();
StringBuilder lead = new StringBuilder();
StringBuilder sub = new StringBuilder();


for (int i = 0; i < amsVO.getActorList().size(); i++) {
	if (amsVO.getActorList().get(i).getActMainOrSub().equals("M")) {
		leadList.add(amsVO.getActorList().get(i).getActName());
	} else {
		subList.add(amsVO.getActorList().get(i).getActName());
	}
}

for(int i = 0; i<leadList.size();i++){
	if(i<leadList.size()-1){
	lead.append(leadList.get(i)+ ",");
	}
	else{
	lead.append(leadList.get(i)+ "");
	}
}
for(int i = 0; i<subList.size();i++){
	if(i<subList.size()-1){
	sub.append(subList.get(i)+ ",");
	}
	else{
	sub.append(subList.get(i)+ "");
	}
}

String opennot1="";
String opennot2="";
//String opennot3=""; //이거는 상영종료 넣을꺼면 사용

if(amsVO.getMvOpenOrNot().equals("O")){
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

#mv-no{
	background-color: #ECECED;
}

#mv-regdate{
	background-color: #ECECED;
}

</style>

<script type="text/javascript">

function closeWindow(){
	self.close();
	opener.location.reload();
}

</script>
</head>
<body>

<form method="post" name="Frm">
<div id="wrap">
     

  <table id="popup-table">
             <tr id="tr-header">
                <td colspan="3"><h3>현재상영작관리</h3></td>
            </tr>
            <tr>
              <td class="td-first">번호</td>
              <td class="td-second"><input type="text" name="mv-no" id="mv-no"value="<%=mvNO %>" readonly="readonly" class="table-text" /></td>            
            </tr>
            
            <tr>     	 
              <td class="td-first">상영작포스터</td>
              <td class="td-second"><input type="text"  name="mv-poster" id="mv-poster-cur" value="<%=amsVO.getMvPoster()%>" class="table-text" /></td>
            </tr>
            
            <tr>     	 
              <td class="td-first">개봉예정포스터</td>
              <td class="td-second"><input type="text" name="mv-poster-soon" id="mv-poster-soon" value="<%=amsVO.getMvPosterSoon() %>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second"><input type="text" name="mv-title" id="mv-title" value="<%=amsVO.getMvTitle()%>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">장르</td>
              <td class="td-second"><input type="text"  name="mv-genre" id="mv-genre" value="<%=amsVO.getMvGenre() %>" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second"><input type="text" name="mv-director" id="mv-director" value="<%=amsVO.getMvDirector()%>" class="table-text" /></td>

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
              <td class="td-second"><input type="text"  name="mv-story" id="mv-story" value="<%=amsVO.getMvSt()%>" class="table-text" style="height:100px" /></td>
            </tr>
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" name="mv-runtime" id="mv-runtime" value="<%=amsVO.getMvRuntime()%>" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second"><input type="text"  name="mv-trailer" id="mv-trailer" value="<%=amsVO.getMvTrailer()%>" class="table-text" /></td>

            </tr>
            
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" name="mv-opendate" id="mv-opendate" value="<%=amsVO.getMvOpenDate()%>" class="table-text" /></td> 
            </tr>
            
            <tr>
              <td class="td-first">종료일자</td>
              <td class="td-second"><input type="text" name="mv-closedate" id="mv-closedate" value="<%=amsVO.getMvCloseDate()%>" class="table-text" /></td> 
            </tr>
            
            <tr>
              <td class="td-first">등록일자</td>
              <td class="td-second"><input type="text" name="mv-regdate" id="mv-regdate" value="<%=amsVO.getMvRegdate()%>" readonly="readonly"  class="table-text" /></td> 
            </tr>
            
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              	<input type="radio" id="mv-open-radio" name="opennot" value="O" <%=opennot1 %>/>개봉&emsp;<input type="radio"  id="mv-noopen-radio" name="opennot" value="N" <%=opennot2 %>/>미개봉&nbsp;<input type="radio"  id="mv-close-radio" name="opennot" value=""/>상영종료
         	  </td>             
            </tr>
                     
			<tr id="tr-bottom" style="width: 300px;">
			   		<td>
			  		   <input type="submit" value="수정"  id="modifyBtn" onclick="javascript: form.action='mv_update.jsp'" style="width:70px"/></td>
					<td><input type="hidden" name="delNum" value="<%=mvNO%>">
					   <input type="submit" value="삭제"  id="deleteBtn" onclick="javascript: form.action='mv_del.jsp'" style="width:70px"></td>
			  		  <td> <input type="button" value="취소" id="cencelBtn" onclick="closeWindow()" style="width:70px"></td>
			</tr>           
              </table> 

</div>
</form>
</body>
</html>

















    