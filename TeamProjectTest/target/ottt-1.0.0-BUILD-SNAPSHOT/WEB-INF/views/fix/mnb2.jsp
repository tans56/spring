<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/fix/mnb2.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Document</title>
</head>
<body>
	<nav class="mnb2">
        <ul>
          <li><a style="color: #33ff33" href="<c:url value="/mypage/myreview" />">기록</a></li>
          <li><a href="<c:url value="/mypage/wishlist?user=${userDTO.user_nicknm }" />">찜목록</a></li>
		  <li><a href="<c:url value="/mypage/watched?user=${userDTO.user_nicknm }" />">봤어요</a></li>
        </ul>
      </nav>
	
	
</body>
</html>