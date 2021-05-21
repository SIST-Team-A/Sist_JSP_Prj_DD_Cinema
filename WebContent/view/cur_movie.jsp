<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <!-- botstrap -->
    <link
      href="../common/bootstrap-3.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <!-- coin-slider -->
    <script
      type="text/javascript"
      src="../common/coin/coin-slider.min.js"
    ></script>
    <link
      rel="stylesheet"
      href="../common/coin/coin-slider-styles.css"
      type="text/css"
    />

    <!-- swiper-slider -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <style type="text/css">
      body,
      html {
        width: 100%;
        height: 100%;
      }
      body {
        margin: 0px;
        background-color: black;
        overflow-x: hidden;
      }
      a {
        text-decoration: none;
        color: white;
      }
      a:hover {
        color: white;
        text-decoration: none;
      }
      /* #header-wrap {
        display: flex;
        flex-direction: row;
        justify-content: center;
      } */
      #wrap {
        display: flex;
        width: 100%;
        flex-direction: column;
        justify-content: space-between;
      }
      #wrap-main {
        width: 100%;
        height: 804px;
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
        position: absolute;
        z-index: 3;
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
        position: absolute;
        z-index: 1;
      }
      #main-poster {
        width: 100%;
      }

      .coin-slider {
        overflow: visible;
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
        border-top: 1px solid #656565;
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
      #gradi-wrap {
        display: flex;
        flex-direction: row;
        justify-content: center;
      }
      #gradi {
        width: 1920px;
        height: 774px;
        position: absolute;
        z-index: 2;
        /* margin: 0 auto; */
        pointer-events: none;
        background: linear-gradient(
            to bottom,
            rgb(0, 0, 0) 0%,
            rgba(0, 0, 0, 0) 35%
          ),
          linear-gradient(to top, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 35%),
          linear-gradient(to right, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 15%),
          linear-gradient(to left, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 15%);
      }
      #containerPoster {
        height: 300px;
        margin: 0 auto;
        background-color: black;
        margin: 5% 0;
      }

      /* 스와이퍼 슬라이더 */
      .swiper-container {
        width: 850px;
        height: 300px;
        border-radius: 7px;
      }
      .swiper-slide {
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .swiper-slide img {
        height: 250px;
        width: 150px;
        border-radius: 10px;
      }

      #cs-buttons-main-poster {
        margin: 0;
      }
    </style>

    <script type="text/javascript">
      /* 코인슬라이더 */
      $(document).ready(function () {
        $("#main-poster").coinslider({
          width: 1920,
          height: 774,
          navigation: true,
          delay: 1000,
          effect: "straight",
          links: true,
        });
      });

      window.onload = function () {
        document.getElementById("cs-buttons-main-poster").style.left = "49.3%";
        new Swiper(".swiper-container", {
          slidesPerView: 5, // 동시에 보여줄 슬라이드 갯수
          spaceBetween: 30, // 슬라이드간 간격
          slidesPerGroup: 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

          // 그룹수가 맞지 않을 경우 빈칸으로 메우기
          // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
          loopFillGroupWithBlank: true,

          loop: true, // 무한 반복

          navigation: {
            // 네비게이션
            nextEl: ".swiper-button-next", // 다음 버튼 클래스명
            prevEl: ".swiper-button-prev", // 이번 버튼 클래스명
          },
        });
        // document.getElementById("coin-slider-main-poster").style.Width =
        //   "100vw";
        // document.getElementById("main-poster").style.Width = "100vw";
      };
    </script>
  </head>
  <body>
    <div id="wrap">
      <div id="wrap-main">
        <div id="gradi-wrap">
          <div id="gradi"></div>
        </div>
        <div id="header">
          <div id="header-top">
            <div id="left"></div>
            <div id="title"><a href="">D.D Cinema</a></div>
            <div id="login">
              <a href="">로그인</a>
              <a href="">회원가입</a>
            </div>
          </div>
          <div id="header-bottom">
            <ul class="header-bottom-ul">
              <li><a href="">예매</a></li>
              <li><a href="cur_movie.html">현재상영작</a></li>
              <li><a href="soon-movie.html">개봉예정작</a></li>
            </ul>
          </div>
        </div>
        <div id="main">
          <div id="main-poster">
            <a href="" target="_blank">
              <img src="../common/images/Line_1920774.jpg" />
            </a>
            <a href="" target="_blank">
              <img src="../common/images/Spiral_1920774.jpg" />
            </a>
            <a href="" target="_blank">
              <img src="../common/images/TheFast_1920774.jpg" />
            </a>
            <a href="" target="_blank">
              <img src="../common/images/Voyagers_1920774.jpg" />
            </a>
          </div>
        </div>
      </div>

      <div id="containerPoster">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img src="../common/images/a1.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a2.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a3.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a4.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a5.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a6.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a7.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a8.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a9.jpg" />
            </div>
            <div class="swiper-slide">
              <img src="../common/images/a10.jpg" />
            </div>
          </div>
          <!-- 네비게이션 -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
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