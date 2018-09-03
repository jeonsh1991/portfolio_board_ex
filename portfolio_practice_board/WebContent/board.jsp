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
.selectPage {
	font-weight: bold;
}
#pageTable {
	border: none;
}
#pageTable td {
	padding: 0;
	width: 50px;
	border: 1px solid #ccc;
	border-radius: 3px;
	text-align: center;
	height: 30px;
	background: linear-gradient(to bottom , white, whitesmoke);
}
</style>
</head>
<body>
<%
int pageNumber = 1;
if(request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
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
<li class="visible"><a href="board.jsp?pageNumber=1" class="butCss">게시판</a></li>
<li class="visible"><a href="index.jsp" class="butCss">홈</a></li>
</ul>
</div>
</header>

<div id="container">
<table id="bTable">
	<tr height=35px style="background-color:#4374D9; color: white;">
		<td style="width:100px"><div class="verticalLine">글번호</div></td>
		<td style="width:100px"><div class="verticalLine">공지</div></td>
		<td style="width:700px" ><div class="verticalLine">글제목</div></td>
		<td style="width: 150px"><div class="verticalLine">운영자</div></td>
		<td style="width: 150px"><div class="verticalLine">08-28</div></td>
	</tr>
	<tr>
		<td colspan="5" style="border-bottom: 2px solid #ccc; padding:0;">
	</tr>
	<%
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<Board> list = boardDAO.getList(pageNumber);
	for(int i = 0; i<list.size(); i++){
	%>
	<tr style="background-color:#eee; height:35px; max-height:35px">
		<td style="width:50px"><div class="verticalLine"><%=list.get(i).getNum() %></div></td>
		<td style="width:50px"><div class="verticalLine"><%=list.get(i).getCategory() %></div></td>
		<td style="width:800px" ><div class="verticalLine"><a href="boardView.jsp?num=<%=list.get(i).getNum()%>"><%=list.get(i).getTitle() %></a></div></td>
		<td style="width: 300px"><div class="verticalLine"><%=list.get(i).getNickname() %><span style="color:#ccc">(<%=list.get(i).getuNick() %>)</span></div></td>
		<td style="width: 400px; line-height: 22px;"><div class="verticalLine"><%=list.get(i).getDate().substring(0,11)+list.get(i).getDate().substring(11,13)+"시"+list.get(i).getDate().substring(14,16)+"분" %></div></td>
	</tr>
	<tr>
		<td colspan="5" style="border-bottom: 1px solid #ccc; padding:0;">
	</tr>
	<%} %>
</table>

<br><input type="button" class="boardBtn" value="글쓰기" onclick="javascript:location.href='boardWrite.jsp'">
<table id="pageTable" >
 	<tr>
<%if(pageNumber != 1){ %>
	<td><a href="board.jsp?pageNumber=1" class="pageBack">처음</a></td>
	<td><a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="pageBack">이전</a></td>

<%}
int pageList = boardDAO.pageList(); // 글이 25개 있어서 2+1= 3 3이반환됐다고 가정.


//페이지 넘버 1일때
if(pageNumber == 1 && pageList == 1) { %>
	<td></td>
	<td></td>
	 <td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
	 <td></td>
	 <td></td>
	 
<%
}else if(pageNumber == 1 && pageList == 2) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td></td>
<td></td>
<td></td>
<%
}else if(pageNumber == 1 && pageList == 3) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<td></td>
<td></td>
<%
}else if(pageNumber == 1 && pageList == 4) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+3 %>" class="pageBack"><%=pageNumber+3 %></a></td>
<td></td>
<%
}else if(pageNumber == 1 && pageList >= 5) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+3 %>" class="pageBack"><%=pageNumber+3 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+4 %>" class="pageBack"><%=pageNumber+4 %></a></td>



<% // 페이지넘버 2일때
}else if(pageNumber == 2 && pageList == 2) { %>
<td></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td></td>
<td></td>

<%
}else if(pageNumber == 2 && pageList == 3) { %>
<td></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td></td>
<%
}else if(pageNumber == 2 && pageList == 4) { %>
<td></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<%
}else if(pageNumber == 2 && pageList >= 5) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+3 %>" class="pageBack"><%=pageNumber+3 %></a></td>


<% // 페이지넘버 3이상일때
}else if(pageNumber == 3 && pageList == 3) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td></td>
<td></td>
<%
}else if(pageNumber == 3 && pageList == 4 ) { %> 
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td></td>
<%
}else if(pageNumber == 3 && pageList >= 5 ) { %>
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>


<% // 페이지넘버 4이상일때
}else if(pageNumber == 4 && pageList == 4) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-3 %>" class="pageBack"><%=pageNumber-3 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td></td>
<% 
}else if(pageNumber == 4 && pageList == 5) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-3 %>" class="pageBack"><%=pageNumber-3 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<%
}else if(pageNumber == 4 && pageList > 5) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>



<% // 페이지넘버 5이상일때
}else if(pageNumber > 4 && pageList == pageNumber) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-4 %>" class="pageBack"><%=pageNumber-4 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-3 %>" class="pageBack"><%=pageNumber-3 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<%
}else if(pageNumber > 4 && pageList == pageNumber+1) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-3 %>" class="pageBack"><%=pageNumber-3 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<%
}else if(pageNumber > 4 && pageList == pageNumber+2) { %>  
<td><a href="board.jsp?pageNumber=<%=pageNumber-2 %>" class="pageBack"><%=pageNumber-2 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="pageBack"><%=pageNumber-1 %></a></td>
<td class="selectPage"><a href="board.jsp?pageNumber=<%=pageNumber %>" class="pageBack"><%=pageNumber %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="pageBack"><%=pageNumber+1 %></a></td>
<td><a href="board.jsp?pageNumber=<%=pageNumber+2 %>" class="pageBack"><%=pageNumber+2 %></a></td>
<%}%>

<%
if(boardDAO.nextPage(pageNumber+1)) {
%>
<td><a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="pageBack">다음</a></td>
<%} %>
<td><a href="board.jsp?pageNumber=<%=pageList %>" class="pageBack">끝</a></td>
</tr>
</table>
</div>
</div>
<%}else {%>
<script>
location.href="login.jsp";
</script>
<%} %>
</body>
</html>