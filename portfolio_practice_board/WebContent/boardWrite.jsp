<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="boardCss.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo|Faster+One|Londrina+Solid|Alegreya+Sans+SC:900|Ubuntu:500|Allerta+Stencil|Do+Hyeon|Jua" rel="stylesheet">
<style>
</style>
</head>
<body>
<%
String s_Name = null;
if(session.getAttribute("s_Name") != null) {
	s_Name = (String) session.getAttribute("s_Name");
}
if(s_Name != null) {
%>
<div id="wrap">
<header id="fixed">
<div id="mainDis">
<svg class="icon" height="20" width="20" viewBox="0 0 24 24">
<path d="M10 16c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6m13.12 2.88l-4.26-4.26A9.842 9.842 0 0 0 20 10c0-5.52-4.48-10-10-10S0 4.48 0 10s4.48 10 10 10c1.67 0 3.24-.41 4.62-1.14l4.26 4.26a3 3 0 0 0 4.24 0 3 3 0 0 0 0-4.24"></path>
</svg>
<div class="logo"><a href="index.jsp" class="logoText">PIXEL</a></div>
<input type="text" class="mainsearch" placeholder="검색">
<ul class="ul1">
<li class="visible"><input type="image" class="butCss" id="usertie" src="image/user-tie.png">
<div class="trian"></div>
<div class="sub"><h3>개인정보관리</h3>
<ul>
	<li><a href="#">개인정보수정</a></li>
	<li><a href="#">나의활동내역</a></li>
	<li><a href="logoutAction.jsp">로그아웃</a></li>
</ul>	
</div></li>
<li class="visible"><a href="#" class="butCss" id="message"><p>메시지</p><img src="image/bubble.png" class="message"></a>
<div class="trian2"></div>
<div class="msgView"><input type="button" value="받은 메시지" class="receiveMsg"><input type="button" value="보낸 메시지" class="sendMsg">
	<ul>
		<li>
	</ul>
</div></li>
<li class="visible"><a href="#" class="butCss" id="gallery"><p>갤러리</p><img src="image/images.svg" class="gallery"></a></li>
<li class="visible"><a href="board.jsp" class="butCss">게시판</a></li>
<li class="visible"><a href="index.jsp" class="butCss">홈</a></li>
</ul>
</div>
</header>

<div id="container">
<table id="wrTable">
	<tr id="1rowstyle">
		<td><select name="categorySelect" id="categorySelect">
			<option value="chatter">잡담</option>
			<option value="question">질문</option>
			<option value="information">정보</option>
			<option value="tip">팁</option>
		</select></td>
		<td><input type="text" id="titleEdit" name="titleEdit" placeholder="제목" style="width:500px"></td>
	</tr>
</table>
</div>
<%}
else {%>
<script>
location.href="login.jsp";
</script>
<%} %>
</body>
</html>