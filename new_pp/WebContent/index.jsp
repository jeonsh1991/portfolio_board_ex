<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewPort" content="width=device-width", initial-scale="1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 <script>
 	function idNullCheck(){ // 아이디 자동중복체크 스크립트
 		var getID = $('#loginID').val(); // loginID == input type="text" name="id"
 		if(getID==""){
 			$('#idCheckMessage').html("아이디를 입력해주세요.");
 			$('#idCheckMessage').attr('class','fontColorBlue');
 		}else if(/^[a-zA-Z0-9]{5,12}$/.test(getID)) {
 			$.ajax({
 				type: 'POST',
 				url: './idCheck',
 				data: {userID : getID},
 				success: function(result) {
 					if(result==1) {
 						$('#idCheckMessage').html("아이디가 중복됩니다.");
 						$('#idCheckMessage').attr('class','fontColorRed');
 					}else if (result == 0){
 						$('#idCheckMessage').html("사용할 수 있는 아이디입니다.");
 						$('#idCheckMessage').attr('class','fontColorGreen');
 					}
 				}
 			})
 		}
 		else {
 			$('#idCheckMessage').html("아이디는 숫자와 영문자로 5~12자리를 사용해야 합니다.");
			$('#idCheckMessage').attr('class','fontColorRed');
 		}
 	}
 	function loginFunction() { //로그인 진입 스크립트
 		var getID = $('#userID').val();
 		var getPass = $('#userPassword').val();
 		$.ajax({
 			type: 'POST',
 			url: './loginServlet',
 			data: {userID : getID, userPassword : getPass},
 			success: function(result) {
 				if(result==1) {
 					location.href="index.jsp"
 				}else if(result == 0) {
 					$('#checkMessage').html('비밀번호가 틀렸습니다.');
 				}else if(result == -1 ) {
 					$('#checkMessage').html('존재하지 않는 아이디입니다.');
 				}else {
 					$('#checkMessage').html('오류가 발생했습니다. 다시 시도해주세요');
 				}
 			}
 		})
 	}
 	function passSameCheck() { // 비밀번호가 동일한지 확인하는 스크립트
 		var getPass1 = $('#loginPassword1').val();
 		var getPass2 = $('#loginPassword2').val();
 		if(getPass1 != getPass2) {
 			$('#pass2CheckMessage').html("비밀번호가 일치하지 않습니다.");
 			$('#pass2CheckMessage').attr('class', 'fontColorRed');
 		}else {
 			$('#pass2CheckMessage').html("");
 		}
 	}
 	function joinSubmitBtn() {
 		var getID = $('#loginID').val();
 		var getPass1 = $('#loginPassword1').val();
 		var getPass2 = $('#loginPassword2').val();
 		var getName = $('#loginName').val();
 		var getGender = $('#loginGender').val();
 		var getEmail = $('#loginEmail').val();
 		
 		if(getID == "") {
 			$('#idCheckMessage').html("아이디를 입력해주세요.");
 			$('#idCheckMessage').attr('class','fontColorBlue');
 		}else {
 			$('#idCheckMessage').html("");
 		}
 		if (getPass1 == "") {
 			$('#pass1CheckMessage').html("비밀번호를 입력해주세요.");
 			$('#pass1CheckMessage').attr('class','fontColorBlue');
 		}else {
 			$('#pass1CheckMessage').html("");
 		}
 		if (getPass2 == "") {
 			$('#pass2CheckMessage').html("비밀번호 확인을 입력해주세요.");
 			$('#pass2CheckMessage').attr('class','fontColorBlue');
 		}else {
 			$('#pass2CheckMessage').html("");
 		}
 		if (getName == "") {
 			$('#nameCheckMessage').html("이름을 입력해주세요.");
 			$('#nameCheckMessage').attr('class','fontColorBlue');
 		}else {
 			$('#nameCheckMessage').html("");
 		}
 		if (getGender != "male" && getGender != "female") {
 			$('#genderCheckMessage').html("성별을 선택해주세요.");
 			$('#genderCheckMessage').attr('class','fontColorBlue');
 		}else if(getGender == "male" || getGender == "female") {
 			$('#genderCheckMessage').html("");
 		}
 		if (getEmail == "") {
 			$('#emailCheckMessage').html("이메일을 입력해주세요.");
 			$('#emailCheckMessage').attr('class','fontColorBlue');
 		}else {
 			$('#emailCheckMessage').html("");
 		}

 		if (getID!="" && getPass1 != "" && getPass2 != "" && getName != "" && getGender != "genderSelect" && getEmail != "") {
 			if(getPass1 == getPass2) {
 				if(/^[a-zA-Z0-9]{5,12}$/.test(getID)) {
 		 			$.ajax({
 		 				type: 'POST',
 		 				url: './joinAction',
 		 				data: {userID : getID, userPassword : getPass1, userName : getName, userGender : getGender, userEmail : getEmail},
 		 				success: function(result) {
 		 					if(result==1) {
 		 						$('#emailCheckMessage').html("가입 오류가 발생했습니다.");
 		 						$('#emailCheckMessage').attr('class','fontColorRed');
 		 					}else if (result == 0){
 		 						location.href="index.jsp";
 		 						alert("가입이 완료되었습니다. 로그인해주세요.")
 		 					}
 		 				}
 		 			})
 		 		}
 				
 			}else {
 				$('#pass2CheckMessage').html("비밀번호가 일치하지 않습니다.");
 	 			$('#pass2CheckMessage').attr('class', 'fontColorRed');
 			}
 		}
 		
 	}
 </script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {
	font-family: 'Nanum Gothic';
}
.searchMark{
	position: absolute;
	display: inline;
	top: 1em;
	left: 6em;
	opacity: 0.6;
}
#search1 { 
	width: 800px; 
	padding-left: 30px;
}

.backImage1 {
	width:100%;
	height:400px;
	animation: ani1 2s ease-in-out forwards;
}

@keyframes ani1 {
	0% {
	background-color: yellow;
	width: 0;
	height: 0;
	}
	50%{
	width: 100%;
	}
	100%{
	background-color: yellowgreen;
	width:100%;
	height: 400px;
	}
}
.input_underLine {
	border:none;
	border-bottom: 1px solid #ccc;
	width: 300px;
}
.inputLoingType {
	width: 500px;
	padding-left: 15px;
	height: 50px;
	font-size: 15px;
}
#loginTable {
	margin:0 auto;
}
.fontColorRed {
	color: red;
}
.fontColorGreen {
	color: green;
}
.fontColorBlue {
	color: blue;
}
.loginFirst{
	margin-left: 100px;

}
.loginSecond {
	float:left;
	width:100px;
	height: 200px;
	border-right: 1px solid #ccc;
}
.naverAPI {
	width: 300px;
	margin-left: 100px;
}

@media all and (max-width:1000px) {
#search1 { width: 300px; }
}
</style>
</head>
<body>
<%System.out.println("세션"+session.getAttribute("s_Name")); %>
<nav class="navbar navbar-default" style="margin: 0 auto; position: fixed; width:100%;">
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- 홈페이지 오른쪽가장자리에 화면이 작아졌을때 메뉴창을 토글할수있는 버튼을 만든다. -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <!-- data-target에서 #이름 으로 정해주고 아래에서 토글될 메뉴버튼들을 만들어준다. -->
			<span class="sr-only"></span>
			<span class="icon-bar"></span> <!-- icon-bar는 토클버튼에 가로줄이다 여러개만들수록 가로줄이 많아진다. -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">실험</a>
		</div>
		<!-- 검색기능. form을 사용하여 검색값을 파라미터로 넘겼다.-->
		<form class="navbar-form navbar-left">
				<div class="form-group">
					<svg class="searchMark" height="20" width="20" viewBox="0 0 24 24">
					<path d="M10 16c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6m13.12 2.88l-4.26-4.26A9.842 9.842 0 0 0 20 10c0-5.52-4.48-10-10-10S0 4.48 0 10s4.48 10 10 10c1.67 0 3.24-.41 4.62-1.14l4.26 4.26a3 3 0 0 0 4.24 0 3 3 0 0 0 0-4.24"></path>
					</svg>
					<input type="text" class="form-control" id="search1" placeholder="검색" >
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		<!-- id에 위에 data-target이름을 넣었다. 이 밑의 내용은 화면이 작아졌을 시 토글버튼 활성화시 들어가게된다. -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">테스트1<span class="sr-only"></span></a></li>
				<li><a href="#">테스트2</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">드롭다운<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">드롭다운메뉴1</a></li>
						<li><a href="#">드롭다운메뉴2</a></li>
						<li><a href="#">드롭다운메뉴3</a></li>
					</ul>
				</li>
				<li><ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#loginModal" data-toggle="modal">로그인</a></li>
						<li><a href="#joinModal" data-toggle="modal">회원가입</a></li>
					</ul>
				</li>
				</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<container>
<div class="backImage1"></div>
<div class="backImage2"></div>
<div class="backImage3"></div>
<div class="backImage4"></div>
</container>
<div class="modal fade" id="loginModal" role="dialog" style="margin-left: -400px;">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 1000px;">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h1>로그인</h1>
			</div>
			<div class="modal-body">
					<div class="loginFirst" style="float:left;">
						<form method="post">
							<table>
								<tr>
									<td style="align:center"><h2><input type="text" name="userID" id="userID" placeholder="아이디를 입력하세요" class="input_underLine"></h2></td>
								</tr>
								<tr>
									<td style="align:center"><h2><input type="password" name="userPassword" id="userPassword" placeholder="비밀번호를 입력하세요" class="input_underLine"></h2></td>
								</tr>
								<tr>
									<td><p id="checkMessage" style="color:red"></p>
								</tr>
								<tr>
									<td><button type="button" class="btn btn-default" onclick="loginFunction()">로그인</button>
								</tr>
							</table>
						</form>
					</div>
					<div class="loginSecond">
						<div class="verticalLineModal"></div>
					</div>
					<div class="naverAPI" style="float:left;">
						<div id="naverIdLogin"></div>
					</div>
			</div>
			<div class="modal-footer" style="clear:both"><button type="button" class="close" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="joinModal" data-toggle="modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background: #B7F0B1">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<h1>회원양식 작성하기</h1>
				</div>
				<div class="modal-body">
				<form method="post" name="joinForm" id="joinForm" action="joinAction.jsp">
					<table id="loginTable">
						<tr>
							<td><h4 style="font-weight:bold">아이디</h4></td>
						</tr>
						<tr>
							<td><input type="text" id="loginID" placeholder="아이디를 입력해주세요" class="inputLoingType" onkeyup="idNullCheck()"></td>
						</tr>
						<tr>
						<td id="idCheckMessage"></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold">비밀번호</h4></td>
						</tr>
						<tr>
							<td><input type="password" id="loginPassword1" name="loginPassword1" class="inputLoingType" onkeyup="passSameCheck()" placeholder="비밀번호를 입력해주세요"></td>
						</tr>
						<tr>
						<td id="pass1CheckMessage"></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold">비밀번호 확인</h4></td>
						</tr>
						<tr>
							<td><input type="password" id="loginPassword2" name="loginPassword2" class="inputLoingType" onkeyup="passSameCheck()" placeholder="비밀번호를 입력해주세요"></td>
						</tr>
						<tr>
						<td id="pass2CheckMessage"></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold">이름</h4></td>
						</tr>
						<tr>
							<td><input type="text" id="loginName" class="inputLoingType" name="loginName" placeholder="이름을 입력해주세요"></td>
						</tr>
						<tr>
						<tr>
						<td id="nameCheckMessage"></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold">성별</h4></td>
						</tr>
						<tr>
							<td><select id="loginGender" name="loginGender" class="inputLoingType">
									<option value="genderSelect">성별</option>
									<option value="male">남자</option>
									<option value="female">여자</option>
								</select>
							</td>
						</tr>
						<tr>
						<td id="genderCheckMessage"></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold">이메일</h4></td>
						</tr>
						<tr>
							<td><input type="email" id="loginEmail" name="loginEmail"" class="inputLoingType" placeholder="이메일을 입력해주세요"></td>
						</tr>
						<tr>
						<tr>
						<td id="emailCheckMessage"></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-primary btn-block" onclick="joinSubmitBtn()">회원가입</button></td>
					</table>
				</form>	
				</div>
				<div class="modal-footer">
					<button type="button" class="close" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "UIR5lNGJc33VnxYKM2Tc",
			callbackUrl: "http://localhost:8080/naverLoginEX/callback.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>

</body>
</html>