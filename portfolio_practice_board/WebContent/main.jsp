<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.logindiv  {
	margin-left: 40%;
	margin-top: 15em;
	border: 1px solid whitesmoke;
	border-radius: 10px;
	width: 450px;
	height: 290px;
	background-color:whitesmoke;
}
form {
	padding-top: 10%;
	padding-left: 15%;
}
input {
	border: none;
	border-radius: 10px;
	width: 300px;
	height: 50px;
	font-size: 35px;
}
button {
	border: none;
	color: whitesmoke;
	width:300px; 
	height:40px; 
	font-size: 20px; 
	background-color: #D1B2FF;
	border-radius: 10px;
}
</style>
</head>
<body>
<div class="logindiv">
	<div class="loginbox"></div>
	<form method=post action="board.jsp">
			<input type="text" id="id" class="id" placeholder="아이디"><br><br>
			<input type="password" id="password" class="password" placeholder="비밀번호"><br><br>
			<button type="submit">LOGIN</button>
			<p>&nbsp;&nbsp;&nbsp;아이디가 없으신가요? <a href="join.jsp">회원가입</a>하기</p>
	</form>
</div>
</body>
</html>