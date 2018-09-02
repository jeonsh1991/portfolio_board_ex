<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.centerAlign {
	margin-left: 50px;
	margin-top: 100px;
}
</style>
</head>
<body>
<div class="centerAlign">
<%
String Id = request.getParameter("id");
UserDAO userDAO = new UserDAO();
int result = userDAO.idChk(Id);
if (result==1) {
	%><h2>이미 존재하는 아이디입니다.</h2><%
}else if (result==0) {
	%><h2>가입할 수 있는 아이디입니다.</h2><%
	}else {
		%><h3>시스템 오류가 발생했습니다. <br>다시시도해주세요</h3> <%
	}
%>
</div>
</body>
</html>