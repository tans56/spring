<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/genre/interest.css" >
    <script type="text/javascript" src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/genre/main.css" >
</head>
  <body style="background-color: #202020;">
    <form>
    <div class="wrap">
      <header>
        <div class="logo">
            <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="logo">
          </a>
        </div>
        <nav class="gnb">
          <ul>
            <li>
              <a href="<c:url value="/genre/movie" />">영화</a>
            </li>
            <li>
              <a href="<c:url value="/genre/drama" />">드라마</a>
            </li>
            <li>
              <a href="<c:url value="/genre/interest" />" style="color: #33ff33;">예능</a>
            </li>
            <li>
              <a href="<c:url value="/genre/animation" />">애니</a>
            </li>
            <li>
              <a href="<c:url value="/community" />">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a href="<c:url value='/search' />">
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a href="<c:url value='/mypage' />">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        </div>
      </header>

      <br />
      <section class="sec00">
        <div class="ott-logo-box">
          <a href="#">
            <img 
              class="ott-logo-img"
              src="${path}/resources/images/icon/티빙.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/netplix.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/웨이브.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/쿠팡플레이.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/왓챠.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/디즈니플러스.png"
            />
          </a>
        </div>
        <ul class="ott-logo-text">
        </ul>
            <button class="submit-1">Click</button>
      </section>
      <section class="sec00-1">
        <div class="dropdown-filter">
          <li>
            <select name="button" id="button">
             <a class="dropdown-itemtemp" href="#"><option value="최신순" >&nbsp;&nbsp;최신순&nbsp;&nbsp;</a></option>
             <a class="dropdown-itemtemp" href="#"><option value="별점순" >&nbsp;&nbsp;별점순&nbsp;&nbsp;</a></option>
            </select>
          </li>
        </ul>
      </div>
    </section>
      <section class="sec01">
        <c:forEach var="GenreDTO" items="${list}">
        <div class="work-info">
          <a href="#">
              <img src="./images/popular/theglory.jpg" class="poster"/>
              <div class="work-review">
                  <div class="ott-img">
                      <span><img src="./images/ottlogo/Netflix.png"></span>
                  </div>
                  <div class="work-cat">
                      <div>드라마</div>    
                      <div>범죄</div>
                      <div>한국</div>
                  </div>
                  <div>
                      <img src="./images/main/starpan.png" class="star-img"/>
                  </div>
                  <div class="work-my">
                      <div><a href="#">찜</a></div>
                      <div><a href="#">리뷰쓰기</a></div>
                  </div>
              </div>
          </a>
        </div>
        </c:forEach>     
      </section>
      <footer></footer>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </form>
  <script>
    const logos = document.querySelectorAll('.ott-logo-img');
    logos.forEach(function(logo) {
      logo.addEventListener('click', function() {
        logo.classList.toggle('active');
      });
    });
    </script>
    <style>
      .ott-logo-img:hover,
      .ott-logo-img.active {
        outline: 3px solid #33ff33;
        border-radius: 10px;
      }
    </style>
  </body>
</html>
