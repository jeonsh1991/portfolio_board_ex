<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="uId" />
<jsp:setProperty name="user" property="uPassword" />
<jsp:setProperty name="user" property="password1" />
<jsp:setProperty name="user" property="password2" />
<jsp:setProperty name="user" property="uName" />
<jsp:setProperty name="user" property="uNick" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String uId = null;
	if(session.getAttribute(uId) != null) {
		uId = (String) session.getAttribute(uId);
	}
	
	if(uId != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	if(user.getuId() == null || user.getPassword1() == null || user.getPassword2() == null || user.getuName() == null || user.getuNick() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>