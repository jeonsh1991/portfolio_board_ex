<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user.UserDAO" %>
 <%@ page import="java.io.*" %>
    
 <%request.setCharacterEncoding("UTF-8"); %>
 <%
 	String uID = request.getParameter("userID");
 	String uPass = request.getParameter("userPassword");
 	
 	UserDAO userDAO = new UserDAO();
 	int result = userDAO.registerCheck(uID, uPass);
 	
 	if(result==1) {
 		session.setAttribute("s_Name", uID);
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("location.href='index.jsp'");
 		script.println("</script>");
 	}else if (result == 0) {
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('비밀번호가 틀렸습니다.')");
 		script.println("history.back()");
 		script.println("</script>");
 	}else if (result == -1) {
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('아이디가 틀렸습니다')");
 		script.println("history.back()");
 		script.println("</script>");
 	}else if(result == -2) {
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('오류가 발생했습니다.')");
 		script.println("history.back()");
 		script.println("</script>");
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>