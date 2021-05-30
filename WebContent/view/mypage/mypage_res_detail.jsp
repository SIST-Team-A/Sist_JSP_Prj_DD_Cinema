<%@page import="vo.ReservationMyPageDetVO"%>
<%@page import="vo.SeatRevVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String res_num = request.getParameter("reNo");
	//String res_num = "r_00000025";
	
	ReservationDAO rDAO = new ReservationDAO();
	ReservationMyPageDetVO rmpdVO = rDAO.selectReservationMyDetail(res_num);
%>    
        
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- bootstrap -->
    <link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- JQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- bootstrap -->
    <script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    
<style type="text/css">
	#main {
        /* margin: auto 0; */
        background-color : #FFFFFF; 
        padding-left : 65px;
        width : 900px;
        margin : 10px auto
      }
	
	#title{font-size: 36px;}
	#detailContents{ width: 100%; height:600px;position: relative;}
	span{font-size: 60px;}
	#poster{width: 280px;
			height: 370px;
			position: absolute;
			top:75px;
			left: 40px;
			/* background-image: url(); */ 
			background-size: contain;
			background-position: center;
			background-repeat:no-repeat;
			}
	img{ob}
	#rev_detail{width: 245; height: 347; position: absolute;top:50px; left: 370px; text-align: center;}
	#rev_no{width: 245px; height: 30%; position: absolute;top:80px; left: 550px;background-color: #dfdfdf;text-align: center;}
	#ok_btn{ position: absolute;top:350px; left: 550px;}
	#rev_cancel_btn{ position: absolute;top:350px; left: 680px}
	img{width: 100%;}
</style>
<script type="text/javascript">
	$(function () {
		$("#ok_btn").click(function() {
			window.location="http://localhost/movie_reservation/view/mypage/mypage_main.jsp"
		});//click
		
		$("#rev_cancel_btn").click(function() {
			confirm("예매를 취소 하시겠습니까?");
			$("#frm").submit();//깃테스트용입니다.
		});
		
	});//ready
	
	
	
</script>
</head>
<body>
	<div id="wrap">
		
		<%@include file="../header.jsp" %>
		
		<div id="main">
			<div id="title">My page</div>
			<div id="navibar">
				<ul class="nav nav-pills">
				 <li role="presentation"><a	href="mypage_res_detail.jsp">예매내역</a></li>
					<li role="presentation"><a href="change_infor1.jsp">정보 수정</a></li>
					<li role="presentation"><a	href="change_pass1.jsp">비밀번호	변경</a></li>
				</ul>
			</div>
			<br/>
			<form action="mypage_delete_process.jsp" method="post" id="frm">
			<div id="detailContents">
				<div id="poster"><img src="../<%=rmpdVO.getMv_poster() %>"/></div>
				<div id="rev_detail">
					<h3><span class="label label-default">영화 제목</span></h3>
						<h4><%=rmpdVO.getMv_title() %></h4>
					<h3><span class="label label-default">극장 위치</span></h3>
						<h4>강남 DD Cinama</h4>
					<h3><span class="label label-default">관람 일시</span></h3>
						<h4><%=rmpdVO.getSch_date() %></h4>
					<h3><span class="label label-default">관람 인원</span></h3>
						<h4><%=rmpdVO.getRev_adultcnt() %></h4>
					<h3><span class="label label-default">관람 좌석</span></h3>
						<%
							for(int i=0; i<rmpdVO.getList().size();i++){
						%>
							<h4><%=rmpdVO.getList().get(i).toString() %></h4>
						<%
							}
						%>
				</div>
				
				<div class="panel panel-default" style="width: 230px; height: 100px; text-align: center;  position: absolute; top:150px; left: 555px; font-size: 26px">
				  <div class="panel-heading">
				    <h1 class="panel-title">예약 번호</h1>
				  </div>
				  <div class="panel-body">
				    <%=res_num %>
				  </div>
				  <input type="hidden" value="<%=res_num %>" name="res_num"> 
				</div>
				
				
				<div id="ok_btn">
					<input type="button" value="확인" class="btn btn-primary" style="width: 115px;font-size: 26px;">
				</div>
				<div id="rev_cancel_btn">
					<input type="button" value="예매취소" class="btn btn-warning" style="width: 115px;font-size: 26px;"
					>
				</div>
			</div>
			</form>
		</div>
		
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>