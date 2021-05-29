<%@page import="dao.AdminMovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
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
	opener.location.reload();
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
              <td class="td-second"><input type="text" value="" readonly="readonly" class="table-text" /></td>
              
            </tr>
            
            <tr>     	 
              <td class="td-first">포스터</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>
            </tr>
            
            <tr>     	 
              <td class="td-first">포스터2</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">장르</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>
            </tr>
            
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>

            </tr>
            
            <tr>
              <td class="td-first">주연</td>
              <td class="td-second" id="table-lead"><input type="text" value="" class="table-text" />
              <input type="button" value="+" class=""/></td>

            </tr>
            <tr>
              <td class="td-first">조연</td>
              <td class="td-second" id="table-sub"><input type="text" value="" class="table-text" />
              <input type="button" value="+" class=""/></td>

            </tr>
            <tr>
              <td class="td-first">줄거리</td>
              <td class="td-second"><input type="text" value="" class="table-text" style="height:100px" /></td>
            </tr>
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>

            </tr>
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" value="" class="table-text" /></td>
  
            </tr>
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              <input type="radio" name="" />개봉&emsp;<input type="radio" name=""/>미개봉&nbsp;<input type="radio" name=""/>상영종료
              </td>             
            </tr>      
			<tr id="tr-bottom">            
			   <td colspan="2" id="">
			   <input type="button" value="추가"  id="addBtn" />
			   <input type="button" value="취소" id="cencelBtn"  onclick="closeWindow()"/>
			   </td>
			</tr>           
              </table> 
	
</div>

</body>
</html>

















    