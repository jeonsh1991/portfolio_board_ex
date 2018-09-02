<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function isSame(){ 
	   var getPw1 = document.getElementById("password1").value; 
	   var getPw2 = document.getElementById("password2").value; 
	   console.log("getPwd : " + getPw1); 
	   console.log("getPwdCh : " + getPw2); 
	   if(getPw1!=getPw2){ 
	      document.getElementById("same").innerHTML = "<font color='Red'>일치하지 않습니다</font>"; 
	      }else{ 
	      document.getElementById("same").innerHTML = ""; 
	   } 
	} 
function f_submit(){ 
	var f=document.getElementById("joinForm")
	var getId = document.getElementById("uId").value;
	var getPw3 = document.getElementById("password1").value; 
	var getPw4 = document.getElementById("password2").value;
	var getName = document.getElementById("uName").value;
	var getNick = document.getElementById("uNick").value;
	if(getId==''){
	   document.getElementById("idChk").innerHTML = "<font color='Red'>아이디를 입력해주세요.</font>"; 
	   getId.focus();
	}else if(/^[a-zA-Z0-9]{5,12}$/.test(getId)) {
		document.getElementById("idChk").innerHTML = ""; 
	}else{
		document.getElementById("idChk").innerHTML = "<font color='Red'>아이디는 영문자와 숫자 조합으로 5~12자리를 사용해야 합니다.";
		}
	
	if(getPw3==''){
		 document.getElementById("pwChk").innerHTML = "<font color='Red'>비밀번호를 입력해주세요.</font>"; 
		 getPw3.focus();
	}else {
		document.getElementById("pwChk").innerHTML = ""; 
	}
	if(getPw4==''){
		 document.getElementById("same").innerHTML = "<font color='Red'>비밀번호를 입력해주세요.</font>"; 
		 getPw4.focus();
	}else {
		document.getElementById("same").innerHTML = ""; 
	}
	if(getName==''){
		 document.getElementById("nameChk").innerHTML = "<font color='Red'>이름을 입력해주세요.</font>"; 
		 getName.focus();
	}else {
		document.getElementById("nameChk").innerHTML = ""; 
	}
	if(getNick==''){
		 document.getElementById("nickChk").innerHTML = "<font color='Red'>별명을 입력해주세요.</font>"; 
		 getNick.focus();
	}else {
		document.getElementById("nickChk").innerHTML = ""; 
	}
	if(getId!='' && getPw3!='' && getPw4!='' && getName!='' && getNick!='') {
		if(getPw3==getPw4){
			if(/^[a-zA-Z0-9]{5,12}$/.test(getId)){
				f.submit();
			}else {
				document.getElementById("idChk").innerHTML = "<font color='Red'>아이디는 영문자와 숫자 조합으로 5~12자리를 사용해야 합니다.";				
			}
		}else {
			document.getElementById("same").innerHTML = "<font color='Red'>일치하지 않습니다</font>"; 
		}
	}	
}
function sameIdChk() {
	var getSameChk = document.getElementById("uId").value;
	if(getSameChk == "") {
		alert("먼저 아이디를 입력하세요");
	}else if(!/^[a-zA-Z0-9]{5,12}$/.test(getSameChk)){
		alert("아이디는 영문자와 숫자 조합으로 5~12자리를 사용해야 합니다.");
	}else {
		window.open("checkId.jsp?id="+getSameChk, "", "width=400, height=250, left=100, top=100");
	}
}

</script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo" rel="stylesheet">
<style>
body {
	font-family: 'Nanum Myeongjo', serif;
	background-color: whitesmoke;
}
.logindiv  {
	margin-left: 35%;
	margin-top: 10em;
	border: 1px solid white;
	border-radius: 10px;
	width: 550px;
	height: 600px;
	background-color:white;
}
form {
	font-family: 'Nanum Gothic', sans-serif;
	padding-top: 10%;
	padding-left: 10%;
}
::-webkit-input-placeholder { /* WebKit browsers */
	font-family: 'Nanum Gothic', sans-serif;
    color:    #aaa; 
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	font-family: 'Nanum Gothic', sans-serif;
    color:    #aaa; 
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
	font-family: 'Nanum Gothic', sans-serif;
    color:    #aaa; 
    font-size:12px;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
	font-family: 'Nanum Gothic', sans-serif;
    color:    #aaa; 
}
.a {
	border: none;
	border-bottom: 1px solid #cccccc;
	background-color: white;
	width: 450px;
	height: 35px;
	font-size: 20px;
}
.ab {
	border: none;
	border-bottom: 1px solid #cccccc;
	background-color: white;
	width: 350px;
	height: 35px;
	font-size: 20px;
}
.abbox {
	color: #9DCEFF;
	border: 2px solid #9DCEFF;
	border-radius: 5px;
	background-color: white;
	width:100px;
	height: 35px;
	font-size: 20px;
}
.b {
	border: none;
	color: white;
	width:150px; 
	height:40px; 
	font-size: 20px; 
	background-color: #9DCEFF;
	border-radius: 10px;
}
.b:hover {
	background-color: #4374D9;
}
.b:active {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
<div class="logindiv">
	<div class="loginbox"></div>
	<form method="post" action="joinAction.jsp" name="joinForm" id="joinForm">
			<h1>계정을 생성해 주세요.</h1><br>
			<input type="text" name="uId" id="uId" class="ab" placeholder="아이디"><input type="button" class="abbox" value="중복검사" onclick="sameIdChk()"><br><span id="idChk"></span><br>
			<input type="password" name="password1" id="password1" class="a" placeholder="비밀번호" onkeyup="isSame()"><br><span id="pwChk"></span><br>
			<input type="password" name="password2" id="password2" class="a" placeholder="비밀번호 확인" onkeyup="isSame()"><br><span id="same"></span><br>
			<input type="text" id="uName" name="uName" class="a" placeholder="이름"><br><span id="nameChk"></span><br>
			<input type="text" id="uNick" name="uNick" class="a" placeholder="별명" ><br><span id="nickChk"></span><br><br>
			<span id="blankChk"></span><br>
			<input type="button" class="b" onclick="f_submit();" value="회원가입">
	</form>
</div>
</body>
</html>