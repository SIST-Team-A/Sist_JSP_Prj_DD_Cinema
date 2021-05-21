<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- botstrap -->
    <link
      href="../common/bootstrap-3.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <style>
      body,
      html {
        width: 100%;
        height: 100%;
        font-family: "Noto Sans KR", sans-serif;
      }
      body {
        margin: 0;
        overflow-x: hidden;
      }
      div {
        /* border: 1px solid black; */
      }
      a {
        text-decoration: none;
        color: black;
      }
      a:hover {
        text-decoration: none;
        color: black;
      }
      #wrap {
        display: flex;
        width: 100%;
        height: 100%;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
      }
      ul {
        list-style: none;
      }
      #header {
        width: 100%;
        min-width: 950px;
        height: 122px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        /* margin-bottom: auto; */
      }
      #header-top {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0px;
      }
      #header-bottom {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 85%;
        border-top: 1px solid #b2b2b2;
        font-size:14px;
        margin: 0 auto;
      }
      #header-bottom ul {
        text-align: center;
        margin: 0px;
        padding: 0px;
      }
      #header-bottom ul li {
        margin: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
        float: left;
      }

      #left {
        width: 25%;
      }
      #title {
        font-size: 36px;
        font-family: "Noto Sans KR", sans-serif;
      }
      #login {
        width: 25%;
        text-align: center;
      }
      #login a {
        color: #656565;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 12px;
      }
      #login a:hover {
        color: #656565;
      }

      #main {
        width: 50%;
        max-width: 800px;
        min-width: 750px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        margin: 50px 0;
      }

      #main div {
        /* border: 1px solid black; */
      }

      #main-info {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
      }

      #movie-info {
        display: flex;
        flex-direction: column;
        width: 45%;
      }

      #movie-title {
        border-bottom: 1px solid #ccc;
      }

      #movie-detail {
        margin-top: 50px;
        width: 100%;
        height: 100%;
      }

      #story {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
      }

      #story-label {
        width: 15%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        border-bottom: 1px solid #ccc;
      }

      #trailer {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        margin-top: 15px;
      }

      #trailer-title {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 50%;
        margin-bottom: 20px;
        border-bottom: 1px solid #ccc;
      }

      #trailer-video {
        width: 100%;
        height: 500px;
      }
      #btn-main {
        margin-top: 40px;
      }
      #footer {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        width: 100%;
        min-width: 950px;
        min-height: 140px;
        background-color: black;
        /* margin-top: auto; */
      }
      #footertxt {
        color: #a2a2a2;
        font-size: 12px;
      }
      #footer-right {
        width: 20%;
      }

      .header-bottom-ul li {
        float: left;
        margin-right: 5px;
      }

      .header-bottom-ul li::before {
        padding-left: 5px;
        color: #b2b2b2;
        content: "｜";
      }

      .header-bottom-ul li:first-child::before {
        content: "";
      }

      .hidden {
        display: none;
      }
    </style>
    <script></script>
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="main.jsp">D.D Cinema</a></div>
          <div id="login">
            <a href="">로그인</a>
            <a href="">회원가입</a>
          </div>
        </div>
        <div id="header-bottom">
          <ul class="header-bottom-ul">
            <li>
              <a href="">예매</a>
            </li>
            <li>
              <a href="cur_movie.jsp">현재상영작</a>
            </li>
            <li><a href="soon_movie.jsp">개봉예정작</a></li>
          </ul>
        </div>
      </div>
      <div id="main">
        <div id="main-info">
          <div id="movie-poster"><img src="../common/images/a1.jpg" /></div>
          <div id="movie-info">
            <div id="movie-title"><h2>백두산</h2></div>
            <div id="movie-detail">
              장르 재난, 드라마, 액션 2019년 12월 19일 개봉 112분<br />
              감독 이해준, 김병서<br />
              출연 이병헌, 하정우, 마동석, 전혜진, 배수지, 이경영, 이상원,
              옥자연, 김시아 외
            </div>
          </div>
        </div>
        <div id="story">
          <div id="story-label">
            <h3>소개</h3>
          </div>
          <br />
          대한민국 관측 역사상 최대 규모의 백두산 폭발 발생. 갑작스러운 재난에
          한반도는 순식간에 아비규환이 되고, 남과 북 모두를 집어삼킬 추가 폭발이
          예측된다. 사상 초유의 재난을 막기 위해 ‘전유경’(전혜진)은 백두산
          폭발을 연구해 온 지질학 교수 ‘강봉래’(마동석)의 이론에 따른 작전을
          계획하고, 전역을 앞둔 특전사 EOD 대위 ‘조인창’(하정우)이 남과 북의
          운명이 걸린 비밀 작전에 투입된다. 작전의 키를 쥔 북한 무력부 소속 일급
          자원 ‘리준평’(이병헌)과 접선에 성공한 ‘인창’. 하지만 ‘준평’은 속을 알
          수 없는 행동으로 ‘인창’을 곤란하게 만든다. 한편, ‘인창’이 북한에서
          펼쳐지는 작전에 투입된 사실도 모른 채 서울에 홀로 남은
          ‘최지영’(배수지)은 재난에 맞서 살아남기 위해 고군분투하고 그 사이,
          백두산 마지막 폭발까지의 시간은 점점 가까워 가는데…!
        </div>
        <div id="trailer">
          <div id="trailer-title">
            <h3>트레일러</h3>
          </div>
          <iframe
            id="trailer-video"
            src="https://www.youtube.com/embed/FKAbTcss1ow"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>
        </div>
        <input
          type="button"
          id="btn-main"
          class="btn btn-default"
          value="메인으로"
          onclick="location.href='main.jsp'"
        />
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
  </body>
</html>