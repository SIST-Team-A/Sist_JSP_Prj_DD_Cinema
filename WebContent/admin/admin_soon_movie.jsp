<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        const modal = document.getElementById("modal")
        
        function modalOn() {
            modal.style.display = "flex"; //modal의 style의 display를 flex로 변경
        }
        
        function modalOff() {
            modal.style.display = "none"
        }
          
        $("#table tbody tr").click(function(){ //테이블 클릭시 모달 on    	
        	modalOn();
        	$("#modal-add").hide();  	
        	$("#modal-motify").show();  	
        	$("#modal-del").show();  	
        	$("#modal-cencel").show();  	
        });
        
        $("#addBtn").click(function(){ //추가버튼 누를시 모달 on
        	modalOn();
        	$("#modal-add").show();  	
        	$("#modal-motify").hide();  	
        	$("#modal-del").hide();  	
        	$("#modal-cencel").show();  		
        });
        
        $("#modal-cencel").click(function(){ //취소버튼 누를시 모달 off
        	modalOff();
        });
        
        $("#close-area").click(function(){ // X누르면 모달 off
        	modalOff();
        }); 
 };    
    </script>
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="">ADMIN MANAGER</a></div>
          <div id="login">
            <a href="">로그아웃</a>
            <a href="">비밀번호변경</a>
          </div>
        </div>
        <div id="header-bottom">
          <ul class="header-bottom-ul">
            <li>
              <a href="admin_cur_movie.jsp">현재상영작관리</a>
            </li>
            <li>
              <a href="">개봉예정작관리</a>
            </li>
            <li><a href="">영화스케쥴관리</a></li>
            <li><a href="">회원관리</a></li>
          </ul>
        </div>
      </div>
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
              <td class="title-bar">조회</td>
            </tr>
            <tr>     	 
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            <tr>
              <td class="movie-num"></td>
              <td class="movie-title"></td>
              <td class="director"></td>
              <td class="cast"></td>
              <td class="count"></td>
            </tr>
            </tbody>
          </table>
        </div>
		<div id="div-addBtn">
        <input type="button" value="추가"  name="addBtn"  id="addBtn" />
        </div>
      </div>
      <div id="footer">
        <div id="footertxt">
          Double Dragon Cinema<br />
          서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터 고객센터
          1544<br />
          조장 한상민 사업자등록번호 000-00-000000 개인정보 보호 최고 책임자
          한상민<br />
          COPYRIGHT©Double Dragon Cinema.
        </div>
        <div id="footer-right"></div>
      </div>
    </div>
    
    <!-- 모달 -->
    <div id="container">
        <div id="lorem-ipsum"></div>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>개봉예정작관리</h2>
            </div>
            <div class="close-area" id="close-area">X</div>
            <div id="content">             
             <table id="modal-table">
            <tr>
              <td class="td-first">번호</td>
              <td class="td-second"><input type="text" value="" readonly="readonly" class="modal-text" id="modal-text-num"/></td>
              
            </tr>
            <tr>     	 
              <td class="td-first">포스터</td>
              <td class="td-second" ><input type="text" value="" class="modal-text"/></td>
            </tr>
            <tr>
              <td class="td-first">제목</td>
              <td class="td-second" ><input type="text" value="" class="modal-text"/></td>

            </tr>
            <tr>
              <td class="td-first">감독</td>
              <td class="td-second" ><input type="text" value="" class="modal-text"/></td>

            </tr>
            <tr>
              <td class="td-first">주연</td>
              <td class="td-second" id="modal-lead"><input type="text" value="" class="modal-text"/>
              <input type="button" value="+" class="modal-plus"/></td>

            </tr>
            <tr>
              <td class="td-first">조연</td>
              <td class="td-second" id="modal-sub"><input type="text" value="" class="modal-text"/>
              <input type="button" value="+" class="modal-plus"/></td>

            </tr>
            <tr>
              <td class="td-first">줄거리</td>
              <td class="td-second"><input type="text" value="" class="modal-text" style="height:100px"/></td>

            </tr>
            <tr>
              <td class="td-first">러닝타임</td>
              <td class="td-second"><input type="text" value="" class="modal-text"/></td>

            </tr>
            <tr>
              <td class="td-first">트레일러</td>
              <td class="td-second" ><input type="text" value="" class="modal-text"/></td>

            </tr>
            <tr>
              <td class="td-first">개봉일자</td>
              <td class="td-second"><input type="text" value="" class="modal-text"/></td>
  
            </tr>
            <tr>
              <td class="td-first">개봉여부</td>
              <td class="td-second" style="font-size:15px">
              <input type="radio" name="modal-radio" />개봉&emsp;<input type="radio" name="modal-radio"/>미개봉&nbsp;<input type="radio" name="modal-radio"/>상영종료
              </td>             
            </tr>      
<tr>            
   <td colspan="2" id="modal-bottom-btn">
   <input type="button" value="추가"  id="modal-add" style="border:0px"/>
   <input type="button" value="수정 "  id="modal-motify" style="border:0px"/>
   <input type="button" value="삭제"   id="modal-del" style="border:0px"/>
   <input type="button" value="취소" id="modal-cencel" style="border:0px"/>
   </td>
</tr>           
            
              </table> 
            </div>
        </div>
    </div>
    
  </body>
</html>   