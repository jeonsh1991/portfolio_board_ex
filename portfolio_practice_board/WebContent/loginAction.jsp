<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String uId = request.getParameter("id");
String uPassword = request.getParameter("password");
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
if(session.getAttribute(uId)!=null) {
	s_Name = (String) session.getAttribute(uId);
}
if(s_Name != null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인 되어 있습니다.')");
	script.println("location.href='index.jsp'");
	script.println("</script>");
}
UserDAO userDAO = new UserDAO();
int result = userDAO.login(uId, uPassword);

if(result==1) {
	session.setAttribute("s_Name", uId);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href='index.jsp'");
	script.println("</script>");
}else if(result==0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀렸습니다.')");
	script.println("history.back()");
	script.println("</script>");
}else if(result==-1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('아이디가 잘못되었습니다.')");
	script.println("history.back()");
	script.println("</script>");
}else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생했습니다.<br>다시시도해주십시오.')");
	script.println("history.back()");
	script.println("</script>");
}
%>
</body>
</html>