<%@page import="vo.MovieUpdateInsertVO"%>
<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
AdminMovieDAO amdao=AdminMovieDAO.getInstance();
MovieUpdateInsertVO muiVO= new MovieUpdateInsertVO();
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

function mvInsert(){	
	if(confirm("추가 하시겠습니까?")){
		document.getElementById('Frm1').submit();		
	}else{
		return;
	}
}


</script>
</head>
<body>

<div id="wrap">
  <form action="mv_insert.jsp"  id="Frm1" method="post"><!-- 폼으로 삭제요청 --> 
   <table id="popup-table">
             <tr id="tr-header">
                <td colspan="3"><h3>개봉예정작추가</h3></td>
            </tr>
            
            <tr>
              <td class="td-first">번호</td>
              <td class="td-second"><input type="text" id="test" name="mv-no" value="" readonly="readonly" class="table-text" /></td>
            </tr>
            
            <tr>     	 
              <td class="td-first">상영작포스터</td>
              <td class="td-second"><input type="text" name="mv-poster" value="" class="table-text" /></td>
            </tr>
            
            <tr>     	 
              <td class="td-first">개봉예정포스터</td>
              <td class="td-second"><input type="text" name="mv-poster-soon" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second"><input type="text" name="mv-title"  value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">장르</td>
              <td class="td-second"><input type="text" name="mv-genre" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second"><input type="text" name="mv-director"  value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">주연</td>
              <td class="td-second" id="table-lead"><input type="text" name="mv-lead" value="" class="table-text" />           
            </tr>
            
            <tr>
              <td class="td-first">조연</td>
              <td class="td-second" id="table-sub"><input type="text" name="mv-sub" value="" class="table-text" />
            </tr>
            
            <tr>
              <td class="td-first">줄거리</td>
              <td class="td-second"><input type="text" name="mv-story"  value="" class="table-text" style="height:100px" /></td>
            </tr>
            
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" name="mv-runtime" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second"><input type="text" name="mv-trailer"   value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" name="mv-opendate" id="mv-opendate" value="" class="table-text" /></td> 
            </tr>
            
            <tr>
              <td class="td-first">종료일자</td>
              <td class="td-second"><input type="text" name="mv-closedate" id="mv-closedate" value="" class="table-text" /></td> 
            </tr>
            
            <tr>
              <td class="td-first">등록일자</td>
              <td class="td-second"><input type="text" name="mv-regdate" id="mv-regdate" value="" readonly="readonly" class="table-text" /></td> 
            </tr>
                     
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              <input type="radio" name="opennot" value="O"/>개봉&emsp;<input type="radio" name="opennot" value="N"/>미개봉&nbsp;
              </td>             
            </tr>
                  
			<tr id="tr-bottom">            
			   <td colspan="2">
		 		<!--  <input type="hidden" name="addData" value="asd"> -->
			   <input type="button" value="추가"  id="addBtn" onclick="mvInsert()"/>
			   <input type="button" value="취소" id="cencelBtn"  onclick="closeWindow()"/>
			   </td>
			</tr>
			           
              </table> 
	</form>
</div>

</body>
</html>

















    