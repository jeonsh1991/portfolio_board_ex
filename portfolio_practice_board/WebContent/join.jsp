<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}else {
		document.getElementById("idChk").innerHTML = ""; 
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
			f.submit();
		}else {
			document.getElementById("same").innerHTML = "<font color='Red'>일치하지 않습니다</font>"; 
		}
	}
	
}	
</script>
<style>
body {
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
	padding-top: 10%;
	padding-left: 10%;
}
.a {
	border: none;
	border-bottom: 1px solid #cccccc;
	background-color: white;
	width: 450px;
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
			<input type="text" name="uId" id="uId" class="a" placeholder="아이디"><br><span id="idChk"></span><br>
			<input type="password" name="password1" id="password1" class="a" placeholder="비밀번호" onkeyup="isSame()"><br><span id="pwChk"></span><br>
			<input type="password" name="password2" id="password2" class="a" placeholder="비밀번호 확인" onkeyup="isSame()"><br><span id="same"></span><br>
			<input type="text" id="uName" name="uName" class="a" placeholder="이름"><br><span id="nameChk"></span><br>
			<input type="text" id="uNick" name="uNick" class="a" placeholder="별명" onkeyup="blankChk()"><br><span id="nickChk"></span><br><br>
			<span id="blankChk"></span><br>
			<input type="button" class="b" onclick="f_submit();" value="회원가입">
	</form>
</div>
</body>
</html>