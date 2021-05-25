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
        margin: 0px;
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
        height: 100%;
        flex-direction: column;
        justify-content: space-between;
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
        margin-bottom: auto;
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
        width: 100%;
        min-width: 950px;
        display: flex;
        flex-direction: row;
        justify-content: center;
        flex-wrap: wrap;
      }
      #main-title {
        width: 100%;
        text-align: center;
        padding: 10px 0;
      }

      .item {
        width: 300px;
        height: 500px;
        margin: 10px;
        border: 1px solid black;
        text-align: center;
      }

      #unfold {
        width: 100%;
        padding: 25px 0;
        display: flex;
        flex-direction: row;
        justify-content: center;
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
        margin-top: auto;
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
    <script>
      window.onload = function () {
        const btn = document.getElementById("btn-unfold");
        btn.addEventListener("click", () => {
          let cnt = 5;
          const items = document.querySelectorAll(".item");
          for (const item of items) {
            if (cnt) {
              if (item.classList.contains("hidden")) {
                item.classList.remove("hidden");
                cnt--;
              }
            }
          }
        });
      };
    </script>
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <div id="header-top">
          <div id="left"></div>
          <div id="title"><a href="main.jsp">D.D Cinema</a></div>
          <div id="login">
         <a href="http://localhost/movie_reservation/view/login/login.jsp">로그인</a>
            <a href="http://localhost/movie_reservation/view/login/sign_Up.jsp">회원가입</a>
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
        <div id="main-title">
          <h3>개봉예정작</h3>
        </div>
        <div class="item">1</div>
        <div class="item">2</div>
        <div class="item">3</div>
        <div class="item">4</div>
        <div class="item">5</div>
        <div class="item">6</div>
        <div class="item">7</div>
        <div class="item">8</div>
        <div class="item">9</div>
        <div class="item">10</div>
        <div class="item hidden">11</div>
        <div class="item hidden">12</div>
        <div class="item hidden">13</div>
        <div class="item hidden">14</div>
        <div class="item hidden">15</div>
        <div class="item hidden">16</div>
        <div class="item hidden">17</div>
        <div class="item hidden">18</div>
        <div class="item hidden">19</div>
        <div class="item hidden">20</div>
        <div class="item hidden">21</div>
        <div class="item hidden">22</div>
        <div id="unfold">
          <input
            type="button"
            class="btn btn-default"
            id="btn-unfold"
            value="펼쳐보기"
          />
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
  </body>
</html>