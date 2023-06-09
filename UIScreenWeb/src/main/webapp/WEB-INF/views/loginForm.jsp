<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <style type="text/css">
    	* { box-sizing: border-box; }
    	.title {
    		font-size: 50px;
    		margin: 40px 0 30px 0;
    		color: #33ff33;
    	}
    	
    	form {
    		width: 400px;
    		height: 500px;
    		display: flex;
    		flex-direction: column;
    		align-items: center;
    		position: absolute;
    		top: 50%;
    		left: 50%;
    		border: 2px solid #202020;
    		border-radius: 10px;
    		transform: translate(-50%, -50%)
    	}
    	
    	label {
    		width: 300px;
    		height: 30px;
    		margin-top: 20px;
    	}
    	.input-field {
    		width: 300px;
    		height: 40px;
    		border: 1px solid #33ff33;
    		border-radius: 5px;
    		padding: 0 10px;
    		margin-bottom: 10px;
    	}  
    	
    	button {
    		background-color: #33ff33;
    		color: white;
    		width: 300px;
    		height: 50px;
    		font-size: 17px;
    		border: none;
    		border-radius: 5px;
    		margin: 40px 0 30px 0;
    		color: black;
    	}  	
    	
    	ul {
    		display: flex;
    		margin-right: 50px;
    	}
    	
    	li {
			margin-left: 30px; 
		}
    	
    	</style>
    <title>로그인</title>
</head>
<body>
    <form action='<c:url value="/main" />' method="post" onsubmit="return formCheck(this)">
    	
    	<div class="title">login</div>
    	
    	<label>아이디</label>
    	<input type="text" name="id" class="input-field" placeholder="아이디를 입력해주세요." autofocus />
    	
    	<label>비밀번호</label>
    	<input type="password" name="pwd" class="input-field" placeholder="비밀번호를 입력해주세요." />
    	
    	<button>로그인</button>
    	
		<ul>
			<li>
				<a href="#">아이디 찾기</a>
			</li>
			<li>
				<a href="#">비밀번호 찾기</a>
			</li>
		</ul>
   	</form>
</body>
</html>