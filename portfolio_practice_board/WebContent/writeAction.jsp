<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String category = request.getParameter("categorySelect");
	String title = request.getParameter("titleEdit");
	String contents = request.getParameter("editor1");
	
	String s_Name = null;
	if(session.getAttribute("s_Name") != null) {
		s_Name = (String) session.getAttribute("s_Name");
	}
	UserDAO userDAO = new UserDAO();
	String nick = null;
	nick = userDAO.getInfo(s_Name);
	System.out.println("nick"+nick);
	
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.Write(category, title, s_Name, nick, contents);
	if(result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시글이 작성되었습니다')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('알 수 없는 오류가 발생했습니다.')");
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