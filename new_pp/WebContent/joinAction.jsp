<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
	String s_Name = null;
	if(session.getAttribute("s_Name") != null) {
		s_Name = (String) session.getAttribute("s_Name");
	}

	String userID = request.getParameter("loginID");
	String userPassword = request.getParameter("loginPassword1");
	String userName = request.getParameter("loginName");
	String userGender = request.getParameter("loginGender");
	String userEmail = request.getParameter("loginEmail");
	
	UserDTO dto = new UserDTO();
	UserDAO dao = new UserDAO();
	dto.setUserID(userID);
	dto.setUserPassword(userPassword);
	dto.setUserName(userName);
	dto.setUserGender(userGender);
	dto.setUserEmail(userEmail);
	
	dao.joinAction(dto);
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