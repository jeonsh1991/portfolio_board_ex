<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String uId = request.getParameter("uId");
	String uPassword = null;
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	if(password1.equals(password2)) {
		uPassword = request.getParameter("password1");
	}
	String uName = request.getParameter("uName");
	String uNick = request.getParameter("uNick");
	System.out.println(uId+uPassword+password1+password2+uName+uNick);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String s_Name = null;
	if(session.getAttribute(uId) != null) {
		s_Name = (String) session.getAttribute(uId);
	}
	
	if(s_Name != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	if(uId == null || uPassword==null || uName == null || uNick == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(uId, uPassword, uName, uNick);
		if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='welcome.jsp'");
			script.println("</script>");
		}
	}
	
%>
</body>
</html>